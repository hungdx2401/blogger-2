<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<div class="block-header">
		<h2>
			Danh sách bài viết &nbsp;
			<button class="btn btn-default btn-icon" data-ui-sref="article.create" data-ng-click="mactrl.sidebarStat($event)">
				<i class="md md-add"></i>
			</button>
		</h2>
	</div>

	<div class="card" ng-show="listArticle.length>0">
		<br>
		<table class="table table-striped table-vmiddle">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tiêu đề</th>
					<th>Người đăng</th>
					<th>Ngày cập nhật</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="obj in listArticle">
					<td>{{((page-1)*limit + 1) + $index}}</td>
					<td>{{obj.attributes.title}}</td>
					<td>{{obj.attributes.createdBy.replace('@gmail.com','')}}</td>
					<td>{{obj.attributes.updated | date:'dd/MM/yyyy HH:mm'}}</td>
					<td><a href="#/article/edit?id={{obj.id}}"><button class="btn btn-icon command-edit" type="button">
								<span class="md md-edit"></span>
							</button></a> <a href=""><button class="btn btn-icon command-delete" type="button" ng-click="del(obj, $index)">
								<span class="md md-delete"></span>
							</button></a></td>
				</tr>
			</tbody>
		</table>
		<div id="undefined-footer" class="bootgrid-footer container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<ul class="pagination" ng-show="listArticle.length>0">
						<li class="prev {{page>1?'':'disabled'}}" ng-click="changePage(1)">
							<a href="#prev" class="button"><i class="md md-chevron-left"></i></a>
						</li>
						<li class="next" ng-show="page>1" ng-click="changePage(page-1)">
							<a href="#next" class="button">{{page-1}}</a>
						</li>
						<li class="page-1 disabled active">
							<a href="#1" class="button">{{page}}</a>
						</li>
						<li class="next" ng-show="page<=(totalPage-1)" ng-click="changePage(page+1)">
							<a href="#next" class="button">{{page+1}}</a>
						</li>
						<li class="next {{page<totalPage? '':'disabled'}}" ng-click="changePage(totalPage)">
							<a href="#next" class="button"><i class="md md-chevron-right"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-sm-6 infoBar">
					<div class="infos">Hiển thị từ {{((page-1)*limit + 1)}} đến {{(page-1)*limit + listArticle.length}}/{{totalItem}}</div>
				</div>
			</div>
		</div>
	</div>

	<div class="card" ng-show="listArticle.length==0">
		<div class="card-header">
			<span>
				<h2>
					<small>Hệ thống hiện tại chưa có bài viết nào. <a href="" data-ui-sref="article.create" data-ng-click="mactrl.sidebarStat($event)">Đăng bài mới</a></small>
				</h2>
			</span>
		</div>
	</div>

</div>