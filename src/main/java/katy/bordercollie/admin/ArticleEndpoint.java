package katy.bordercollie.admin;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Arrays;
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
import katy.bordercollie.entity.Article;
import katy.bordercollie.helper.IdGenerator;

@SuppressWarnings("serial")
public class ArticleEndpoint extends HttpServlet {
	private static final Logger LOGGER = Logger.getLogger(ArticleEndpoint.class.getSimpleName());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi article endpoint, method GET.");
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
			Query<Article> query = ofy().load().type(Article.class).filter("status in", Arrays.asList(1, 2, 3));
			totalItem = query.count();
			totalPage = totalItem / limit;
			/*
			 * Thêm một vào tổng số trang nếu chia dư.
			 */
			if (totalItem % limit > 0) {
				totalPage++;
			}
			List<Article> list = query.limit(limit).offset((page - 1) * limit).order("-doc").list();
			RESTFactory.make(RESTGeneralSuccess.OK).putData(list).putMeta("totalPage", totalPage)
					.putMeta("totalItem", totalItem).putMeta("limit", limit).putMeta("page", page).doResponse(resp);
			break;
		case 2:
			Article obj = ofy().load().type(Article.class).id(id).now();
			RESTFactory.make(RESTGeneralSuccess.OK).putData(obj).doResponse(resp);
			break;
		default:
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi article endpoint, method POST.");
		try {
			RESTDocumentSingle document = RESTDocumentSingle.getInstanceFromRequest(req);
			Article article = document.getData().getInstance(Article.class);
			article.setId(IdGenerator.generateId());
			article.setDoc(Calendar.getInstance().getTimeInMillis());
			article.setUpdated(Calendar.getInstance().getTimeInMillis());
			article.setStatus(3);
			article.setCreatedBy(UserServiceFactory.getUserService().getCurrentUser().getNickname());
			ofy().save().entity(article).now();
			RESTFactory.make(RESTGeneralSuccess.CREATED).putData(article).doResponse(resp);
		} catch (Exception e) {
			e.printStackTrace(System.err);
			RESTFactory.make(RESTGeneralError.SERVER_ERROR).doResponse(resp);
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi article endpoint, method PUT.");
		try {
			RESTDocumentSingle document = RESTDocumentSingle.getInstanceFromRequest(req);
			Article article = document.getData().getInstance(Article.class);
			Article existArticle = ofy().load().type(Article.class).id(article.getId()).now();
			if (existArticle == null || existArticle.getStatus() == 0) {
				RESTFactory.make(RESTGeneralError.NOT_FOUND).doResponse(resp);
				return;
			}
			existArticle.setCategoryId(article.getCategoryId());
			existArticle.setContent(article.getContent());
			existArticle.setDescription(article.getDescription());
			existArticle.setEventId(article.getEventId());
			existArticle.setTitle(article.getTitle());
			existArticle.setPhotos(article.getPhotos());
			existArticle.setTags(article.getTags());
			existArticle.setAlias(article.getAlias());
			existArticle.setUpdated(Calendar.getInstance().getTimeInMillis());
			existArticle.setCreatedBy(UserServiceFactory.getUserService().getCurrentUser().getNickname());
			ofy().save().entity(existArticle).now();
			RESTFactory.make(RESTGeneralSuccess.OK).putData(article).doResponse(resp);
		} catch (Exception e) {
			e.printStackTrace(System.err);
			RESTFactory.make(RESTGeneralError.SERVER_ERROR).doResponse(resp);
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("Gọi article endpoint, method DELETE.");
		try {
			String id = req.getParameter("id");
			if (id == null || id.isEmpty()) {
				RESTFactory.make(RESTGeneralError.BAD_REQUEST).doResponse(resp);
				return;
			}
			Article article = ofy().load().type(Article.class).id(id).now();
			if (article == null || article.getStatus() == 0) {
				RESTFactory.make(RESTGeneralError.NOT_FOUND).doResponse(resp);
				return;
			}
			article.setStatus(0);
			if (ofy().save().entity(article).now() != null) {
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
