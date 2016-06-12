<%-- 
    Document   : all_books
    Created on : Jan 14, 2016, 12:44:23 AM
    Author     : mason
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="p" class="com.arcoiris.model.Purchase" scope="page"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <style>
            #top-table, #top-infotable {
                margin-top: 50px;
            }
        </style>
    </head>

    <body id="top_sales">
        <jsp:include page="includes/header_2.jsp"></jsp:include>
            <div class="push-footer">
                <div class="container">
                    <div class="row">

                        <h1>Top Sales</h1>


                        <div class="col-lg-3">
                            <h2><ins>Top 5</ins></h2>
                        <jsp:include page="includes/slider_topbook.jsp"></jsp:include>
                        </div>
                        <div class="col-lg-9">

                            <div class="row">
                                <!-- TABLE TOP SELL (TOP 10) --> 
                                <div id="top-infotable" class="col-lg-10">

                                    <!-- Creo elemento para asignar valor de selector a variable java, y pasarla al jsp include -->
                                <jsp:include page="listfilterbook.jsp?filter=topsell&id=15"></jsp:include> 
                                </div>

                                <div id="top-table" class="col-lg-2">
                                <jsp:include page="listtopsellbook.jsp?filter=topsell&id=15"></jsp:include> 
                                </div>  
                            </div>  
                        </div>


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
            //get value of select
            $("select").change(function () {
                var x = $("#select_limit").val();
                return x;
            });

            function value_selector() {
                var val = 1;
                return val;
            }
        </script>
    </body>
</html>
