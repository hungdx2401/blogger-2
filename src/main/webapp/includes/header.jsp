<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String title = "";
    String description = "";
    String url = "";
    if(request.getParameter("title") != null) {
        title = java.net.URLDecoder.decode(request.getParameter("title"),"UTF-8");
    }
    if(request.getParameter("description") != null) {
        description = java.net.URLDecoder.decode(request.getParameter("description"),"UTF-8");
    }
    if(request.getParameter("url") != null) {
        url = java.net.URLDecoder.decode(request.getParameter("url"),"UTF-8");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>Border Collie Việt Nam</title>
    <!--[if lt IE 9]>
    <script src="./js/html5.js"
            type="text/javascript"></script>
    <![endif]-->
    <meta name='robots' content='noindex,follow'/>
    <link rel='dns-prefetch' href='https://fonts.googleapis.com'/>
    <link rel='stylesheet' id='all-css-0-1' href='./css/style2.css'
          type='text/css' media='all'/>
    <link rel='stylesheet' id='flora-and-fauna-quicksand-css'
          href='https://fonts.googleapis.com/css?family=Quicksand%3A300%2C400%2C700&#038;ver=4.8-RC2-40878'
          type='text/css' media='all'/>
    <link rel='stylesheet' id='flora-and-fauna-sanchez-css'
          href='https://fonts.googleapis.com/css?family=Sanchez%3A400italic%2C400&#038;ver=4.8-RC2-40878'
          type='text/css' media='all'/>
    <link rel='stylesheet' id='demosites-open-sans-css'
          href='https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic,700,700italic&#038;subset=latin,latin-ext'
          type='text/css' media='all'/>
    <script type='text/javascript'
            src='https://code.jquery.com/jquery-1.12.4.min.js'></script>
    <link rel='shortlink' href='<%=url%>'/>
    <!-- Jetpack Open Graph Tags -->

    <meta property="og:type" content="website"/>
    <meta property="og:title" content="<%=title%>"/>
    <meta property="og:description" content="<%=description%>"/>
    <meta property="og:url" content="<%=url%>"/>

    <meta property="og:site_name" content="<%=title%>"/>
    <meta property="og:image" content="./img/sidebar.png"/>
    <meta property="og:locale" content="vi_VN"/>
    <meta property="fb:admins" content="100000152425373" name="100000152425373"/>
    <meta name="twitter:site" content="<%=url%>"/>

    <meta name="theme-color" content="#ffffff"/>
    <meta name="application-name" content="<%=title%>"/>
    <meta name="title" content="<%=title%>"/>
    <meta name="description" content="<%=description%>"/>
</head>

<body
        class="home blog no-customize-support mp6 customizer-styles-applied highlander-enabled highlander-light infinite-scroll">
<div id="page" class="hfeed site">
    <header id="masthead" class="site-header clear" role="banner">
        <div class="hgroup">
            <h1 class="site-title">
                <a href="/" title="Jike Collie" rel="home">Jike Collie</a>
            </h1>
            <h2 class="site-description">"You've never owned a dog until
                you have owned a Border Collie"</h2>
        </div>
        <nav id="site-navigation" class="navigation-main" role="navigation">
            <h1 class="menu-toggle">Menu</h1>
            <div class="screen-reader-text skip-link">
                <a href="#content" title="Skip to content">Skip to content</a>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="/" title="Home Page">Trang Chủ</a></li>
                    <li class="page_item page-item-1"><a href="/rss" title="Stay updated via RSS">Rss</a>
                    </li>
                    <li class="page_item page-item-126"><a href="/sitemap.xml" title="Site map">Site Map</a></li>
                    <li class="page_item page-item-25"><a href="/about-us" title="About us">Giới thiệu</a></li>
                </ul>
            </div>
        </nav>
        <!-- #site-navigation -->
    </header>