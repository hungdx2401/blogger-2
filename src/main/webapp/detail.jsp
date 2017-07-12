<%@page import="katy.bordercollie.helper.StaticItem"%>
<%@page import="katy.bordercollie.entity.Category"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="katy.bordercollie.entity.Article"%>
<%
    Article article = (Article)request.getAttribute("article");
    Calendar cal = Calendar.getInstance();
    cal.setTimeInMillis(article.getUpdated());
%>
<jsp:include page="/includes/header.jsp" />
<body>
<script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.6&appId=293858427292326";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div id="main" class="site-main">
    <div id="primary" class="content-area">
        <%
            if (article != null) {
        %>
        <div id="content" class="site-content" role="main">
            <article id="post-<%=article.getId()%>"
                     class="post-<%=article.getId()%> post type-post status-publish format-standard sticky hentry category-books category-writing tag-announcement tag-panache">
                <header class="entry-header">
                    <h1 class="entry-title">
                        <a href="/articles?id=<%=article.getId()%>" rel="bookmark"><%=article.getTitle()%></a>
                    </h1>
                    <div class="entry-meta">
                        <a class="date-wrap" href="/articles?time=<%=article.getDoc()%>" title="Date <%=article.getDoc()%>" rel="bookmark">
                            <time class="entry-date" datetime="<%=article.getDoc()%>">
                                Ngày <%=cal.get(Calendar.DATE)%> tháng <%=cal.get(Calendar.MONTH) + 1%>, <%=cal.get(Calendar.YEAR)%>
                            </time>
                        </a>
                    </div>
                    <!-- .entry-meta -->
                </header>
                <a href="/articles?id=<%=article.getId()%>"><img
                        src="<%=article.getPhotos().size() > 0 ? article.getPhotos().get(0) : ""%>" /></a>
                <!-- .entry-header -->
                <div class="entry-content">
                    <%=article.getContent()%>
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
                <div class="fb-comments" data-href="http://www.bordercollie.vn/" data-numposts="5"></div>
            </article>
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