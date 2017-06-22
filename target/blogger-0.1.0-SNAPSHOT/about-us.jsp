<%@page import="katy.bordercollie.helper.StaticItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>Chúng tôi | Border Collie Việt Nam</title>
<meta name="title" content="Giới thiệu về Border Collie Việt Nam"/>			
<meta name="description" content="Giới thiệu về Border Collie Việt Nam"/>
<meta name="keywords" content="border collie việt nam, border collie, chó thông minh"/>	
	
<meta property="og:url" content=""/>
<meta property="og:title" content="Giới thiệu về Border Collie Việt Nam"/>
<meta property="og:type" content="article" />
<meta property="og:description" content="Giới thiệu về Border Collie Việt Nam"/>	
<meta property="og:image" content=""/> 	
<meta property="og:site_name" content="Border Collie Việt Nam"/>
<meta property="fb:admins" content="100000152425373" name="100000152425373"/>	

<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.4.1'></script>
<script src="/js/bootstrap.min.js"></script>


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
                                    <h2 class="title"><a href="#"> Giới thiệu</a></h2>                                                                 
                                </header>                                                 															
								<br>  														      
                                <div class="postContent">
                                	<p>
	                                	JIKE COLLIE  - xuất phát từ tên của Jimmy và Kem là 2 trong số những bạn chó Border Collie lần đầu tiên được nuôi tại Việt Nam. Sau đó đã có nhiều thành viên khác gia nhập gia đình JIKE COLLIE.
										Trại được nuôi hoàn toàn dưới hình thức gia đình - nghĩa là toàn bộ bạn chó được trải nghiệm cuộc sống cùng chủ đúng nghĩa như những người bạn, người thân. 
										Chế độ ăn uống đầy đủ. 
										Không gian sống tuyệt đối thoáng mát đảm bảo sạch sẽ.
										Được vui chơi và tham gia các hoạt động huấn luyện.
										Đảm bảo chăm sóc đầy đủ sức khỏe định kì, thai kì và sau sinh.
									</p>									
			                        <p>
									Xuất phát từ đam mê chơi Border Collie và mong mỏi cho ra đời những lứa chó chất lượng nhất, đưa giống chó Border Collie tạo thành tiếng vang lớn như danh tiếng của chúng hiện nay trên toàn thế giới. Chúng tôi cam kết :
									1. Nhân giống và chọn lọc đưa ra thị trường những lứa chó con thuần chủng và chất lượng nhất. 
									Chất lượng chó bố mẹ đảm bảo mọi tiêu chuẩn của Border Collie. 
									Tuyệt đối từ chối nhân giống và chào bán chó lai, chó tật lỗi.
									2. Bảo hành sức khỏe chó con khi khách hàng tới mua chó với hợp đồng mua bán đầy đủ, rõ ràng.
									3. Hỗ trợ, tư vấn trọn đời về sức khỏe, nuôi dạy, huấn luyện.
									</p>
									<p>Hotline: 0914.719.901 or 0942.039.456.</p>
									<p>Địa chỉ trại : cạnh bến xe Yên Nghĩa - quận Hà Đông - Hà Nội.</p>
									<p>Địa chỉ giao dịch : số 7 - ngõ Bà Triệu - đường Bà Triệu - Hai Bà Trưng - Hà Nội.</p>
									
                                </div>
                                <br><br>
                                <div class="fb-comments" data-href="http://www.bordercollie.vn/" data-numposts="5"></div>
                            </article>        
                                                                         
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
        <footer>
            <div class="container">&copy; 2014 Copyright <a href="/"><?=domain_name?></a></div>
        </footer>
    </div>        
 
    
</body>
</html>