package katy.bordercollie.helper;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;
import katy.bordercollie.entity.Event;
import katy.bordercollie.entity.Page;

public class StaticItem {

	public static LinkedHashMap<String, Article> recents;
	public static ArrayList<String> recentKeys;

	public static HashMap<String, Category> mapCategory;
	public static List<Event> events;
	public static List<Page> pages;

	static {
		mapCategory = new HashMap<String, Category>();
		List<Category> listCategories = ofy().load().type(Category.class).list();
		if (listCategories.size() > 0) {
			for (Category c : listCategories) {
				mapCategory.put(c.getId(), c);
			}
		}
	}

	public static void addRecentView(Article article) {
		if (recents == null) {
			recents = new LinkedHashMap<String, Article>();
		}
		if (recents.containsKey(article.getId())) {
			recents.remove(article.getId());
		}
		recents.put(article.getId(), article);
		recentKeys = new ArrayList<String>(recents.keySet());
	}
}
