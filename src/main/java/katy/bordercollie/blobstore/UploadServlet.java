package katy.bordercollie.blobstore;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;

@SuppressWarnings("serial")
public class UploadServlet extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(UploadServlet.class.getName());

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			LOGGER.warning("Called here !");
			String imgKey = BlobKeyProcess.getBlobKeyString(req, "logo");
			ImagesService imagesService = ImagesServiceFactory.getImagesService();
			BlobKey blobKey = new BlobKey(imgKey);
			LOGGER.warning("Key : " + imgKey);
			ServingUrlOptions suo = ServingUrlOptions.Builder.withBlobKey(blobKey);
			LOGGER.warning("Url : " + imagesService.getServingUrl(suo));
			resp.getWriter().println(imagesService.getServingUrl(suo));
		} catch (Exception e) {
			LOGGER.severe(e.getMessage());
		}
	}
}
