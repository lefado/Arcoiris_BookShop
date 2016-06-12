<%@page import="com.arcoiris.model.Client"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    List<Client> l = new ArrayList<Client>();
    Client c = new Client();
    l = c.listTopClient("3"); //List LIMIT number of best buyers
%>

<body>

    <section id="client" class="">
        <div class="container">
            <h2>
                <span class="wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">The value most important,</span> 
                <span id="you" class="wow fadeInRightBig" data-wow-duration="1s" data-wow-delay="600ms">is you!</span></h2>
            <center><a href="cClient">
                    <img class="img-circle" src="images/back/client.jpg" alt="Not Found" height="160" width="500" border="1"/>
                </a></center>
            <div class="row" id="info">
                <center><div class="col-lg-4">
                        <h3><i class="fa fa-user"></i>&nbsp;Clients Information</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.Ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
                        <a class="btn btn-default" href="cClient">More Information</a>                                    
                    </div></center>
                <div class="col-lg-4">
                    <center><h3><i class="glyphicon glyphicon-sort-by-attributes"></i>&nbsp;Best Clients</h3></center>                          
                    <ol>
                        <center><h3 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="600ms"><p>1.&nbsp;<%=l.get(0).getUser()%></li></p></center>
                        <center><h4 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="800ms"><p>2.&nbsp;<%=l.get(1).getUser()%></p></h4></center>
                        <center><h5 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1000ms"><p>3.&nbsp;<%=l.get(2).getUser()%></p></h5></center>
                    </ol>
                    <div id="total"  class="wow bounceInDown" data-wow-duration="500ms" data-wow-delay="800ms">
                        <center><h1><i class="fa fa-users"></i>&nbsp;<span class="timer" data-to="6" data-speed="2500" data-from="0"></span></h1></center>
                        <center><h4>Clients in Total</h4></center>  
                    </div>
                </div>
                <center><div class="col-lg-4">
                        <h3><i class="fa fa-eye"></i>&nbsp;Clients Recommendation</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.Ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
                        <a class="btn btn-default" href="cClientBook">Check it Out!</a>
                    </div></center>

            </div>                        
        </div>
    </section>

    <script src="js/jquery.countTo.js" type="text/javascript"></script>
    <script src="js/jquery.isOnScreen.js" type="text/javascript"></script>
    <script>
        $(function () {
            var flag = false;
            $(window).scroll(function () { // bind window scroll event  

                if (($('#total').length > 0) && !(flag)) { // if target element exists in DOM

                    if ($('#total').is_on_screen()) { // if target element is visible on screen after DOM loaded         

                        flag = true;
                        $(function () {
                            $('.timer').each(count);

                            function count(options) {

                                var $this = $(this);
                                options = $.extend({}, options || {}, $this.data('countToOptions') || {});
                                $this.countTo(options); //Call function included at jquery.coountTo.js
                                //This function generate the animation from-to counter
                            }
                        });
                    }
                }
            });
        });
    </script>
</body>