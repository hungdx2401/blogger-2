materialAdmin.controller("articleCtrl", [ '$scope', '$http', '$location',
		'$state', 'growlService',
		function($scope, $http, $location, $state, growlService) {
			var idString = $location.search().id;
			$scope.$parent.action = 1;			
			loadCategories($scope, $http);
			if (angular.isDefined(idString) && idString.length > 0) {
				loadArticle($scope, $http, growlService, idString);
			} else {
				$scope.obj = {
					attributes : {
						photos : []
					}
				};
				$scope.$parent.action = 1;
			}
			loadUploaderArticle($scope);
			$scope.save = function() {
				$scope.obj.attributes.content = $("#htmlEditor").code();
				saveArticle($scope, $http, growlService);
			}
			$scope.del = function() {
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
					deleteArticle($scope, $http, growlService);
				});
			}
		} ]);

function loadCategories($scope, $http) {	
	var arequest = $http({
		method : "GET",
		url : "/_admin/categories?page=1&limit=20"
	});
	arequest.success(function(response) {
		if (angular.isDefined(response) && angular.isDefined(response.data)) {
			$scope.categories = response.data;
		}
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		growlService.growl(
				'Không thể lấy danh sách danh mục, vui lòng thử lại sau !',
				'danger');
	});
}

function loadArticle($scope, $http, growlService, idString) {
	var arequest = $http({
		method : "GET",
		url : "/_admin/articles/" + idString
	});
	arequest
			.success(function(response) {
				if (angular.isDefined(response)
						&& angular.isDefined(response.data)) {
					$scope.obj = response.data;
					$("#htmlEditor").code($scope.obj.attributes.content);
					$scope.$parent.action = 2;
				} else {
					$scope.$parent.action = 1;
					growlService.growl('Không tìm thấy thông tin bài viết.',
							'warning');
					setTimeout(function() {
						window.location.replace("/_admin#/article/list");
					}, 2 * 1000);
				}
			});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		$scope.$parent.action = 1;
		growlService.growl('Không thể lấy thông tin bài viết.', 'danger');
		setTimeout(function() {
			window.location.replace("/_admin#/article/list");
		}, 2 * 1000);
	});
}

function saveArticle($scope, $http, growlService) {
	$scope.obj.type = "Article";
	var method = "POST";
	if ($scope.$parent.action == 2) {
		method = "PUT";
	}
	var requestData = {
		data : $scope.obj
	}
	var arequest = $http({
		method : method,
		url : "/_admin/articles",
		data : angular.toJson(requestData)
	});
	arequest.success(function(response) {
		$scope.obj.id = response.data.id;
		$scope.$parent.action = 2;
		growlService.growl('Lưu bài viết thành công.', 'success');
	});
	arequest
			.error(function(data, status, headers, config) {
				growlService.growl(
						'Xảy ra lỗi trong quá trình lưu thông tin bài viết.',
						'danger');
				setTimeout(function() {
					window.location.replace("/_admin#/article/list");
				}, 2 * 1000);
			});
}

function deleteArticle($scope, $http, growlService) {
	var arequest = $http({
		method : "DELETE",
		url : "/_admin/articles?id=" + $scope.obj.id
	});
	arequest.success(function(response) {
		growlService.growl('Xóa bài viết thành công !', 'success');
		setTimeout(function() {
			window.location.replace("/_admin#/article/list");
		}, 1 * 1000);
	});
	arequest.error(function(data, status, headers, config) {
		console.log(data);
		growlService.growl('Không thể lấy thông tin bài viết.', 'danger');
		setTimeout(function() {
			window.location.replace("/_admin#/article/list");
		}, 1 * 1000);
	});
}

function loadUploaderArticle($scope) {
	setTimeout(function() {
		var uploadObj = $('#fileuploader').uploadFile({
			fileName : 'logo',
			multiple : true,
			showStatusAfterSuccess : false,
			onSuccess : function(files, resp, xhr) {
				if (angular.isUndefined($scope.obj.attributes.photos)) {
					$scope.obj.attributes.photos = [];
				}
				$scope.obj.attributes.photos.push(resp);
				$scope.$apply(function() {
				});
			},
			onError : function(files, status, errMsg) {
				console.log(JSON.stringify(errMsg));
			}
		});
	}, 100);
}
