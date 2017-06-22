package katy.bordercollie.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.cmd.Query;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;
import katy.bordercollie.helper.StaticItem;

@SuppressWarnings("serial")
public class ArticleController extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(ArticleController.class.getName());

	private static final String CATEGORY_SEARCH_PRE_TITLE = "Bài viết trong danh mục: ";
	private static final String AUTHOR_SEARCH_PRE_TITLE = "Bài viết được đăng bởi: ";
	private static final String TIME_SEARCH_PRE_TITLE = "Bài viết được đăng ngày: ";

	private static final String PARAMETER_ID = "id";
	private static final String PARAMETER_CATEGORY = "category";
	private static final String PARAMETER_AUTHOR = "author";
	private static final String PARAMETER_TIME = "time";
	private static final String PARAMETER_PAGE = "page";
	private static final String PARAMETER_LIMIT = "limit";

	public static final String ATTRIBUTE_ARTICLE = "article";
	public static final String ATTRIBUTE_LIST_ARTICLE = "listArticle";
	public static final String ATTRIBUTE_SERVER = "server";
	public static final String ATTRIBUTE_URL = "url";
	public static final String ATTRIBUTE_PAGE = "currentPage";
	public static final String ATTRIBUTE_LIMIT = "limit";
	public static final String ATTRIBUTE_HAS_NEXT = "hasNext";
	public static final String ATTRIBUTE_TITLE = "title";

	private static final String JSP_DETAIL = "/detail.jsp";
	private static final String JSP_LIST_ARTICLE = "/list-article.jsp";
	private static final String JSP_SEARCH = "/search.jsp";

	public static final String DB_CATEGORY_ID = "categoryId";
	public static final String DB_CREATED_BY = "createdBy";
	public static final String DB_DOC = "doc";
	public static final String DB_STATUS_IN = "status in";
	public static final String DB_ORDER_BY = "-doc";

	private static final int DEFAULT_LIMIT = 10;
	private static final int DEFAULT_PAGE = 1;

	public static final List<Integer> ACCEPT_STATUS = Arrays.asList(1, 2, 3);

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			LOGGER.info("Gọi article controller.");

			// Get detail.
			if (req.getParameter(PARAMETER_ID) != null && !req.getParameter(PARAMETER_ID).isEmpty()) {
				String id = req.getParameter(PARAMETER_ID);
				Article article = ofy().load().type(Article.class).id(id).now();
				if (article == null) {
					resp.sendError(400);
					return;
				}
				StaticItem.addRecentView(article);

				req.setAttribute(ATTRIBUTE_ARTICLE, article);
				req.setAttribute(ATTRIBUTE_SERVER, req.getServerName());
				req.setAttribute(ATTRIBUTE_URL, req.getRequestURL().toString());
				req.getRequestDispatcher(JSP_DETAIL).forward(req, resp);
				return;
			}

			// Get list.
			String view = JSP_LIST_ARTICLE;
			String title = "";
			Query<Article> query = ofy().load().type(Article.class).filter(DB_STATUS_IN, ACCEPT_STATUS);
			if (req.getParameter(PARAMETER_CATEGORY) != null && !req.getParameter(PARAMETER_CATEGORY).isEmpty()) {
				Category category = ofy().load().type(Category.class).id(req.getParameter(PARAMETER_CATEGORY)).now();
				if (category == null) {
					resp.sendError(404);
				}
				query = query.filter(DB_CATEGORY_ID, req.getParameter(PARAMETER_CATEGORY));
				view = JSP_SEARCH;
				title += CATEGORY_SEARCH_PRE_TITLE;
				title += category.getTitle();
			} else if (req.getParameter(PARAMETER_AUTHOR) != null && !req.getParameter(PARAMETER_AUTHOR).isEmpty()) {
				query = query.filter(DB_CREATED_BY, req.getParameter(PARAMETER_AUTHOR));
				view = JSP_SEARCH;
				title += AUTHOR_SEARCH_PRE_TITLE;
				title += req.getParameter(PARAMETER_AUTHOR);
			} else if (req.getParameter(PARAMETER_TIME) != null && !req.getParameter(PARAMETER_TIME).isEmpty()) {
				long searchTimeMLS = Long.parseLong(req.getParameter(PARAMETER_TIME));
				Calendar searchTime = Calendar.getInstance();
				searchTime.setTimeInMillis(searchTimeMLS);
				Calendar startOfDate = getStartOfDay(searchTime);
				Calendar endOfDate = getEndOfDay(searchTime);
				query = query.filter(DB_DOC + " >=", startOfDate.getTimeInMillis());
				query = query.filter(DB_DOC + " <", endOfDate.getTimeInMillis());
				view = JSP_SEARCH;
				title += TIME_SEARCH_PRE_TITLE;
				title += searchTime.get(Calendar.DATE) + "/" + (searchTime.get(Calendar.MONTH) + 1) + "/"
						+ searchTime.get(Calendar.YEAR);
			}	

			int limit = DEFAULT_LIMIT;
			int page = DEFAULT_PAGE;
			try {
				page = Integer.parseInt((String) req.getParameter(PARAMETER_PAGE));
			} catch (Exception e) {
				page = DEFAULT_PAGE;
			}
			try {
				limit = Integer.parseInt((String) req.getParameter(PARAMETER_LIMIT));
			} catch (Exception e) {
				limit = DEFAULT_LIMIT;
			}
			query = query.limit(limit + 1).offset((page - 1) * limit).order(DB_ORDER_BY);
			LOGGER.info("Query: " + query.toString());
			List<Article> listArticle = query.list();

			boolean hasNext = listArticle.size() > limit;
			if (hasNext) {
				listArticle.remove(listArticle.size() - 1);
			}

			req.setAttribute(ATTRIBUTE_LIST_ARTICLE, listArticle);
			req.setAttribute(ATTRIBUTE_PAGE, page);
			req.setAttribute(ATTRIBUTE_LIMIT, limit);
			req.setAttribute(ATTRIBUTE_HAS_NEXT, hasNext);
			req.setAttribute(ATTRIBUTE_SERVER, req.getServerName());
			req.setAttribute(ATTRIBUTE_URL, req.getRequestURL().toString());
			req.setAttribute(ATTRIBUTE_TITLE, title);
			req.getRequestDispatcher(view).forward(req, resp);
		} catch (Exception e) {
			LOGGER.severe("Xảy ra lỗi trong quá trình xử lý home page.");
			e.printStackTrace(System.err);
			resp.sendError(500);
		}
	}

	private static Calendar getStartOfDay(Calendar date) {
		Calendar startOfDate = Calendar.getInstance();
		int year = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH);
		int day = date.get(Calendar.DATE);
		startOfDate.set(year, month, day, 0, 0, 0);
		return startOfDate;
	}

	private static Calendar getEndOfDay(Calendar date) {
		Calendar endOfDate = Calendar.getInstance();
		int year = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH);
		int day = date.get(Calendar.DATE);
		endOfDate.set(year, month, day, 23, 59, 59);
		return endOfDate;
	}

}
