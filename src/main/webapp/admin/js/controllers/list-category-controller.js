materialAdmin.controller("listCategoryCtrl", [
		'$scope',
		'$http',
		'$state',
		'growlService',
		function($scope, $http, $state, growlService) {
			$scope.$parent.action = 0;
			$scope.limit = 10;
			$scope.page = 1;
			$scope.totalPage = 1;
			$scope.totalItem = 1;

			loadListCategory($scope, $http)
			$scope.changePage = function(page) {
				$scope.page = page;
				loadListCategory($scope, $http);
			}
			$scope.del = function(obj, index) {
				swal({
					title : "Có chắc không ?",
					text : "Bài xóa rồi không lấy lại được đâu.",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#F44336",
					confirmButtonText : "Chuẩn, xóa đi",
					cancelButtonText : "Ờ, click nhầm thôi",
					closeOnConfirm : true
				}, function() {
					deleteCategoryAtList($scope, $http, growlService, obj,
							index);
				});
			}
		} ]);

function deleteCategoryAtList($scope, $http, growlService, obj, index) {
	var arequest = $http({
		method : "DELETE",
		url : "/_admin/categories?id=" + obj.id
	});
	arequest.success(function(response) {
		growlService.growl('Xóa thành công !', 'success');
		$scope.listArticle.splice(index, 1);
		setTimeout(function() {
			loadListCategory($scope, $http);
		}, 1 * 1000);
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		growlService.growl('Không thể lấy thông tin danh mục.', 'danger');
		setTimeout(function() {
			loadListCategory($scope, $http);
		}, 1 * 1000);
	});
}

function loadListCategory($scope, $http) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/categories?page=" + $scope.page + "&limit="
				+ $scope.limit
	});
	arequest.success(function(response) {
		if (angular.isDefined(response) && angular.isDefined(response.data)) {
			$scope.list = response.data;
			$scope.limit = response.meta.limit;
			$scope.page = response.meta.page;
			$scope.totalPage = response.meta.totalPage;
			$scope.totalItem = response.meta.totalItem;
		}
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		growlService.growl(
				'Không thể lấy danh sách danh mục, vui lòng thử lại sau !',
				'danger');
	});
}
