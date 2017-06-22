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
		<h2>Danh mục mới</h2>
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
			<div class="row" ng-show="obj.attributes.thumbnail.length>0">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img ng-src="{{obj.attributes.thumbnail}}=s260-c" alt="">						
					</div>
				</div>
			</div>
			<div id="fileuploader">Upload ảnh</div>
			<br> <br>			
			<p class="c-black f-500 m-b-5">Mô tả</p>
			<div class="form-group">
				<div class="fg-line">
					<textarea class="form-control" rows="3" placeholder="" ng-model="obj.attributes.description"></textarea>
				</div>
			</div>
						
			<br>
			<button type="button" class="btn btn-primary btn-sm m-t-10" ng-click="save()">Lưu</button>
			<button type="reset" class="btn btn-default btn-sm m-t-10" style="margin-right: 30px">Làm lại</button>
			<button type="button" class="btn bgm-red btn-sm m-t-10" ng-show="action==2" ng-click="del()">Xóa</button>
		</div>
	</div>
</div>
