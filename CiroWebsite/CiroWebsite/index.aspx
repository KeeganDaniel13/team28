<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CiroWebsite.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,600|Lato:700,900,400|Raleway' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="infinity/landing/assets/css/bootstrap.css">
  <link rel="stylesheet" href="infinity/landing/libs/bower/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="infinity/landing/libs/misc/owl-carousel/owl.carousel.css">
  <link rel="stylesheet" href="infinity/landing/libs/bower/animate.css/animate.min.css">
  <link rel="stylesheet" href="infinity/landing/assets/css/landing-page.css">
  <title>Ciro Landing Page</title>
</head>
<body data-spy="scroll" data-target=".navbar-fixed-top" data-offset="60">
    <div class="wrapper">
    
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#page-menu-collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand animated" href="#">
            <i class="brand-icon fa fa-gg"></i>
            <span class="brand-name">CIRO</span>
          </a>
        </div><!-- .navbar-header -->

        <div class="navbar-collapse collapse" id="page-menu-collapse">
          <div class="navbar-right">
            <ul class="nav navbar-nav">
              <li><a data-scroll href="#header">Home</a></li>
              <li><a data-scroll href="#brief">About</a></li>
                  <li><a data-scroll href="#customs">Customs</a></li>
              <li><a data-scroll href="#subscribe">Contact</a></li>
              <li><a  href="signin.aspx">Login</a></li>
            </ul>
          </div>
        </div><!-- .navbar-collapse -->

      </div><!-- .container -->
    </nav>

    <header id="header">
      <div class="container">
        
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <div class="intro-text">
              <h2 class="section-heading animated">Customs Warehouse Management </h2>
              <p class="section-paragraph">Ciro's Customs Warehouse Management (CWM) Solution Enables Accurate and Timely Electronic Warhousing Declaration Processing</p>
            </div>
          </div>  
        </div>

        <div id="video-container">
          <a id="play-video" href="#" data-toggle="modal" data-target="#video-modal" data-backdrop="true">
            <img src="infinity/landing/assets/images/landing-page/video-bg.png" alt="">
            <span class="play-icon">
              <img src="infinity/landing/assets/images/landing-page/play-icon.png" alt="">
            </span>
          </a>
        </div>
      </div><!-- .container -->
    </header><!-- #header -->

    <div class="modal fade video-modal" id="video-modal" role="dialog">
      <div class="modal-content">
        <iframe src="https://player.vimeo.com/video/160856876" width="860" height="480" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
      </div>
    </div><!-- #video-modal -->

    <section id="features">

      <div class="container">

        <div class="text-center">
          <h2 class="section-heading animated">How we can help you make your importing process smooth</h2>
          <p class="section-paragraph"> Customs plays an integral role in facilitating the movement of goods and people entering or exiting the borders of the Republic. How we can help you
              at Ciro is to make everything easy for you as the user of the software, to keep track and store your goods any warehouse of your choice, with anytime release or transfers.
          </p>
        </div><!-- .text-center -->

        <div class="row text-center">

          <div class="col-md-4">
            <div class="col-inner feature">
              <img src="infinity/landing/assets/svg/tie.svg" alt="icon">
              <h4>Customs Caluclation Metric</h4>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
          </div><!-- /.col -->

          <div class="col-md-4">
            <div class="col-inner feature">
              <img src="infinity/landing/assets/svg/pig.svg" alt="icon">
              <h4>Effective Data Capture</h4>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
          </div><!-- /.col -->

          <div class="col-md-4">
            <div class="col-inner feature">
              <img src="infinity/landing/assets/svg/pointer.svg" alt="icon">
              <h4>Inventory Movement</h4>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
          </div><!-- /.col -->
          
        </div><!-- .row -->
      </div><!-- .container -->
    </section><!-- #features -->

    <section id="brief">
      <div id="brief-img">
        <img src="infinity/landing/assets/images/landing-page/img-1.jpg" alt="">
      </div><!-- #brief-img -->

      <div class="container">
        <div id="brief-text">
          <h2 class="section-heading animated">Know About Us</h2>
          <p class="section-paragraph">CIRO on-demand Customs Warehouse Management solution is specifically designed to allow users to manage goods stored under the customs warehouse procedure by storing information on imported goods and accounts, tracking all movement and activity and enabling accurate and timely electronic declaration processing.</p>
          <ul>
            <li>
              <img class="item-icon" src="infinity/landing/assets/svg/check.svg" alt="">
              <span class="item-text">Validation engine and error alerts</span>
            </li>
            <li>
              <img class="item-icon" src="infinity/landing/assets/svg/check.svg" alt="">
              <span class="item-text">Duty optimization and preference management</span>
            </li>
            <li>
              <img class="item-icon" src="infinity/landing/assets/svg/check.svg" alt="">
              <span class="item-text">Multiple customs warehouse type support</span>
            </li>
          </ul>
        </div><!-- #brief-text -->
      </div><!-- .container -->
    </section><!-- #brief -->

    <section id="states" class="bg-primary">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-6">
            <div class="col-inner text-center">
              <h3 class="counterUp">51</h3>
              <h4>Warehouses</h4>
              <p>If you are a male over the age of 40 and are suffering from weakness, impotence, pain</p>
            </div>
          </div><!-- /.col -->

          <div class="col-md-3 col-sm-6">
            <div class="col-inner text-center">
              <h3 class="counterUp">2542</h3>
              <h4>Active Users</h4>
              <p>Chamomile is known worldwide to be a calming sleep aid, a remedy to ease an upset stomach</p>
            </div>
          </div><!-- /.col -->

          <div class="col-md-3 col-sm-6">
            <div class="col-inner text-center">
              <h3 class="counterUp">8546</h3>
              <h4>Revenue P/A</h4>
              <p>Classical homeopathy is generally defined as a system of medical treatment </p>
            </div>
          </div><!-- /.col -->

          <div class="col-md-3 col-sm-6">
            <div class="col-inner text-center">
              <h3 class="counterUp">1258</h3>
              <h4>Active Countries</h4>
              <p>LASIK is the most commonly performed refractive surgery.</p>
            </div>
          </div><!-- /.col -->
        </div><!-- .row -->
      </div><!-- .container -->
    </section><!-- #states -->

    

    <section id="customs" style="background-color:#fff;">
        <div class="container">
        <div id="brief-text">
          <h2 class="section-heading animated">What is Customs</h2>
          <p class="section-paragraph"> Customs Administration plays an integral role in the facilitation of movement of goods and people entering or exiting the borders of South Africa. 
              Our vision is to offer a world class Customs service which contributes to the stability, health and prosperity of the country, region and world.</p>
          <ul>
              <p>Customs Mandate and Priorities are</p>
            <li>
              <img class="item-icon" src="infinity/landing/assets/svg/check.svg" alt="">
              <span class="item-text">Provide border control management, community protection and Industry protection</span>
            </li>
            <li>
              <img class="item-icon" src="infinity/landing/assets/svg/check.svg" alt="">
              <span class="item-text">Administer trade policy measures and industry schemes</span>
            </li>
            <li>
              <img class="item-icon" src="infinity/landing/assets/svg/check.svg" alt="">
              <span class="item-text">Collect revenue</span>
            </li>
          </ul>
        </div><!-- #brief-text -->
      </div><!-- .container -->
    </section><!-- #customs -->

    <section id="subscribe">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <div class="text-center">
              <h2 class="section-heading animated">Get In Touch</h2>
              <p class="section-paragraph">You can get in touch with us at any time, if you have any queries or questions
                  about our services, and we will try and get back to you as soon as possible.
              </p>
            </div>
          </div><!-- /.col -->
        </div><!-- .row -->

        <div class="subs-form">
          <form action="#" class="form-horizontal">
            <div class="col-md-4">
              <div class="control-wrap">
                <input type="text" class="form-control" placeholder="Your Name">
                <img src="infinity/landing/assets/svg/users.svg" alt="">
              </div>
            </div><!-- /.col -->

            <div class="col-md-4">
              <div class="control-wrap">
                <input type="text" class="form-control" placeholder="Your Email">
                <img src="infinity/landing/assets/svg/email.svg" alt="">
              </div>
            </div><!-- /.col -->

            <div class="col-md-4">
              <input type="submit" value="Submit" class="btn btn-block btn-primary">
            </div><!-- /.col -->
          </form>
        </div>
      </div><!-- .container -->
    </section><!-- #subscribe -->

    <section id="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="col-inner navigation">
              <h2>NAVIGATION</h2>
              <ul class="navigation-menu">
                <li><a href="#">ABOUT US</a></li>
                <li><a href="#">CUSTOMS</a></li>
                <li><a href="#">REGISTER</a></li>
                <li><a href="#">LOGIN</a></li>
                <li><a href="#">CAREERS</a></li>
              </ul>
            </div>
          </div><!-- /.col -->

          <div class="col-md-5 col-md-offset-1">
            <div class="col-inner news">
              <h2>RECENT NEWS</h2>
              <p>Made with infinty - <a href="#">@Ra-Themes</a> - see more of what our creative customers make a <a class="text-primary" href="#">http://rathemes.com</a></p>
              <p>Computer users and programmers have become so accustomed to using Windows <a href="#">@Ra-Themes</a></p>
            </div>
          </div><!-- /.col -->

          <div class="col-md-3 col-md-offset-1">
            <div class="col-inner">
              <h2>PROJECTS</h2>
              <div class="images clearfix">
                <a href="#"><img class="img-responsive" src="infinity/landing/assets/images/103.jpg" alt=""></a>
                <a href="#"><img class="img-responsive" src="infinity/landing/assets/images/102.jpg" alt=""></a>
                <a href="#"><img class="img-responsive" src="infinity/landing/assets/images/101.jpg" alt=""></a>
              </div>

              <div class="icons">
                <a href="#" class="icon"><i class="fa fa-facebook"></i></a>
                <a href="#" class="icon"><i class="fa fa-twitter"></i></a>
                <a href="#" class="icon"><i class="fa fa-google-plus"></i></a>
                <a href="#" class="icon"><i class="fa fa-dribbble"></i></a>
              </div>
            </div>
          </div><!-- /.col -->
        </div><!-- .row -->
      </div><!-- .container -->
    </section><!-- #footer -->
  </div>
  <div id="loading-div">
    <img src="assets/images/landing-page/puff.svg" width="50" alt="">
  </div>
  <script src="infinity/landing/libs/bower/jquery/dist/jquery.js"></script>
  <script src="infinity/landing/libs/bower/bootstrap-sass/assets/javascripts/bootstrap.js"></script>
  <script src="infinity/landing/libs/misc/owl-carousel/owl.carousel.min.js"></script>
  <script src="infinity/landing/libs/bower/smooth-scroll/dist/js/smooth-scroll.min.js"></script>
  <script src="infinity/landing/libs/bower/waypoints/lib/jquery.waypoints.min.js"></script>
  <script src="infinity/landing/libs/bower/counterup/jquery.counterup.min.js"></script>

  <script>

    $(function() {
      $(window).on('load', function(){
        $(document.body).addClass('loading-done');
      });

      //= shrink and expand the navbar 
      $(window).bind('scroll', function () {
        if ($(window).scrollTop() > 50) $('.navbar').addClass('shrink');
        else $('.navbar').removeClass('shrink');
      });

      //= autoplay the video when the modal show up
      autoPlayYouTubeModal();

      //= equal columns height
      matchHeight('#states .col-inner');

      //= counterUp plugin
      $('.counterUp').counterUp({ delay: 10, time: 1500 });

      //= set the max-height property for .navbar-collapse
      $(window).on('load resize orientationchange', function(){
        $('.navbar-collapse').css('max-height', $(window).height() - $('.navbar').height());
      });

      $(document).on('click', '[data-toggle="collapse"]', function(e){
        var $trigger = $(e.target);
        $trigger.is('[data-toggle="collapse"]') || ($trigger = $trigger.parents('[data-toggle="collapse"]'));
        var $target = $($trigger.attr('data-target'));
        if ($target.attr('id') === 'page-menu-collapse')
          $(document.body).toggleClass('navbar-collapse-show', !$trigger.hasClass('collapsed'))
      });

      //= initialize smooth scroll plugin
      smoothScroll.init({
        offset: 60,
        speed: 1000,
        updateURL: false
      });

      // initializing owlCarousel
      $("#owl-slider").owlCarousel({
        slideSpeed : 300,
        paginationSpeed : 400,
        singleItem:true,
        autoPlay: true
      });

      // initialize waypoints for section-headings
      $('.section-heading').waypoint(function(direction) {
        if (direction === 'down') $(this.element).addClass('fadeInUp');
        else $(this.element).removeClass('fadeInUp');
      }, { offset: '96%' });
    });

    autoPlayYouTubeModal = function() {
      $('#play-video').on("click",function() {
        var theModal = $(this).data("target"),
          videoSRC = $('#video-modal iframe').attr('src'),
          videoSRCauto = videoSRC + "?autoplay=1";
        $(theModal + ' iframe').attr('src', videoSRCauto);
        $(theModal + ' button.close').on("click",function() {
          $(theModal + ' iframe').attr('src', videoSRC);
        });
        $('.modal').on("click",function() {
          $(theModal + ' iframe').attr('src', videoSRC);
        });
      });
    };

    matchHeight = function(selector){
      var height, max = 0, $selector = $(selector);
      $selector.each(function(index, item){
        height = $(item).height();
        if (height > max) max = height;
      });
      $selector.height(max);
    };
  </script>
</body>
</html>
