<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9" data-ng-app="materialAdmin" data-ng-controller="materialadminCtrl as mactrl"><![endif]-->
<![if IE 9 ]>
<html ng-app="materialAdmin" ng-controller="materialadminCtrl as mactrl">
<![endif]>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Border Collie Việt Nam | Trang quản trị</title>

<!-- Vendor CSS -->
<link href="/admin/vendors/socicon/socicon.min.css" rel="stylesheet">
<link href="/admin/vendors/bower_components/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/bower_components/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/bower_components/sweetalert/dist/sweetalert-override.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/bower_components/angular-loading-bar/src/loading-bar.css"
	rel="stylesheet">


<!-- CSS -->
<link href="/admin/css/app.min.1.css" rel="stylesheet" id="app-level">
<link href="/admin/css/app.min.2.css" rel="stylesheet">
<link href="/admin/css/demo.css" rel="stylesheet">

</head>

<body data-ng-class="{ 'sw-toggled': mactrl.layoutType === '1' }">


	<data ui-view></data>

	<!-- Older IE warning message -->
	<!--[if lt IE 9]>
            <div class="ie-warning">
                <h1 class="c-white">Warning!!</h1>
                <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
                <div class="iew-container">
                    <ul class="iew-download">
                        <li>
                            <a href="http://www.google.com/chrome/">
                                <img src="img/browsers/chrome.png" alt="">
                                <div>Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.mozilla.org/en-US/firefox/new/">
                                <img src="img/browsers/firefox.png" alt="">
                                <div>Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com">
                                <img src="img/browsers/opera.png" alt="">
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.apple.com/safari/">
                                <img src="img/browsers/safari.png" alt="">
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                                <img src="img/browsers/ie.png" alt="">
                                <div>IE (New)</div>
                            </a>
                        </li>
                    </ul>
                </div>
                <p>Sorry for the inconvenience!</p>
            </div>   
        <![endif]-->


	<!-- Core -->
	<script src="/admin/vendors/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="/admin/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Angular -->
	<script src="/admin/vendors/angular/angular.min.js"></script>
	<script src="/admin/vendors/angular/angular-route.min.js"></script>
	<script src="/admin/vendors/angular/angular-resource.min.js"></script>
	<script src="/admin/vendors/angular/angular-animate.min.js"></script>

	<!-- Angular Modules -->
	<script
		src="/admin/vendors/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
	<script
		src="/admin/vendors/bower_components/angular-loading-bar/src/loading-bar.js"></script>
	<script
		src="/admin/vendors/bower_components/oclazyload/dist/ocLazyLoad.min.js"></script>

	<!-- Common Vendors -->
	<script
		src="/admin/vendors/bower_components/jquery.nicescroll/jquery.nicescroll.min.js"></script>
	<script
		src="/admin/vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/admin/vendors/bower_components/Waves/dist/waves.min.js"></script>
	<script src="/admin/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>

	<!-- Placeholder for IE9 -->
	<!--[if IE 9 ]>
            <script src="vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
        <![endif]-->


	<!-- App level -->
	<script src="/admin/js/app.js"></script>
	<script src="/admin/js/config.js"></script>
	<script src="/admin/js/controllers.js"></script>
	<script src="/admin/js/services.js"></script>


	<!-- Template Modules -->
	<script src="/admin/js/modules/template.js"></script>
	<script src="/admin/js/modules/ui.js"></script>
	<script src="/admin/js/modules/charts/flot.js"></script>
	<script src="/admin/js/modules/charts/other-charts.js"></script>
	<script src="/admin/js/modules/form.js"></script>
	<script src="/admin/js/modules/table.js"></script>
	<script src="/admin/js/modules/components.js"></script>
	<script src="/admin/js/modules/calendar.js"></script>

	<!-- Controllers -->
	<script src="/admin/js/controllers/list-article-controller.js"></script>
	<script src="/admin/js/controllers/article-controller.js"></script>
	<script src="/admin/js/controllers/list-category-controller.js"></script>
	<script src="/admin/js/controllers/category-controller.js"></script>

</body>
</html>