<%-- 
    Document   : all_books
    Created on : Jan 14, 2016, 12:44:23 AM
    Author     : mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body id="all_book">
        <jsp:include page="includes/header_2.jsp"></jsp:include>
            <div class="push-footer">
                <div class="container">
                    <div class="row">
                        <h1>All books</h1>
                    <%
                        String filter = request.getParameter("filter");
                        String id = request.getParameter("id");
                        String filter_s = "";
                        String id_s = "";
                        if (filter != null) {
                            filter_s = filter;
                        }
                        if (id != null) {
                            id_s = id;
                        }
                        String url = "listfilterbook.jsp?filter=" + filter_s + "&id=" + id_s;
                    %>




                    <section class="col-lg-9">                  

                        <jsp:include page="<%=url%>" flush="true" />

                    </section>

                    <!-- ASIDE -->
                    <section class="col-lg-3">


                        <jsp:include page="listbook_aside.jsp"></jsp:include>
                        </section>




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
    </body>
</html>
