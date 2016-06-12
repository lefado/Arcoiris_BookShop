
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            th {
                text-align: center;
            }
            table {
                width: 100%;
            }
            tr,td{
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            .total{
                font-size: 200%;
            }
            .item-isbn{
                display: none;
            }
            
            #basket{
                margin-top: 20px;
            }


        </style>

    </head>

    <body id="basket">
        <jsp:include page="includes/header_2.jsp"></jsp:include>
            <div class="push-footer">
                <div class="container">
                    <div class="row">
                    <%
                        String buy = request.getParameter("buy");
                        if (buy == null) {
                            buy = "";
                        }
                        if (buy.contains("1")) {
                    %>
                    <a href="javascript:;" class="simpleCart_checkout">ddd

                    </a>
                    <% }%>



                    <!-- If user is not login -->
                    <%
                        String auth = request.getParameter("auth");
                        if (auth == null) {
                            auth = "";
                        }
                        if (auth.contains("no")) {
                    %>



                    <div class="alert alert-danger">
                        <strong>Guest User!</strong> Please, you should log-in before check out.
                    </div>

                    <% } else if (auth.contains("x")) {%>
                    <div class="alert alert-danger">
                        <strong>No books!</strong> Please, you should at least add one book before check out.
                    </div>
                    <%}%>


                    <a href="javascript:;" class="simpleCart_checkout paypal"></a>
                    <h3>Your Cart: </h3>                                        
                    <div class="simpleCart_items">
                    </div>                           
                    <p></p>
                    <div class="total">
                        <p></strong><div class="pull-right simpleCart_total"></div><span class="pull-right"><strong>Total: </span> </p>
                    </div>
                    <a  class="btn btn-default btn-lg check_out">Check Out</a> <!--Send to JQuery  -->

                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"></jsp:include>

        <!-- JavaScript -->        
        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/script.js"></script>

        <!-- Basket cart -->
        <script src="js/simpleCart.min.js" type="text/javascript"></script>
        <script>
            simpleCart({
                cartColumns: [
                    {attr: "isbn", label: "ISBN"},
                    {attr: "image", label: "Image"},
                    {attr: "name", label: "Name"},
                    {attr: "writer", label: "Writer"},
                    {attr: "price", label: "Price", view: 'currency'},
                    {view: "decrement", label: false, text: "-"},
                    {attr: "quantity", label: "Qty"},
                    {view: "increment", label: false, text: "+"},
                    {attr: "total", label: "SubTotal", view: 'currency'},
                    {view: "remove", text: "Remove", label: false}
                ],
                // "div" or "table" - builds the cart as a table or collection of divs
                cartStyle: "table",
                // how simpleCart should checkout, see the checkout reference for more info 
                checkout: {
                    type: "PayPal",
                    email: "diegop.pin@gmail.com.com"
                },
                // set the currency, see the currency reference for more info
                currency: "GBP",
                // set the cart langauge (may be used for checkout)
                language: "english-us",
                // event callbacks 
                beforeAdd: null,
                afterAdd: null,
                load: null,
                beforeSave: null,
                afterSave: null,
                update: null,
                ready: null,
                checkoutSuccess: null,
                checkoutFail: null,
                beforeCheckout: null
            });
        </script>
        <script src="js/liveQuery.js" type="text/javascript"></script>        
        <!-- Add table class -->
        <script>
            $("#table").livequery(function () {
                $("table").addClass('table-condensed');
                return;
            });
        </script>
        <!-- Modify Image tag, to see the pictures -->
        <script>
            $("td.item-image").livequery(function () {
                var x = $("td.item-image").html();
                $("td.item-image").first().html("<img src=\"" + x + "\" alt=\"Image not found\" height=\"120\" width=\"100\">");
                $("td.item-image").first().removeClass("item-image");
            });
        </script>
        <!-- Send elements to CPurchase, to save them at the DB-->
        <script>
            $(".check_out").click(function () {
                var x = $("td.item-isbn").append("|").text(); //ISBN
                var y = $("td.item-quantity").append("|").text(); //UNITS
                window.location.href = "cPurchase?isbn=" + x + "&unit=" + y;

            });
        </script>
    </body>
</html>

