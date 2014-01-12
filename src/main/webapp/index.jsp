<%@ page contentType="text/html;charset=utf-8"%>
<html>
  <head>
    <title>U时代国际游学</title>
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
            <li class="active"><a href="/utimes/">首页</a></li>
            <li><a href="aboutus.html">关于U时代</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的U时代 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/utimes/price">游学费用</a></li>
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
    <!-- Responsive slider - START -->
    <div class="responsive-slider-parallax" data-spy="responsive-slider" data-parallax="true" data-parallax-direction="-1" data-transitiontime="1000" data-autoplay="true">
      <div class="slides-container" data-group="slides">
        <ul>
          <li>
            <div class="slide-body" data-group="slide">
              <div class="container">
                <div class="wrapper">
                  <div class="caption header" data-animate="slideAppearRightToLeft" data-delay="0" data-length="300">
                    <h2>U时代游学</h2>
                    <p class="sub text-left" data-animate="slideAppearLeftToRight" data-delay="300" data-length="300"><span>专业的游学机构</span></p>
                    <p class="sub text-left" data-animate="slideAppearLeftToRight" data-delay="500" data-length="300"><span>为您量身定制</span></p>
                    <p class="sub text-left" data-animate="slideAppearLeftToRight" data-delay="700" data-length="300"><span>让您更加优秀</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="slide-body" data-group="slide">
              <div class="container">
                <div class="wrapper">
                  <div class="caption header text-center" data-animate="slideAppearUpToDown" data-delay="0" data-length="300">
                    <h2>U时代宗旨</h2>
                    <p class="sub" data-animate="slideAppearDownToUp" data-delay="300" data-length="300"><span>每个人都能游学世界</span></p>
                    <p class="sub" data-animate="slideAppearDownToUp" data-delay="500" data-length="300"><span>让世界文化交融</span></p>
                    
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="slide-body" data-group="slide">
              <div class="container">
                <div class="wrapper">
                  <div class="caption header text-right" data-animate="slideAppearDownToUp" data-delay="0" data-length="300">
                    <h2>U时代文化</h2>
                    <p class="sub" data-animate="slideAppearUpToDown" data-delay="300" data-length="300"><span>诚挚负责</span></p>
                    <p class="sub" data-animate="slideAppearUpToDown" data-delay="300" data-length="300"><span>笃志求精</span></p>
                    <p class="sub" data-animate="slideAppearUpToDown" data-delay="300" data-length="300"><span>团结奋进</span></p>
                    <p class="sub" data-animate="slideAppearUpToDown" data-delay="300" data-length="300"><span>创新致远</span></p>
                    
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div class="pages-wrapper">
        <ol class="pages">
          <li><a data-jump-to="1">1</a></li>
          <li><a data-jump-to="2">2</a></li>
          <li><a data-jump-to="3">3</a></li>
        </ol>
      </div>
    </div>
    <!-- Responsive slider - END -->

    <!-- Info thumbnails - START -->
    <section>
      <div class="container">
        <div class="row">
          <div class="col-sm-4 col-md-4">
            <a class="info-thumbnail-link" href="#">
            <div class="thumbnail info-thumbnail color-black">
              <div class="caption">
                <h3><span class="fa fa-flag color-lead"></span> Font awesome</h3>
                <p class="description">NEAT template supports as much modern technologies and trends as possible. One of them is font awesome icons. This great set of fonts is avaliable anywere you want on your page. Some of NEAT ui elements are also using font awesome like this info thumbnails.</p>
              </div>
            </div>
            </a>
          </div>
          <div class="col-sm-4 col-md-4">
            <a class="info-thumbnail-link" href="#">
            <div class="thumbnail info-thumbnail background-lead-light">
              <div class="caption">
                <h3><span class="fa fa-group"></span> Color classes</h3>
                <p class="description">You can use template elements as you have them in the examples but if you feel creative you can compose our own color combinations in ui elements. You have beutiful set of flat ui colors to work with just use <i>color-{color-name}</i> or <i>background-{color-name}</i> to change text color or background of any element on the page.</p>
              </div>
            </div>
            </a>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="thumbnail info-thumbnail color-black">
              <div class="caption">
                <h3><span class="fa fa-cogs color-lead"></span> Not a link</h3>
                <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin venenatis velit nibh, sit amet commodo sapien tristique at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras bibendum erat at ultricies rhoncus.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Info thumbnails - END -->

    <!-- Info row - START -->
    <section class="background-clouds">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="info-row">
              <div class="content info">
                <h1 class="info-head">Info row</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque laoreet, lectus vitae hendrerit consequat, tellus sapien tincidunt massa, sit amet convallis libero massa at magna. Aliquam ullamcorper metus eget ultricies auctor. Nulla et iaculis lectus, nec pharetra libero. Vivamus eget urna risus. Nam gravida feugiat consequat. In a risus sit amet dui venenatis sodales.</p>
              </div>
              <div class="content link">
                <a href="#" class="btn btn-lead btn-lg pull-right">Read more</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Info row - END -->

    <!-- Info thumbnails - START -->
    <section>
      <div class="container">
        <h1>Information thumbmnails</h1>
        <div class="row">
          <div class="col-sm-4 col-md-4">
            <div class="info-thumbnail-link">
            <div class="thumbnail info-thumbnail with-icon background-clouds color-text">
              <img src="assets/img/img1.jpg" alt="...">
              <div class="icon">
                <span class="fa-stack">
                  <i class="fa fa-circle fa-stack-2x color-lead"></i>
                  <i class="fa fa-flag fa-stack-1x color-white"></i>
                </span>
              </div>
              <div class="caption bordered background-white">
                <h3>Font awesome</h3>
                <p class="description">NEAT template supports as much modern technologies and trends as possible. One of them is font awesome icons. This great set of fonts is avaliable anywere you want on your page. Some of NEAT ui elements are also using font awesome like this info thumbnails.</p>
                <p class="buttons"><a href="#" class="btn btn-lead">Read more</a></p>
              </div>
            </div>
            </div>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="info-thumbnail-link">
            <div class="thumbnail info-thumbnail with-icon background-clouds color-text">
              <img src="assets/img/img2.jpg" alt="...">
              <div class="icon">
                <span class="fa-stack">
                  <i class="fa fa-circle fa-stack-2x color-lead"></i>
                  <i class="fa fa-inbox fa-stack-1x color-white"></i>
                </span>
              </div>
              <div class="caption bordered background-white">
                <h3>Color classes</h3>
                <p class="description">You can use template elements as you have them in the examples but if you feel creative you can compose our own color combinations in ui elements. You have beutiful set of flat ui colors to work with just use <i>color-{color-name}</i> or <i>background-{color-name}</i> to change text color or background of any element on the page.</p>
                <p class="buttons"><a href="#" class="btn btn-lead">Read more</a></p>
              </div>
            </div>
            </div>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="info-thumbnail-link">
            <div class="thumbnail info-thumbnail with-icon background-clouds color-text">
              <img src="assets/img/img3.jpg" alt="...">
              <div class="icon">
                <span class="fa-stack">
                  <i class="fa fa-circle fa-stack-2x color-alizarin"></i>
                  <i class="fa fa-eye fa-stack-1x color-white"></i>
                </span>
              </div>
              <div class="caption bordered background-white">
                <h3>Some title</h3>
                <p class="description color-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin venenatis velit nibh, sit amet commodo sapien tristique at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras bibendum erat at ultricies rhoncus.</p>
                <p class="buttons"><a href="#" class="btn btn-lead">Read more</a></p>
              </div>
            </div>
          </div>
          </div>
        </div>
        <h1>Information thumbmnails alternatives</h1>
        <div class="row">
          <div class="col-sm-4 col-md-4">
            <div class="info-thumbnail-link">
            <div class="thumbnail info-thumbnail with-icon background-clouds color-black">
              <img src="assets/img/img1.jpg" alt="...">
              <div class="icon">
                <span class="fa-stack">
                  <i class="fa fa-circle fa-stack-2x color-alizarin"></i>
                  <i class="fa fa-flag fa-stack-1x color-white"></i>
                </span>
              </div>
              <div class="caption">
                <h3><span class="fa fa-flag color-alizarin"></span> Font awesome</h3>
                <p class="description">NEAT template supports as much modern technologies and trends as possible. One of them is font awesome icons. This great set of fonts is avaliable anywere you want on your page. Some of NEAT ui elements are also using font awesome like this info thumbnails.</p>
                <p class="buttons"><a href="#" class="btn btn-lead">Read more</a></p>
              </div>
            </div>
            </div>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="info-thumbnail-link">
            <div class="thumbnail info-thumbnail with-icon background-carrot">
              <img src="assets/img/img2.jpg" alt="...">
              <div class="icon">
                <span class="fa-stack">
                  <i class="fa fa-circle fa-stack-2x color-emerald"></i>
                  <i class="fa fa-flag fa-stack-1x color-white"></i>
                </span>
              </div>
              <div class="caption">
                <h3>Color classes</h3>
                <p class="description">You can use template elements as you have them in the examples but if you feel creative you can compose our own color combinations in ui elements. You have beutiful set of flat ui colors to work with just use <i>color-{color-name}</i> or <i>background-{color-name}</i> to change text color or background of any element on the page.</p>
                <p class="buttons"><a href="#" class="btn btn-lead">Read more</a></p>
              </div>
            </div>
            </div>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="thumbnail info-thumbnail with-icon background-clouds color-text">
              <img src="assets/img/img3.jpg" alt="...">
              <div class="icon">
                <span class="fa-stack">
                  <i class="fa fa-circle fa-stack-2x color-lead-dark"></i>
                  <i class="fa fa-flag fa-stack-1x color-white"></i>
                </span>
              </div>
              <div class="caption bordered background-white">
                <h3>No hover effect</h3>
                <p class="description color-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin venenatis velit nibh, sit amet commodo sapien tristique at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras bibendum erat at ultricies rhoncus.</p>
                <p class="buttons"><a href="#" class="btn btn-lead">Read more</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Info thumbnails - END -->

    <section class="image-bg color-white" style="background-image: url(assets/img/image-bg.jpg)">
      <div class="container">
        <div class="reduce-top-margin">
          <h1 class="no-border">They trusted us</h1>
          <div class="row">
            <div class="col-xs-6 col-sm-4 col-md-2">
              <a href="http://w3widget.com" class="thumbnail gallery-thumbnail">
                <img class="img-circle" src="assets/img/w3w-logo.png" alt="...">
              </a>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
              <a href="http://w3widget.com" class="thumbnail gallery-thumbnail">
                <img class="img-circle" src="assets/img/w3w-logo-2.png" alt="...">
              </a>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
              <a href="http://w3widget.com" class="thumbnail gallery-thumbnail">
                <img class="img-circle" src="assets/img/w3w-logo-3.png" alt="...">
              </a>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
              <a href="http://w3widget.com" class="thumbnail gallery-thumbnail">
                <img class="img-circle" src="assets/img/w3w-logo-4.png" alt="...">
              </a>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
              <a href="http://w3widget.com" class="thumbnail gallery-thumbnail">
                <img class="img-circle" src="assets/img/w3w-logo.png" alt="...">
              </a>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
              <a href="http://w3widget.com" class="thumbnail gallery-thumbnail">
                <img class="img-circle" src="assets/img/w3w-logo-3.png" alt="...">
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Calendar - START -->
    <section class="background-concrete color-white">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="no-border">Responsive calendar</h1>
            <p class="lead">With NEAT you are getting the Responsive Calendar plugin. It's a very flexible, multipurpose jQuery calendar widget that you can use on your website. Visit <a href="http://w3widgets.com/responsive-calendar">w3widgets.com/responsive-calendar</a> for more info and documentation.</p>
          </div>
          <div class="col-md-5">
            <!-- Responsive calendar - START -->
            <div class="responsive-calendar background-lead-dark color-white">
              <div class="controls">
                  <a class="btn btn-lead pull-left" data-go="prev"><i class="fa fa-chevron-left"></i></a>
                  <a class="btn btn-lead pull-right" data-go="next"><i class="fa fa-chevron-right"></i></a>
                  <h4 class="timeInfo"></h4>
              </div>
              <div class="day-headers">
                <div class="day header">Mon</div>
                <div class="day header">Tue</div>
                <div class="day header">Wed</div>
                <div class="day header">Thu</div>
                <div class="day header">Fri</div>
                <div class="day header">Sat</div>
                <div class="day header">Sun</div>
              </div>
              <div class="days" data-group="days">
                <!-- the place where days will be generated -->
              </div>
            </div>
            <!-- Responsive calendar - END -->
          </div>
        </div>
      </div>
    </section>
    <!-- Calendar - END -->

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
      if ($(window).width() > 767) {
        matchHeight($('.info-thumbnail .caption .description'), 3);
      }

      $(window).on('resize', function(){
        if ($(window).width() > 767) {
          $('.info-thumbnail .caption .description').height('auto');
          matchHeight($('.info-thumbnail .caption .description'), 3);
        }
      });
    });
    </script>
  </body>
</html>