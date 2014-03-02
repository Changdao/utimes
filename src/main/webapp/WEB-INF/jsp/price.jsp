<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Utimes | School List Prices</title>
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
          <li class="active">Pricing</li>
        </ol>
      </div>
    </div>
    <!-- Breadcrumbs - END -->

    <section class="background-blue color-yellow">
        <div class="container">

            <form id="searchform">
            <div class="row">
                <div class="col-md-3">
                    <h1>Pricing search</h1>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputEmail1" class="control-label">School</label>
                        <div>
                            <select class='form-control' id="schoolselect">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail1" class="control-label">Courses</label>
                        <div>
                            <select class="form-control" id="courseselect">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="weeks" class="control-label">Weeks</label>
                        <div>
                            <input class="form-control" id="weeks" type="text">
                        </div>
                    </div>

                    <a class="btn btn-primary" href="#add" id="comparebtn">Add To Compare </a>
                </div>
            </div> <!-- row -->
            </form>
        </div>
    </section>

    <section class="background-orange color-white">
      <div class="container">
        <h1 class="no-border">Pricing List</h1>
        <div class="row" id="priceBoard">
          <div class="col-sm-6 col-md-3" id="b1">
                      <div class="thumbnail info-thumbnail background-clouds color-text">
                        <div class="pricing-head">
                          <div class="pricing-head-body background-emerald">
                            <div class="price-wrapper color-white">
                              <span class="price"></span><br>
                              <span class="per">Total</span>
                            </div>
                          </div>
                        </div>
                        <div class="special background-midnight-blue color-white" id="schoolName"><h3></h3></div>
                        <div class="caption">
                          <div id="items">

                          </div>
                          <p class="buttons"><a href="#" class="btn btn-primary"><span class="fa fa-shopping-cart"></span> Request</a></p>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-3" id="b2">
                      <div class="thumbnail info-thumbnail background-clouds color-text">
                        <div class="pricing-head">
                          <div class="pricing-head-body background-peter-river">
                            <div class="price-wrapper color-white">
                              <span class="price"></span><br>
                              <span class="per">Total</span>
                            </div>
                          </div>
                        </div>
                        <div class="special background-midnight-blue color-white"  id="schoolName"><h3></h3></div>
                            <div class="caption">
                              <div id="items">

                              </div>
                              <p class="buttons"><a href="#" class="btn btn-primary"><span class="fa fa-shopping-cart"></span> Request</a></p>
                            </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-3" id="b3">
                      <div class="thumbnail info-thumbnail background-clouds color-text">
                        <div class="pricing-head">
                          <div class="pricing-head-body background-sun-flower">
                            <div class="price-wrapper color-white">
                              <span class="price"></span><br>
                              <span class="per">Per Month</span>
                            </div>
                          </div>
                        </div>
                        <div class="special background-midnight-blue color-white"  id="schoolName"><h3></h3></div>
                            <div class="caption">
                              <div id="items">

                              </div>
                              <p class="buttons"><a href="#" class="btn btn-primary"><span class="fa fa-shopping-cart"></span> Request</a></p>
                            </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-3" id="b4">
                      <div class="thumbnail info-thumbnail background-clouds color-text">
                      <div class="pricing-head">
                          <div class="pricing-head-body background-amethyst">
                            <div class="price-wrapper color-white">
                              <span class="price"></span><br>
                              <span class="per">Total</span>
                            </div>
                          </div>
                        </div>
                        <div class="special background-midnight-blue color-white"  id="schoolName"><h3></h3></div>
                            <div class="caption">
                              <div id="items">

                              </div>
                              <p class="buttons"><a href="#" class="btn btn-primary"><span class="fa fa-shopping-cart"></span> Request</a></p>
                            </div>
                      </div>
                    </div>

        </div>
      </div>
    </section>


    <%@include file="/WEB-INF/jsp/footer.jsp" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="assets/js/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Include slider -->
        <script src="assets/js/jquery.event.move.js"></script>
        <script src="assets/js/responsive-slider.js"></script>
        <script src="assets/js/responsive-calendar.js"></script>
        <script src="assets/js/underscore.js"></script>
        <script src="assets/js/backbone.js"></script>

        <script src="assets/js/utimes/pricesearch.js"></script>

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
      matchHeight($('.info-thumbnail .caption .description'), 4);
    });
    </script>

    <script id="formtemplate" type="text/template">
      <option>placeholder</option>
    </script>

    <script id="price_list_template" type="text/tempalte">

           <div class="thumbnail info-thumbnail background-clouds color-text">
             <div class="pricing-head bordered">
               <div class="pricing-head-body background-white">
                 <div class="price-wrapper color-text">
                   <span class="price"></span><br>
                   <span class="per">Total</span>
                 </div>
               </div>
             </div>
             <div class="special background-peter-river color-white" id="school_name"><h3>学费</h3></div>
             <div class="caption">
               <div id="items">

               </div>
               <p class="buttons"><a href="#" class="btn btn-primary" id="Request"><span class="fa fa-shopping-cart"></span> Request</a></p>
             </div>
           </div>

    </script>

    <script id="price_list_item_template" type="text/template">

            <div class="col-md-6"><@- name @></div>
            <div class="col-md-6 text-right"><@- value @></div>

    </script>

  </body>
</html>