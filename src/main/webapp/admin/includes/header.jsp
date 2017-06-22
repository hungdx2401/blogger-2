<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="header-inner">
    <li id="menu-trigger" data-target="mainmenu" data-toggle-sidebar data-model-left="mactrl.sidebarToggle.left" data-ng-class="{ 'open': mactrl.sidebarToggle.left === true }">
        <div class="line-wrap">
            <div class="line top"></div>
            <div class="line center"></div>
            <div class="line bottom"></div>
        </div>
    </li>

    <li class="logo hidden-xs">
        <a href="index.html">Trang quản trị - Border Collie Việt Nam {{ layoutSS }}</a>
    </li>

    <li class="pull-right">
        <ul class="top-menu">
           
            <li id="toggle-width">
                <div class="toggle-switch">
                    <input id="tw-switch" type="checkbox" hidden="hidden" data-change-layout="mactrl.layoutType"> 
                    <label for="tw-switch" class="ts-helper"></label>
                </div>
            </li>
            
            <li id="top-search">
                <a class="tm-search" href="" data-ng-click="hctrl.openSearch()"></a>
            </li>
            <li class="dropdown">
                <a data-toggle="dropdown" class="tm-message" href=""><i class="tmn-counts">6</i></a>
                <div class="dropdown-menu dropdown-menu-lg stop-propagate pull-right">
                    <div class="listview">
                        <div class="lv-header">
                            Messages
                        </div>
                        <div class="lv-body c-overflow">
                            <a class="lv-item" ng-href="" ng-repeat="w in hctrl.messageResult.list">
                                <div class="media">
                                    <div class="pull-left">
                                        <img class="lv-img-sm" ng-src="img/profile-pics/{{ w.img }}" alt="">
                                    </div>
                                    <div class="media-body">
                                        <div class="lv-title">{{ w.user }}</div>
                                        <small class="lv-small">{{ w.text }}</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <a class="lv-footer" href="">View All</a>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <a data-toggle="dropdown" class="tm-notification" href=""><i class="tmn-counts">9</i></a>
                <div class="dropdown-menu dropdown-menu-lg stop-propagate pull-right">
                    <div class="listview" id="notifications">
                        <div class="lv-header">
                            Notification

                            <ul class="actions">
                                <li class="dropdown">
                                    <a href="" data-ng-click="hctrl.clearNotification($event)">
                                        <i class="md md-done-all"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="lv-body c-overflow">
                            <a class="lv-item" ng-href="" ng-repeat="w in hctrl.messageResult.list">
                                <div class="media">
                                    <div class="pull-left">
                                        <img class="lv-img-sm" ng-src="img/profile-pics/{{ w.img }}" alt="">
                                    </div>
                                    <div class="media-body">
                                        <div class="lv-title">{{ w.user }}</div>
                                        <small class="lv-small">{{ w.text }}</small>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <a class="lv-footer" href="">View Previous</a>
                    </div>

                </div>
            </li>
            <li class="dropdown hidden-xs">
                <a data-toggle="dropdown" class="tm-task" href=""><i class="tmn-counts">2</i></a>
                <div class="dropdown-menu pull-right dropdown-menu-lg">
                    <div class="listview">
                        <div class="lv-header">
                            Tasks
                        </div>
                        <div class="lv-body">
                            <div class="lv-item">
                                <div class="lv-title m-b-5">HTML5 Validation Report</div>

                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
                                        <span class="sr-only">95% Complete (success)</span>
                                    </div>
                                </div>
                            </div>
                            <div class="lv-item">
                                <div class="lv-title m-b-5">Google Chrome Extension</div>

                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (success)</span>
                                    </div>
                                </div>
                            </div>
                            <div class="lv-item">
                                <div class="lv-title m-b-5">Social Intranet Projects</div>

                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="lv-item">
                                <div class="lv-title m-b-5">Bootstrap Admin Template</div>

                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </div>
                            <div class="lv-item">
                                <div class="lv-title m-b-5">Youtube Client App</div>

                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (danger)</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a class="lv-footer" href="">View All</a>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <a data-toggle="dropdown" class="tm-settings" href=""></a>
                <ul class="dropdown-menu dm-icon pull-right">
                    <li>
                        <a data-ng-click="hctrl.fullScreen()" href=""><i class="md md-fullscreen"></i> Toggle Fullscreen</a>
                    </li>
                    <li>
                        <a data-ng-click="hctrl.clearLocalStorage()" href=""><i class="md md-delete"></i> Clear Local Storage</a>
                    </li>
                    <li>
                        <a href=""><i class="md md-person"></i> Privacy Settings</a>
                    </li>
                    <li>
                        <a href=""><i class="md md-settings"></i> Other Settings</a>
                    </li>
                </ul>
            </li>
            <li class="hidden-xs" data-target="chat" data-toggle-sidebar data-model-right="mactrl.sidebarToggle.right" data-ng-class="{ 'open': mactrl.sidebarToggle.right === true }">
                <a class="tm-chat" href=""></a>
            </li>
        </ul>
    </li>
</ul>

<!-- Top Search Content -->
<div id="top-search-wrap">
    <input type="text">
    <i id="top-search-close" data-ng-click="hctrl.closeSearch()">&times;</i>
</div>

