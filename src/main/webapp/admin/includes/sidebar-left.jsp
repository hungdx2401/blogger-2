<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
%>
<div class="sidebar-inner c-overflow">
	<div class="profile-menu">
		<a href="" toggle-submenu>
			<div class="profile-pic">
				<img src="/admin/img/profile-pics/border-1.jpg" alt="">
			</div>
			<div class="profile-info">
				<%=user.getNickname()%>
				<i class="md md-arrow-drop-down"></i>
			</div>
		</a>
		<ul class="main-menu">
			<li>
				<a href="<%=userService.createLogoutURL("/")%>"> <i class="md md-history"></i> Đăng xuất
				</a>
			</li>
		</ul>
	</div>

	<ul class="main-menu">
		<li data-ui-sref-active="active">
			<a data-ui-sref="home" data-ng-click="mactrl.sidebarStat($event)"> <i class="md md-dashboard"></i> Dashboard
			</a>
		</li>
		<li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('article') }">
			<a href="" toggle-submenu> <i class="socicon socicon-stackoverflow"></i> Quản lý bài viết
			</a>
			<ul>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="article.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách bài viết</a>
				</li>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="article.create" data-ng-click="mactrl.sidebarStat($event)">Thêm mới bài viết</a>
				</li>
				<li ng-show="action==2">
					<a data-ui-sref-active="active" data-ui-sref="article.edit" data-ng-click="mactrl.sidebarStat($event)">Sửa bài viết</a>
				</li>
			</ul>
		</li>

		<li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('collection') }">
			<a href="" toggle-submenu> <i class="socicon socicon-yelp"></i> Quản lý sự kiện
			</a>

			<ul>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="collection.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách sự kiện</a>
				</li>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="article.create" data-ng-click="mactrl.sidebarStat($event)">Thêm mới sự kiện</a>
				</li>
			</ul>
		</li>

		<li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('category') }">
			<a href="" toggle-submenu> <i class="socicon socicon-playstation"></i> Quản lý danh mục
			</a>

			<ul>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="category.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách danh mục</a>
				</li>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="category.create" data-ng-click="mactrl.sidebarStat($event)">Thêm mới danh mục</a>
				</li>
				<li ng-show="action==2">
					<a data-ui-sref-active="active" data-ui-sref="category.edit" data-ng-click="mactrl.sidebarStat($event)">Sửa danh mục</a>
				</li>
			</ul>
		</li>

		<li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('collection') }">
			<a href="" toggle-submenu> <i class="socicon socicon-outlook"></i> Quản lý trang tĩnh
			</a>
			<ul>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="collection.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách trang tĩnh</a>
				</li>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="collection.list" data-ng-click="mactrl.sidebarStat($event)">Thêm mới trang tĩnh</a>
				</li>
			</ul>
		</li>

		<li class="sub-menu" data-ng-class="{ 'active toggled': mactrl.$state.includes('collection') }">
			<a href="" toggle-submenu> <i class="socicon socicon-yammer"></i> Quản lý menu
			</a>
			<ul>
				<li>
					<a data-ui-sref-active="active" data-ui-sref="collection.list" data-ng-click="mactrl.sidebarStat($event)">Danh sách hiển thị</a>
				</li>
			</ul>
		</li>

		<li data-ui-sref-active="active">
			<a target="blank" href="/"> <i class="md md-home"></i> Về trang chủ
			</a>
		</li>
	</ul>
</div>