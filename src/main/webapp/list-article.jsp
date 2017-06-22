<%@page import="katy.bordercollie.controller.ArticleController"%>
<%@page import="katy.bordercollie.helper.StaticItem"%>
<%@page import="katy.bordercollie.entity.Category"%>
<%@page import="java.util.Calendar"%>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/includes/header.jsp" />
<%
	List<Article> listArticle = (List<Article>) request.getAttribute(ArticleController.ATTRIBUTE_LIST_ARTICLE);
	boolean hasNextPage = (Boolean) request.getAttribute(ArticleController.ATTRIBUTE_HAS_NEXT);
	int currentPage = (Integer) request.getAttribute(ArticleController.ATTRIBUTE_PAGE);
	String url = (String) request.getAttribute(ArticleController.ATTRIBUTE_URL);
%>
<body>
	<div id="main" class="site-main">
		<div id="primary" class="content-area">
			<%
				if (listArticle != null && listArticle.size() > 0) {
			%>
			<div id="content" class="site-content" role="main">
				<%
					Calendar cal = Calendar.getInstance();
						for (Article article : listArticle) {
							cal.setTimeInMillis(article.getDoc());
				%>
				<article id="post-116"
					class="post-116 post type-post status-publish format-standard sticky hentry category-books category-writing tag-announcement tag-panache">
					<header class="entry-header">
						<h1 class="entry-title">
							<a href="/articles?id=<%=article.getId()%>" rel="bookmark"><%=article.getTitle()%></a>
						</h1>
						<div class="entry-meta">
							<a class="date-wrap" href="/articles?time=<%=article.getDoc()%>" title="Date <%=article.getDoc()%>" rel="bookmark">
                                <time class="entry-date" datetime="<%=article.getDoc()%>">
                                	Ngày <%=cal.get(Calendar.DATE)%> tháng <%=cal.get(Calendar.MONTH)%>, <%=cal.get(Calendar.YEAR)%>
								</time>
                            </a>							
						</div>
						<!-- .entry-meta -->
					</header>
					<a href="/articles?id=<%=article.getId()%>"><img
						src="<%=article.getPhotos().size() > 0 ? article.getPhotos().get(0) : ""%>" /></a>
					<!-- .entry-header -->
					<div class="entry-content">						
						<%=article.getDescription()%>
					</div>
					<!-- .entry-content -->
					<footer class="entry-meta">						
						<span class="cat-links">
							Đăng bởi <a href="/articles?author=<%=article.getCreatedBy()%>"><%=article.getCreatedBy()%></a>
						</span>
						<%
	                    	if(article.getCategoryId()!=null){
	                    		Category cate = StaticItem.mapCategory.get(article.getCategoryId());
                          		if(cate!=null){
						%>
						<span class="sep"> &bull; </span>
						<span class="tags-links">
							<a href="/articles?category=<%=cate.getId()%>"><%=cate.getTitle() %></a>
						</span>
						<%
	                    	}
						}
						%>
					</footer>
					<!-- .entry-meta -->
				</article>
				<%
					}
				%>
				<!-- #post-## -->
				<nav role="navigation" id="nav-below" class="navigation-paging">
					<h1 class="screen-reader-text">Post navigation</h1>
					<div class="nav-previous">
						<a href="#page/2/"><span class="meta-nav">&larr;</span> Older
							posts</a>
					</div>
				</nav>
				<!-- #nav-below -->
			</div>
			<%
				}
			%>
			<!-- #content -->
		</div>
		<jsp:include page="/includes/sidebar.jsp" />
	</div>
	<jsp:include page="/includes/footer.jsp" />