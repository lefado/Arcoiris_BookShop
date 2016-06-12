<%-- 
    Document   : listproveedor
    Created on : Oct 15, 2015, 11:48:07 AM
    Author     : mason
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>



    <body id="all_clients_section">

        <table class="table table-responsive table-hover" style="">        

            <thead>
                <tr>
                    <th>Client</th>
                    <th>Full Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="l">
                    <tr>
                        <td><c:out value="${l.user}"></c:out></td>
                        <td><c:out value="${l.name} ${l.lastname}"></c:out></td>
                        <td><a href="cClientBook?user=${l.user}" class="btn btn-default" role="button">+ Information</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>