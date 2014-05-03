<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

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

                <li class="<c:out value="${ activeNav == 'home' ? 'active' : '' }" />"><a href="/utimes">首页</a></li>

                <li><a href="aboutus.html">关于U时代</a></li>
                <li class="dropdown">
                  <a href="#" class="<c:out value="${activeNav == 'my'?'active':''}"/> dropdown-toggle" data-toggle="dropdown">我的U时代 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="pricing.html">游学费用</a></li>
                    <li><a href="services.html">游学百科</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="gallery.html">海外院校</a></li>
                    <li class="divider"></li>
                    <li><a href="register.htm">注册</a></li>
                    <li><a href="login.htm">登录</a></li>
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