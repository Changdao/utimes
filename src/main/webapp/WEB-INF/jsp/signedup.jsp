<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Neat template by w3widgets</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href="assets/css/font-awesome.css" rel="stylesheet">
        <link href="assets/css/neat.css" rel="stylesheet" media="screen">

        <!-- Use google font -->
        <link href="assets/css/googlefonts.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="assets/js/html5shiv.js"></script>
          <script src="assets/js/respond.min.js"></script>
        <![endif]-->
  </head>
  <body>
    <nav id="mainMenu" class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.html"><img src="assets/img/logou.png" alt="logo">Utimes</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/utimes">首页</a></li>
                <li><a href="aboutus.html">关于U时代</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的U时代 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="pricing.html">游学费用</a></li>
                    <li><a href="services.html">游学百科</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="gallery.html">海外院校</a></li>
                    <li class="divider"></li>
                    <li><a href="registration.html">注册</a></li>
                    <li><a href="login.html">登录</a></li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">游学人 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="entry-list.html">游学日志</a></li>
                    <li><a href="entry.html">游历见闻</a></li>
                    <li><a href="portfolio.html">影像记录</a></li>
                    <li><a href="portfolio-item.html">Portfolio Item</a></li>
                  </ul>
                </li>
                <li><a href="contact.html">联系U时代</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-search"></span></a>
                  <ul class="dropdown-menu">
                    <li>
                      <form class="form-inline" role="form">
                        <div class="input-group">
                          <input type="text" class="form-control">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">搜索</button>
                          </span>
                        </div>
                      </form>
                    </li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-lock"></span></a>
                  <ul class="dropdown-menu">
                    <li>
                      <form role="form">
                        <div class="form-group">
                          <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox"> Remember me
                          </label>
                        </div>
                        <button type="submit" class="btn btn-default">Login</button>
                        <span class="color-white"><a type="button" class="btn btn-link pull-right" href="register.htm">Register</a></span>
                      </form>
                    </li>
                  </ul>
                </li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div>
        </nav>
    
    <!-- Breadcrumbs - START -->
    <div class="background-clouds breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="index.html">Home</a></li>
          <li class="active">Pages</li>
          <li class="active">Login</li>
        </ol>
      </div>
    </div>
    <!-- Breadcrumbs - END -->

    <section>
      <div class="container">
              <div class="row">
                <div class="col-md-12">
                  <h1 class="no-border">注册成功</h1>
                  <p class="lead">通过U时代，得到优英语能力；通过U时代，获得竞争优势。</p>
                </div>
              </div>
            </div>
    </section>



    <footer class="background-dark-gray color-white">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <h3>Menu</h3>
            <ul class="nav-footer">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">About us</a></li>
              <li><a href="#">Pages</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Portfolio</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-4">
            <h3>Testmonials</h3>
            <p class="testimonial">Proin venenatis velit nibh, sit amet commodo sapien tristique at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras bibendum erat at ultricies rhoncus.</p>
            <p class="author">lkokosz</p>
            <p class="testimonial">Proin venenatis velit nibh, sit amet commodo sapien tristique at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras bibendum erat at ultricies rhoncus.</p>
            <p class="author">lkokosz</p>
          </div>
          <div class="col-md-5">
            <h3>Contact us</h3>
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label for="inputName1" class="col-lg-3 control-label">Name</label>
                <div class="col-lg-9">
                  <input type="text" class="form-control input-lg" id="inputName1" placeholder="Name">
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-3 control-label">Email</label>
                <div class="col-lg-9">
                  <input type="email" class="form-control input-lg" id="inputEmail1" placeholder="Email">
                </div>
              </div>
              <div class="form-group">
                <label for="inputContent1" class="col-lg-3 control-label">Content</label>
                <div class="col-lg-9">
                  <textarea id="inputContent1" class="form-control" rows="3"></textarea>
                </div>
              </div>
              <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                  <button type="submit" class="btn btn-lead btn-lg">Send us an email</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <hr>
            <div class="row">
              <div class="col-md-6">
                All rights reserved &copy; 2013 <a href="http://w3widgets.com">w3widgets.com</a>
              </div>
              <div class="col-md-6">
                <p class="social">
                  <a href="/"><span class="fa fa-facebook"></span></a>
                  <a href="/"><span class="fa fa-twitter"></span></a>
                  <a href="/"><span class="fa fa-youtube"></span></a>
                  <a href="/"><span class="fa fa-linkedin"></span></a>
                  <a href="/"><span class="fa fa-pinterest"></span></a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="assets/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Include slider -->
    <script src="assets/js/jquery.event.move.js"></script>
    <script src="assets/js/responsive-slider.js"></script>
    <script src="assets/js/responsive-calendar.js"></script>

    <script type="text/javascript">
      function matchHeight(objects, cols, nomatch) {
        if (nomatch === undefined) nomatch = false;

        var i, j, group, height, max, objIndex = 0;
        var objCatArr = [];
        var maxHeightArr = [];

        for (i = 0; i < objects.length; i++) {
          group = Math.floor((i)/cols);
          if (objCatArr[group] === undefined) {
            objCatArr[group] = [];
          }
          objCatArr[group].push(objects[i]);
        }

        for (i in objCatArr) {
          max = 0;
          for (j in objCatArr[i]) {
            height = $(objCatArr[i][j]).height();
            max = Math.max(max, height);
          }
          maxHeightArr.push(max);
          if (!nomatch)
            $(objCatArr[i]).height(max);
        }

        return maxHeightArr;
      };
    </script>

    <script type="text/javascript">
    $(document).ready(function() {
      function reduceMenu() {
        $('#mainMenu').addClass('scroll');
      }

      function expandMenu() {
        $('#mainMenu').removeClass('scroll');
      }

      $(window).on('scroll', function(){
        if ($(window).scrollTop() > 81) {
          reduceMenu();
        } else {
          expandMenu();
        }
      });

      $('.responsive-calendar').responsiveCalendar({
        time: '2013-05',
        events: {
          "2013-05-30": {"number": 5, "badgeClass": "background-nephritis", "url": "http://w3widgets.com/responsive-slider"},
          "2013-05-26": {"number": 1, "badgeClass": "background-nephritis", "url": "http://w3widgets.com"}, 
          "2013-05-03": {"number": 1, "badgeClass": "background-pomegranate"}, 
          "2013-05-12": {}}
      });
    });

    $(window).load(function(){
      matchHeight($('.info-thumbnail .caption .description'), 3);
    });
    </script>
  </body>
</html>