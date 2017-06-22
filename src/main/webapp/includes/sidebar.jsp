<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="katy.bordercollie.helper.StaticItem"%>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="katy.bordercollie.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- #primary -->
<div id="secondary" class="widget-area" role="complementary">
	<div>
		<img alt="" src="./img/sidebar.png">
	</div>
	<aside id="search-2" class="widget widget_search">
		<script>
		  (function() {
		    var cx = '004637550750321282625:7pstyzzlaoc';
		    var gcse = document.createElement('script');
		    gcse.type = 'text/javascript';
		    gcse.async = true;
		    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
		    var s = document.getElementsByTagName('script')[0];
		    s.parentNode.insertBefore(gcse, s);
		  })();
		</script>
		<gcse:search></gcse:search>
	</aside>
	<%
		if (StaticItem.mapCategory != null && StaticItem.mapCategory.size() > 0) {
	%>
	<aside id="recent-posts-2" class="widget widget_recent_entries">
		<h1 class="widget-title">Danh mục</h1>
		<ul>
			<%
				for (Entry<String, Category> entry : StaticItem.mapCategory.entrySet()) {
			%>
			<li><a href="#2011/07/07/pellentesque-habitant-posuere/"><%=entry.getValue().getTitle()%></a></li>
			<%
				}
			%>
		</ul>
	</aside>
	<%
		}
	%>
	<%
		if (StaticItem.recents != null && StaticItem.recents.size() > 0) {
	%>
	<aside id="recent-comments-2" class="widget widget_recent_comments">
		<h1 class="widget-title">Đang được theo dõi</h1>
		<table class="recentcommentsavatar" cellspacing="0" cellpadding="0"
			border="0">
			<%
				for (int i = StaticItem.recentKeys.size() - 1; i >= 0; i--) {
						Article article = StaticItem.recents.get(StaticItem.recentKeys.get(i));
			%>
			<tr>
				<td title="<%=article.getTitle() %>" class="recentcommentsavatartop"
					style="height: 48px; width: 48px;"><a
					href="/articles?id=<%=article.getId()%>"> <img alt=''
						src='<%=article.getPhotos().size() > 0 ? article.getPhotos().get(0) : ""%>'
						class='avatar avatar-48' height='48' width='48' />
				</a></td>
				<td class="recentcommentstexttop" style=""><a
					href="/articles?id=<%=article.getId()%>"> <%=article.getTitle()%>
				</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</aside>
	<%
		}
	%>
</div>
<!-- #secondary -->