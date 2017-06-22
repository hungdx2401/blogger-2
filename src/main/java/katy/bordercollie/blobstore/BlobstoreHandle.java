package katy.bordercollie.blobstore;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.urlfetch.FetchOptions;
import com.google.appengine.api.urlfetch.HTTPHeader;
import com.google.appengine.api.urlfetch.HTTPMethod;
import com.google.appengine.api.urlfetch.HTTPRequest;
import com.google.appengine.api.urlfetch.HTTPResponse;
import com.google.appengine.api.urlfetch.URLFetchService;
import com.google.appengine.api.urlfetch.URLFetchServiceFactory;
import com.google.appengine.api.utils.SystemProperty;

@SuppressWarnings("serial")
public class BlobstoreHandle extends HttpServlet {

	private static final Logger log = Logger.getLogger(BlobstoreHandle.class
			.getName());
	public static BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();
	public static BlobInfoFactory infoFactory = new BlobInfoFactory();
	public static ImagesService imagesService = ImagesServiceFactory
			.getImagesService();

	/**
	 * Basic blobstore action
	 * */

	public static String getImageUrl(BlobKey key, String size) {
		try {
			ServingUrlOptions suo = ServingUrlOptions.Builder.withBlobKey(key);
			return imagesService.getServingUrl(suo) + "=s" + size;
		} catch (Exception e) {
			return "";
		}
	}

	public static String getImageUrl(String key, String size) {
		try {
			ServingUrlOptions suo = ServingUrlOptions.Builder
					.withBlobKey(new BlobKey(key));
			return imagesService.getServingUrl(suo) + "=s" + size;
		} catch (Exception e) {
			return "";
		}
	}

	public static BlobInfo getBlobInfor(BlobKey key) {
		return infoFactory.loadBlobInfo(key);
	}

	public static String getBlobKeyString(HttpServletRequest request,
			String fieldName) throws IOException {
		StringBuilder tempString = new StringBuilder();
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		List<BlobKey> blobKeys = blobs.get(fieldName);
		if (blobKeys != null && blobKeys.size() > 0) {
			byte[] arr = blobstoreService.fetchData(blobKeys.get(0), 0, 20);
			if (arr.length > 0) {
				tempString.append(blobKeys.get(0).getKeyString());
			}
		}
		return tempString.toString();
	}

	public static BlobKey getBlobKey(HttpServletRequest request,
			String fieldName) throws IOException {
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		List<BlobKey> blobKeys = blobs.get(fieldName);
		if (blobKeys != null && blobKeys.size() > 0) {
			return blobKeys.get(0);
		}
		return null;
	}

	public static List<BlobKey> getListBlobKey(HttpServletRequest request,
			String fieldName) throws IOException {
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		List<BlobKey> blobKeys = blobs.get(fieldName);
		if (blobKeys != null && blobKeys.size() > 0) {
			return blobKeys;
		}
		return new ArrayList<BlobKey>();
	}

	public static List<BlobKey> getListBlobKey(HttpServletRequest request)
			throws IOException {
		List<BlobKey> listBlobKey = new ArrayList<BlobKey>();
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		if (blobs.size() > 0) {
			for (Entry<String, List<BlobKey>> entry : blobs.entrySet()) {
				listBlobKey.add(entry.getValue().get(0));
			}
		}
		return listBlobKey;
	}

	/**
	 * Send image to blobstore handle
	 * */

	private static final boolean PRODUCTION_MODE = SystemProperty.environment
			.value() == SystemProperty.Environment.Value.Production;
	private static final String URL_PREFIX = PRODUCTION_MODE ? ""
			: "http://localhost:8888";
	private static Random random = new Random();

	/**
	 * cmd = save. Example :
	 * BlobstoreHandle.sendToBlobStore(StringHelper.getId(), "save",
	 * newImage.getImageData(), photoId, infor.getFilename(),
	 * infor.getContentType(), photoNote)
	 * */
	public static boolean sendToBlobStore(String id, String cmd,
			byte[] imageBytes, String photoId, String photoName,
			String photoType, String comment) throws IOException {
		String urlStr = URL_PREFIX
				+ BlobstoreServiceFactory.getBlobstoreService()
						.createUploadUrl(
								"/photo/process?action=1&photoId=" + photoId
										+ "&comment="
										+ URLEncoder.encode(comment, "UTF-8"));
		URLFetchService urlFetch = URLFetchServiceFactory.getURLFetchService();
		HTTPRequest req = new HTTPRequest(new URL(urlStr), HTTPMethod.POST,
				FetchOptions.Builder.withDeadline(30.0));

		String boundary = makeBoundary();

		req.setHeader(new HTTPHeader("Content-Type",
				"multipart/form-data; boundary=" + boundary));

		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		write(baos, "--" + boundary + "\r\n");
		writeParameter(baos, "id", id);
		write(baos, "--" + boundary + "\r\n");
		writeImage(baos, cmd, imageBytes, photoName, photoType);
		write(baos, "--" + boundary + "--\r\n");

		req.setPayload(baos.toByteArray());
		try {
			HTTPResponse response = urlFetch.fetch(req);
			log.severe("Response code : " + response.getResponseCode());
			return response.getResponseCode() == 200 ? true : false;
		} catch (IOException e) {
			// Need a better way of handling Timeout exceptions here - 10 second
			// deadline
			log.severe("Possible timeout?" + e.getMessage());
			return false;
		}
	}

	private static String randomString() {
		return Long.toString(random.nextLong(), 36);
	}

	private static String makeBoundary() {
		return "---------------------------" + randomString() + randomString()
				+ randomString();
	}

	private static void write(OutputStream os, String s) throws IOException {
		os.write(s.getBytes());
	}

	private static void writeParameter(OutputStream os, String name,
			String value) throws IOException {
		write(os, "Content-Disposition: form-data; name=\"" + name
				+ "\"\r\n\r\n" + value + "\r\n");
	}

	private static void writeImage(OutputStream os, String name, byte[] bs,
			String fileName, String fileType) throws IOException {
		write(os, "Content-Disposition: form-data; name=\"" + name
				+ "\"; filename=\"" + fileName + "\"\r\n");
		write(os, "Content-Type: " + fileType + "\r\n\r\n");
		os.write(bs);
		write(os, "\r\n");
	}
}
