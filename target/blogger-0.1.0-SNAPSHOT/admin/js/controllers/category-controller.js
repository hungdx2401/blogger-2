materialAdmin.controller("categoryCtrl", [ '$scope', '$http', '$location',
		'$state', 'growlService',
		function($scope, $http, $location, $state, growlService) {
			var idString = $location.search().id;
			$scope.$parent.action = 1;
			if (angular.isDefined(idString) && idString.length > 0) {
				loadCategory($scope, $http, growlService, idString);
			} else {
				$scope.obj = {
					attributes : {
						thumbnail : ""
					}
				};
				$scope.$parent.action = 1;
			}
			loadUploader($scope);
			$scope.save = function() {
				saveCategory($scope, $http, growlService);
			}
			$scope.del = function() {
				swal({
					title : "Có chắc không ?",
					text : "Xóa rồi không lấy lại được đâu.",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#F44336",
					confirmButtonText : "Chuẩn, xóa đi",
					cancelButtonText : "Ờ, click nhầm thôi",
					closeOnConfirm : true
				}, function() {
					deleteCategory($scope, $http, growlService);
				});
			}
		} ]);

function loadCategory($scope, $http, growlService, idString) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/categories/" + idString
	});
	arequest
			.success(function(response) {
				if (angular.isDefined(response)
						&& angular.isDefined(response.data)) {
					$scope.obj = response.data;
					$scope.$parent.action = 2;
				} else {
					$scope.$parent.action = 1;
					growlService.growl('Không tìm thấy thông tin danh mục.',
							'warning');
					setTimeout(function() {
						window.location.replace("/_admin#/category/list");
					}, 2 * 1000);
				}
			});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		$scope.$parent.action = 1;
		growlService.growl('Không thể lấy thông tin danh mục.', 'danger');
		setTimeout(function() {
			window.location.replace("/_admin#/category/list");
		}, 2 * 1000);
	});
}

function saveCategory($scope, $http, growlService) {
	$scope.obj.type = "Category";
	var method = "POST";
	if ($scope.$parent.action == 2) {
		method = "PUT";
	}
	var requestData = {
		data : $scope.obj
	}
	var arequest = $http({
		method : method,
		url : "/_admin/categories",
		data : angular.toJson(requestData)
	});
	arequest.success(function(response) {
		$scope.obj.id = response.data.id;
		$scope.$parent.action = 2;
		growlService.growl('Lưu thành công.', 'success');
	});
	arequest.error(function(data, status, headers, config) {
		growlService.growl('Xảy ra lỗi trong quá trình lưu thông tin.',
				'danger');
		setTimeout(function() {
			window.location.replace("/_admin#/category/list");
		}, 2 * 1000);
	});
}

function deleteCategory($scope, $http, growlService) {
	var arequest = $http({
		method : "DELETE",
		url : "/_admin/categories?id=" + $scope.obj.id
	});
	arequest.success(function(response) {
		growlService.growl('Xóa thành công !', 'success');
		setTimeout(function() {
			window.location.replace("/_admin#/category/list");
		}, 1 * 1000);
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		growlService.growl('Không thể lấy thông tin danh mục.', 'danger');
		setTimeout(function() {
			window.location.replace("/_admin#/category/list");
		}, 1 * 1000);
	});
}

function loadUploader($scope) {
	setTimeout(function() {
		var uploadObj = $('#fileuploader').uploadFile({
			fileName : 'logo',
			multiple : true,
			showStatusAfterSuccess : false,
			onSuccess : function(files, resp, xhr) {
				if (angular.isUndefined($scope.obj.attributes.thumbnail)) {
					$scope.obj.attributes.thumbnail = "";
				}
				$scope.obj.attributes.thumbnail = resp;
				$scope.$apply(function() {
				});
			},
			onError : function(files, status, errMsg) {
				console.log(JSON.stringify(errMsg));
			}
		});
	}, 100);
}
