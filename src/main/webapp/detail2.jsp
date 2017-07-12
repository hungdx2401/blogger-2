<%@page import="katy.bordercollie.helper.StaticItem"%>
<%@page import="katy.bordercollie.entity.Category"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="java.util.List"%>
 <%
    Article article = (Article)request.getAttribute("article"); 	
 	Calendar cal = Calendar.getInstance();
 	cal.setTimeInMillis(article.getUpdated());
 %>  
<html>
<head>
<title><%=article.getTitle() %> | Border Collie Việt Nam</title>
<meta name="title" content="<%=article.getTitle() %>"/>			
<meta name="description" content="<%=article.getDescription()%>"/>
<meta name="keywords" content="border collie việt nam, border collie, chó thông minh"/>	
	
<meta property="og:url" content=""/>
<meta property="og:title" content="<%=article.getTitle() %>"/>
<meta property="og:type" content="article" />
<meta property="og:description" content="<%=article.getDescription()%>"/>	
<meta property="og:image" content="<%=article.getPhotos().size()>0 ? article.getPhotos().get(0) : "" %>"/> 	
<meta property="og:site_name" content="Border Collie Việt Nam"/>
<meta property="fb:admins" content="100000152425373" name="100000152425373"/>	

<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.4.1'></script>
<script src="/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/blueimp-gallery.min.css">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- css3-mediaqueries.js for IE less than 9 -->
<!--[if lt IE 9]>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<script>
	$(document).ready(function() {
		$("#searchForm .icon-search").click(function(){		
			if($("#searchForm input, #searchForm .icon-search").hasClass("active")) {
				$("#searchForm input, #searchForm .icon-search").removeClass("active");
			} else {
				$("#searchForm input, #searchForm .icon-search").addClass("active");
			}	
		})
	});
</script>
</head>

<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.6&appId=293858427292326";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <!-- content
	================================================== -->
    <div id="master">
        	
       <!-- header
        ================================================== -->
         <jsp:include page="/includes/top.jsp"/>                    
                    
        <!-- main content
        ================================================== -->
        <div id="content">
        	<div class="container">
                <div class="row-fluid">
    
                    <!-- main content
                    ================================================== -->
                    <div id="mainContent" class="span8">
                    	<div id="mainContent_inner">
                            <article>
                                <header>
                                    <div class="postDate">
                                        <time pubdate="" datetime="<%=article.getDoc()%>">
                                            <a href="/articles?time=<%=article.getDoc()%>" title="Date <%=article.getDoc()%>">
                                            	Ngày <%=cal.get(Calendar.DATE)%> tháng <%=cal.get(Calendar.MONTH)%>, <%=cal.get(Calendar.YEAR)%>		                                            			                                            	
                                            </a>
                                        </time>
                                    </div>
                                    <h2 class="title"><a href="#"> <%=article.getTitle() %></a></h2>
                                    <div class="meta">
                                        <div class="category">Đăng bởi <a href="/articles?author=<%=article.getCreatedBy()%>"><%=article.getCreatedBy() %></a></div>
                                         <%
                                        	if(article.getCategoryId()!=null){
                                        		Category cate = StaticItem.mapCategory.get(article.getCategoryId());
                                        		if(cate!=null){
                                      			%>
                                      			<div class="category">Danh mục <a href="/articles?category=<%=cate.getId()%>"><%=cate.getTitle() %></a></div>			
                                      			<%
                                        		}
                                      		}
                                        %>	                                                                                                                                                       
                                    </div>                                
                                </header>                                                 								
								<%-- <%
									if(article.getPhotos()!= null && article.getPhotos().size()>0){
								%>
								<!-- The Gallery as lightbox dialog, should be a child element of the document body -->
								<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
								    <div class="slides"></div>
								    <h3 class="title"></h3>
								    <a class="prev">‹</a>
								    <a class="next">›</a>
								    <a class="close">×</a>
								    <a class="play-pause"></a>
								    <ol class="indicator"></ol>
								</div>								
								<div id="links">
									<%
										for(String photo:article.getPhotos()){
									%>
								    <a href="<%=photo %>" title="Banana">
								        <img src="<%=photo %>=s170-c" alt="Banana">
								    </a>										
								    <%
										}
								    %>    
								</div>
								<br>  
								<%
									}
								%>	 --%>							       
                                <div class="postContent">
                                	<%=article.getContent() %>
                                </div>
                                <br><br>
                                <div class="fb-comments" data-href="http://www.bordercollie.vn/" data-numposts="5"></div>
                            </article>        
                            
                            <%-- <div class="relatedPost">
	                            <div class="row-fluid">
	                            	<?
	                            		if(previous_obj!==null){
	                            	?>
	                            		<div class="span6">&larr; <a href="/<?=previous_obj.getAlias()?>.html"><?=previous_obj.getTitle()?></a></div>
	                            	<?
	                            		}
	                            	?>
	                            	<?
	                            		if(next_obj!==null){
	                            	?>
	                            		<div class="span6 content-right"><a href="/<?=next_obj.getAlias()?>.html"><?=next_obj.getTitle()?></a> &rarr;</div>
	                            	<?
	                            		}
	                            	?>
	                            </div>
                            </div> --%>                    
                        </div>
                    </div>
                    
                    <!-- sidebar
                    ================================================== -->
                    <jsp:include page="/includes/side-bar.jsp"/>
                    
                </div>
            </div>
        </div>            
        
        <!-- AddThis Smart Layers BEGIN -->
		<!-- Go to http://www.addthis.com/get/smart-layers to customize -->
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4df08bdf3f3b1b46"></script>
		<script type="text/javascript">
			  addthis.layers({
				'theme' : 'transparent',
				'share' : {
				  'position' : 'right',
				  'services' : 'facebook,twitter,google_plusone_share,tumblr,email,print,more'
	 
				}
			  });
		</script>
		<!-- AddThis Smart Layers END -->

		
        <?=setting.getAnalytic()?>
        
        <script src="/js/blueimp-gallery.min.js"></script>	
		<script>
		document.getElementById('links').onclick = function (event) {
		    event = event || window.event;
		    var target = event.target || event.srcElement,
		        link = target.src ? target.parentNode : target,
		        options = {index: link, event: event},
		        links = this.getElementsByTagName('a');
		    blueimp.Gallery(links, options);
		};
		</script>
            
        <!-- footer
        ================================================== -->
        <jsp:include page="/includes/bottom.jsp"/>
    </div>        
 
    
</body>
</html>