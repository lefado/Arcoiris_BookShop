<%-- 
    Document   : cerrarsesion
    Created on : Oct 16, 2015, 1:14:07 PM
    Author     : mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true"%>

<head>
    
</head>
<body>
<%
    HttpSession sesionOK = request.getSession();
    sesionOK.invalidate(); //Permite cerrar la sesion iniciada
%>

<!-- Delete cart elements --->
<a href="javascript:;" id="paypal_a" tabindex="-1" class="simpleCart_empty"></a>


<!--jsp:forward page="login.jsp"/>-->

<!-- JavaScript -->        
        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/script.js"></script>

        <!-- Basket cart -->
        <script src="js/simpleCart.min.js" type="text/javascript"></script>
        <!-- When the web is loaded, click the hyperlink to delete cart elements-->
        <script>
            $(window).load(function () {
                $('#paypal_a').trigger('click');
                window.location.href = "login.jsp";
            });
        </script>
    </body>