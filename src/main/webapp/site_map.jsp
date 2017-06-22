<%@page import="katy.bordercollie.controller.ArticleController"%>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="java.util.List"%>
<%@page import="static com.googlecode.objectify.ObjectifyService.ofy"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	String serverName = "bordercollie.vn";	
	List<Article> listArticle = ofy().load().type(Article.class).filter(ArticleController.DB_STATUS_IN,ArticleController.ACCEPT_STATUS).order(ArticleController.DB_ORDER_BY).limit(500).list(); 
%>

<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
  <%
  	if(listArticle!=null){
  		for(Article obj: listArticle){
  %>
		<url>
		  <loc>http://<%=serverName %>/articles?id=<%=obj.getId() %></loc>
		</url>
		<%
		}
	}
  %>
</urlset>