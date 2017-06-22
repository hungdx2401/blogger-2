<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header id="header" data-ng-include src="'/admin/includes/header.jsp'"
	data-ng-controller="headerCtrl as hctrl"></header>
<section id="main">
	<aside id="sidebar" data-ng-include src="'/admin/includes/sidebar-left.jsp'"
		data-ng-class="{ 'toggled': mactrl.sidebarToggle.left === true }"></aside>
	<section id="content" class="page-view" data-ui-view></section>
</section>

<footer id="footer" data-ng-include src="'/admin/includes/footer.jsp'"></footer>

