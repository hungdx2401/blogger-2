package katy.bordercollie.admin;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.cmd.Query;

import design.java.rest.RESTFactory;
import design.java.rest.RESTGeneralError;
import design.java.rest.RESTGeneralSuccess;
import design.java.rest.entity.RESTDocumentSingle;
import katy.bordercollie.entity.Category;
import katy.bordercollie.helper.IdGenerator;

@SuppressWarnings("serial")
public class CategoryEndpoint extends HttpServlet {
	private static final Logger LOGGER = Logger.getLogger(CategoryEndpoint.class.getSimpleName());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi category endpoint, method GET.");
		int action = 1;
		String[] arrayURI = req.getRequestURI().split("/");
		String id = "";
		if (arrayURI.length == 4) {
			id = arrayURI[arrayURI.length - 1];
			action = 2;
		}
		switch (action) {
		case 1:
			int page = 1;
			int limit = 10;
			int totalPage = 1;
			int totalItem = 1;
			try {
				page = Integer.parseInt(req.getParameter("page"));
				limit = Integer.parseInt(req.getParameter("limit"));
			} catch (Exception e) {
				page = 1;
				limit = 10;
			}
			Query<Category> query = ofy().load().type(Category.class).filter("status", 1);
			totalItem = query.count();
			totalPage = totalItem / limit;
			/*
			 * Thêm một vào tổng số trang nếu chia dư.
			 */
			if (totalItem % limit > 0) {
				totalPage++;
			}
			List<Category> list = query.limit(limit).offset((page - 1) * limit).list();
			RESTFactory.make(RESTGeneralSuccess.OK).putData(list).putMeta("totalPage", totalPage)
					.putMeta("totalItem", totalItem).putMeta("limit", limit).putMeta("page", page).doResponse(resp);
			break;
		case 2:
			Category obj = ofy().load().type(Category.class).id(id).now();
			RESTFactory.make(RESTGeneralSuccess.OK).putData(obj).doResponse(resp);
			break;
		default:
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi category endpoint, method POST.");
		try {
			RESTDocumentSingle document = RESTDocumentSingle.getInstanceFromRequest(req);
			Category obj = document.getData().getInstance(Category.class);
			obj.setId(IdGenerator.generateId());
			obj.setDoc(Calendar.getInstance().getTimeInMillis());
			obj.setUpdated(Calendar.getInstance().getTimeInMillis());
			obj.setStatus(1);
			obj.setCreatedBy(UserServiceFactory.getUserService().getCurrentUser().getEmail());
			ofy().save().entity(obj).now();
			RESTFactory.make(RESTGeneralSuccess.CREATED).putData(obj).doResponse(resp);
		} catch (Exception e) {
			e.printStackTrace(System.err);	
			RESTFactory.make(RESTGeneralError.SERVER_ERROR).doResponse(resp);
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi category endpoint, method PUT.");
		try {
			RESTDocumentSingle document = RESTDocumentSingle.getInstanceFromRequest(req);
			Category obj = document.getData().getInstance(Category.class);
			Category existObj = ofy().load().type(Category.class).id(obj.getId()).now();
			if (existObj == null || existObj.getStatus() == 0) {
				RESTFactory.make(RESTGeneralError.NOT_FOUND).doResponse(resp);
				return;
			}
			existObj.setTitle(obj.getTitle());
			existObj.setDescription(obj.getDescription());
			existObj.setThumbnail(obj.getThumbnail());
			existObj.setUpdated(Calendar.getInstance().getTimeInMillis());
			ofy().save().entity(existObj).now();
			RESTFactory.make(RESTGeneralSuccess.OK).putData(existObj).doResponse(resp);
		} catch (Exception e) {
			e.printStackTrace(System.err);
			RESTFactory.make(RESTGeneralError.SERVER_ERROR).doResponse(resp);
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi category endpoint, method DELETE.");
		try {
			String id = req.getParameter("id");
			if (id == null || id.isEmpty()) {
				RESTFactory.make(RESTGeneralError.BAD_REQUEST).doResponse(resp);
				return;
			}
			Category obj = ofy().load().type(Category.class).id(id).now();
			if (obj == null || obj.getStatus() == 0) {
				RESTFactory.make(RESTGeneralError.NOT_FOUND).doResponse(resp);
				return;
			}
			obj.setStatus(0);
			if (ofy().save().entity(obj).now() != null) {
				RESTFactory.make(RESTGeneralSuccess.OK).doResponse(resp);
			} else {
				RESTFactory.make(RESTGeneralError.SERVER_ERROR).doResponse(resp);
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
			RESTFactory.make(RESTGeneralError.SERVER_ERROR).doResponse(resp);
		}
	}
}
