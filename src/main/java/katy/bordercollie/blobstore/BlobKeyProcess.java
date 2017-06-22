package katy.bordercollie.blobstore;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class BlobKeyProcess extends HttpServlet {

	private static BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();

	public static List<BlobKey> getListBlobKey(HttpServletRequest request,
			String fieldName) throws IOException {
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		List<BlobKey> blobKeys = blobs.get(fieldName);
		if (blobKeys != null && blobKeys.size() > 0) {
			return blobKeys;
		}
		return new ArrayList<BlobKey>();
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
}
