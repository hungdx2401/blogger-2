<?xml version="1.0" encoding="UTF-8"?>
<%@page import="katy.bordercollie.controller.ArticleController"%>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="java.util.List"%>
<%@page import="static com.googlecode.objectify.ObjectifyService.ofy"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String siteTitle = "Border Collie Việt Nam.";
	String serverName = "bordercollie.vn";
	String siteDescription = "Border Collie Việt Nam.";
	String dcLanguage = "vi-vn";
	String creator = "Google App Engine";
	List<Article> listArticle = ofy().load().type(Article.class).filter(ArticleController.DB_STATUS_IN,ArticleController.ACCEPT_STATUS).order(ArticleController.DB_ORDER_BY).limit(500).list(); 
%>

  <rss version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:admin="http://webns.net/mvcb/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:content="http://purl.org/rss/1.0/modules/content/">
	
    <channel>
    <title><![CDATA[<%=siteTitle%>]]></title>
    <link><%=serverName%></link>
    <description><![CDATA[<%=siteDescription%>]]></description>
    <dc:language><%=dcLanguage %></dc:language>
    <dc:creator><%=creator %></dc:creator>

    <dc:rights>Copyright 2013 bordercollie.vn</dc:rights>
    <admin:generatorAgent rdf:resource="<%=serverName%>" />
    	<%
    		if(listArticle!=null){
			    for(Article obj: listArticle){
    	%>
			       <item>
			          <title><![CDATA[<%=obj.getTitle()%>]]></title>
			          <link>http://<%=serverName %>/<%=obj.getAlias() %>.html</link>         
			          <comments>http://<%=serverName %>/articles?id=<%=obj.getId() %>#comment</comments>	
			          <description><![CDATA[<%=obj.getDescription()%>]]></description>
			          <pubDate><%=obj.getFormatedDoc()%></pubDate>
			       </item>
		      	<%
		   		}
    		}
       	%>
    </channel>
</rss>  	