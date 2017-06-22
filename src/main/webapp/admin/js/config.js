materialAdmin
		.config(function($stateProvider, $urlRouterProvider) {
			$urlRouterProvider.otherwise("article/list");

			$stateProvider
					.state('article', {
						url : '/article',
						templateUrl : 'admin/views/common.jsp'
					})
					.state(
							'article.list',
							{
								url : '/list',
								templateUrl : 'admin/views/list-article.jsp',
								controller : 'listArticleCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/jquery.bootgrid/dist/jquery.bootgrid.min.css', ]
														},
														{
															name : 'vendors',
															files : [ 'admin/vendors/bower_components/jquery.bootgrid/dist/jquery.bootgrid-override.min.js' ]
														} ])
									}
								}
							})
					.state(
							'article.create',
							{
								url : '/create',
								templateUrl : 'admin/views/article-form.jsp',
								controller : 'articleCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css',
																	'admin/css/uploadfile.min.css',
																	'admin/vendors/bower_components/summernote/dist/summernote.css' ]
														},
														{
															name : 'vendors',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js',
																	'admin/vendors/bower_components/summernote/dist/summernote.min.js',
																	'admin/vendors/other/jquery.uploadfile.min.js' ]
														} ])
									}
								}
							})
					.state(
							'article.edit',
							{
								url : '/edit',
								templateUrl : 'admin/views/article-form.jsp',
								controller : 'articleCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css',
																	'admin/css/uploadfile.min.css',
																	'admin/vendors/bower_components/summernote/dist/summernote.css' ]
														},
														{
															name : 'vendors',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js',
																	'admin/vendors/bower_components/summernote/dist/summernote.min.js',
																	'admin/vendors/other/jquery.uploadfile.min.js' ]
														} ])
									}
								}
							})
					.state('category', {
						url : '/category',
						templateUrl : 'admin/views/common.jsp'
					})
					.state(
							'category.list',
							{
								url : '/list',
								templateUrl : 'admin/views/list-category.jsp',
								controller : 'listCategoryCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/jquery.bootgrid/dist/jquery.bootgrid.min.css', ]
														},
														{
															name : 'vendors',
															files : [ 'admin/vendors/bower_components/jquery.bootgrid/dist/jquery.bootgrid-override.min.js' ]
														} ])
									}
								}
							})

					.state(
							'category.create',
							{
								url : '/create',
								templateUrl : 'admin/views/category-form.jsp',
								controller : 'categoryCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css',
																	'admin/css/uploadfile.min.css',
																	'admin/vendors/bower_components/summernote/dist/summernote.css' ]
														},
														{
															name : 'vendors',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js',
																	'admin/vendors/bower_components/summernote/dist/summernote.min.js',
																	'admin/vendors/other/jquery.uploadfile.min.js' ]
														} ])
									}
								}
							})
					.state(
							'category.edit',
							{
								url : '/edit',
								templateUrl : 'admin/views/category-form.jsp',
								controller : 'categoryCtrl',
								resolve : {
									loadPlugin : function($ocLazyLoad) {
										return $ocLazyLoad
												.load([
														{
															name : 'css',
															insertBefore : '#app-level',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css',
																	'admin/css/uploadfile.min.css',
																	'admin/vendors/bower_components/summernote/dist/summernote.css' ]
														},
														{
															name : 'vendors',
															files : [
																	'admin/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js',
																	'admin/vendors/bower_components/summernote/dist/summernote.min.js',
																	'admin/vendors/other/jquery.uploadfile.min.js' ]
														} ])
									}
								}
							})
		});
