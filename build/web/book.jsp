<%@page import="com.arcoiris.model.Purchase"%>
<%@page import="java.util.List"%>
<%@page import="com.arcoiris.model.Book"%>
<%
    //Total number of books
    Book b = new Book();
    List<Book> l = b.listBookList();
    int N_book = l.size();
    //Total number of sales
    Purchase p = new Purchase();
    int N_sales = p.NSales();
%>

<body>
    <section id="book" class="">
        <div class="container-fluid">
            <div class="container">
                <div id="title">
                    <h1>Time to buy some Books?</h1>
                    <p>Duis mollis placerat quam, eget laoreet tellus tempor eu. Quisque dapibus in purus in dignissim.</p>
                </div>
                <div class="row data">
                    <div class="col-lg-3 gallery">
                        <center><h3>Gallery</h3></center>
                        <center><p>Duis mollis placerat quam, eget laoreet tellus tempor eu. Quisque dapibus in purus in dignissim.</p></center>

                        <!--div class="wow bounceIn" data-wow-duration="0ms" data-wow-delay="300ms"-->
                        <center><i class="fa fa-book"></i></center>
                        <center><h2 class="timer bold" data-to="<%=N_book%>" data-speed="3000" data-from="0"></h2> </center>
                        <center><h4>Books in Total</h4></center>
                        <center><i class="fa fa-line-chart"></i></center>
                        <center><h2 class="timer bold" data-to="<%=N_sales%>" data-speed="3000" data-from="0"></h2> </center>
                        <center><h4>Sales in Total</h4></center>                            
                        <a class="book-a" href="all_books.jsp">Bring me there!</a>
                        <!--/div-->


                    </div>
                    <div class="col-lg-4 col-lg-offset-1">
                        <center><img class="book-image responsive" src="images/back/openbook.png" alt="" style="height: 300px; width: 400px;"/></center>
                        <center><p>Duis mollis placerat quam, eget laoreet tellus tempor eu. Quisque dapibus in purus in dignissim.</p></center>
                        <center><p>Duis mollis placerat quam, eget laoreet tellus tempor eu. Quisque dapibus in purus in dignissim.</p></center>
                    </div>
                    <div class="col-lg-3 book-slide col-lg-offset-1">
                        <center><h3>Top Sales</h3></center>
                        <center><p>Duis mollis placerat quam, eget laoreet tellus tempor eu. Quisque dapibus in purus in dignissim.</p></center>
                        <center><div id="bookslider-el"><jsp:include page="includes/slider_topbook2.jsp"></jsp:include></center> </div>
                    <a class="pull-right" href="top_sales.jsp">Bring me there!</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--Book-->
<!--Counter down-->
<script src="js/jquery.countTo.js" type="text/javascript"></script>
<script src="js/jquery.isOnScreen.js" type="text/javascript"></script>
<script>


    $(function () {
        var flag = false;
        $(window).scroll(function () { // bind window scroll event  

            if ((($('.timer').length) > 0)) { // if target element exists in DOM

                if (($('.timer').is_on_screen()) && !(flag)) { // if target element is visible on screen after DOM loaded         

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