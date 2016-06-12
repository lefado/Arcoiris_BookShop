<%-- 
    Document   : home2
    Created on : Jan 19, 2016, 1:03:20 PM
    Author     : mason
--%>


<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Arcoiris</title>
        <link href="css/bootstrap-social.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.css" rel="stylesheet" type="text/css"/>

    </head>

    <body id="home" data-spy="scroll" data-target=".navbar" data-offset="100"> <!--Scrollable area -->
        <jsp:include page="includes/header.jsp"></jsp:include> 
            <div class="push-footer">


                <section id="intro">
                    <div class="slogan">
                        <h2><span id="welcome">WELCOME TO </span><span id="arcoiris"><span id="arco1">A</span><span id="arco2">R</span><span id="arco3">C</span><span id="arco4">O</span><span id="arco1">I</span><span id="arco2">R</span><span id="arco3">I</span><span id="arco4">S</span></h2></span>
                        <h3># THE BEST BOOKSHOP ONLINE #</h3>
                    </div>
                    <center>
                        <!--div class="wow fadeInDown" data-wow-duration="0ms" data-wow-delay="1200ms"-->
                            <div class="page-scroll">
                                <a href="#book" id="" class="btn btn-circle">
                                    <i class="fa fa-angle-double-down animated"></i>
                                </a>
                            </div>
                        <!--/div-->
                    </center>
                </section>  



                <!-- Section: about -->
            <jsp:include page="about.jsp"></jsp:include> 
                <!-- /Section: about -->

                <!-- Section: book -->

            <jsp:include page="book.jsp"></jsp:include> 

                <!-- /Section: book -->

                <!-- Section: client -->
            <jsp:include page="client.jsp"></jsp:include> 
                <!-- /Section: client -->

                <!-- Section: contact -->
            <jsp:include page="contact.jsp"></jsp:include> 
                <!-- /Section: contact -->



            </div>
        <jsp:include page="includes/footer.jsp"></jsp:include> 

        <!-- JavaScript -->
        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>        

        <!-- Custom -->
        <script src="js/script.js" type="text/javascript"></script>

        <!-- progress Bar -->
        <script src="js/jquery.isOnScreen.js" type="text/javascript"></script>
        <script>
            $(function () {
                var flag = false;
                $(window).scroll(function () { // bind window scroll event  

                    if (($('.userexperience').length > 0) && !(flag)) { // if target element exists in DOM

                        if ($('.userexperience').is_on_screen()) { // if target element is visible on screen after DOM loaded         

                            flag = true;
                            $(function () {
                                $('.progress-bar').each(function () {
                                    var bar_value = $(this).attr('aria-valuenow') + '%';
                                    $(this).animate({width: bar_value}, {duration: 2000, easing: 'easeOutCirc'});
                                });
                            });
                        }
                    }
                });
            });
        </script>
        <script src="//code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
        <!-- End progress Bar -->   

    </body>    
</html>
