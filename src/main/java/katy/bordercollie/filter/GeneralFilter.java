package katy.bordercollie.filter;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.googlecode.objectify.ObjectifyService;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;
import katy.bordercollie.entity.Event;
import katy.bordercollie.entity.Page;

public class GeneralFilter implements Filter {

	private static final Logger LOGGER = Logger.getLogger(GeneralFilter.class.getName());

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		/**
		 * Đăng ký objectify class.
		 */
		ObjectifyService.register(Article.class);
		ObjectifyService.register(Category.class);
		ObjectifyService.register(Event.class);
		ObjectifyService.register(Page.class);
		LOGGER.info("Gọi general filter.");
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}
}
