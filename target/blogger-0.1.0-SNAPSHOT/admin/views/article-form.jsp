<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.btn-icon-2 {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	padding: 0px;
	text-align: center;
	position: absolute;
	top: -5px;
	left: 262px;
}
</style>
<div class="container">
	<div class="block-header">
		<h2>Bài viết mới</h2>
	</div>

	<div class="card">

		<div class="card-body card-padding">
			<p class="c-black f-500 m-b-5">Tiêu đề</p>
			<div class="row">
				<div class="col-sm-8">
					<div class="form-group">
						<div class="fg-line">
							<input type="text" class="form-control" placeholder="" ng-model="obj.attributes.title">
						</div>
					</div>
				</div>
			</div>
			<p class="f-500 c-black m-b-20">Ảnh đại diện</p>
			<div class="row" ng-show="obj.attributes.photos.length>0">
				<div class="col-sm-6 col-md-3" ng-repeat="photo in obj.attributes.photos">
					<div class="thumbnail">
						<img ng-src="{{photo}}=s260-c" alt="">
						<button class="btn btn-default btn-icon-2 waves-effect" ng-show="{{photo.length>0}}" ng-click="obj.attributes.photos.splice($index, 1)">
							<i class="md md-close"></i>
						</button>
					</div>
				</div>
			</div>
			<div id="fileuploader">Upload ảnh</div>
			<br> <br>
			<div class="row">
				<div class="col-sm-5 m-b-25">
					<p class="c-black f-500 m-b-5">Danh mục.</p>
					<div class="form-group">
						<div class="fg-line">
							<div class="select">
								<select class="form-control" ng-model="obj.attributes.categoryId">
									<option value="">Chọn danh mục cho bài viết</option>
									<option ng-repeat="category in categories" value="{{category.id}}" ng-selected="obj.attributes.categoryId.length>0&&category.id===obj.attributes.categoryId">{{category.attributes.title}}</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-5 m-b-25">
					<p class="c-black f-500 m-b-5">Sự kiện</p>
					<div class="form-group">
						<div class="fg-line">
							<div class="select">
								<select class="form-control" ng-model="obj.attributes.eventId">
									<option value="">Gắn bài viết với một sự kiện</option>
									<option ng-repeat="event in events" value="{{event.id}}">{{event.title}}</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<p class="c-black f-500 m-b-5">Mô tả</p>
			<div class="form-group">
				<div class="fg-line">
					<textarea class="form-control" rows="3" placeholder="" ng-model="obj.attributes.description"></textarea>
				</div>
			</div>
			<p class="f-500 c-black m-b-20">Nội dung</p>
			<div data-html-editor id="htmlEditor"></div>
			<br>
			<button type="button" class="btn btn-primary btn-sm m-t-10" ng-click="save()">Lưu bài viết</button>
			<button type="reset" class="btn btn-default btn-sm m-t-10" style="margin-right: 30px">Làm lại</button>
			<button type="button" class="btn bgm-red btn-sm m-t-10" ng-show="action==2" ng-click="del()">Xóa bài viết</button>
		</div>
	</div>
</div>
