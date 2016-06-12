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

    <body id="all_clients">
        <jsp:include page="includes/header_2.jsp"></jsp:include>
            <div class="push-footer">
                <div class="container">

                    <div class="row">


                        <section class="col-lg-8">     

                        <jsp:include page="all_clients_section.jsp" flush="true" />
                    </section>

                    <section class="col-lg-4">                  

                        <jsp:include page="all_clients_top.jsp" flush="true" />
                    </section>

                </div>
            </div>          
        </div>
        <jsp:include page="includes/footer.jsp"></jsp:include>
        <!-- JavaScript -->        
        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/script.js"></script>

    </body>
</html>
