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
        <link href="css/image-zoom.css" rel="stylesheet" type="text/css"/>
   
    </head>



    <body id="all_clients_section">

        <table class="table table-responsive table-striped" style="">        

            <thead>
                <c:if test="${not empty book}"> <!--var1 is NOT empty or null.-->    
                    <tr>
                        <th>Cover</th>
                        <th>Title</th>
                        <th>Writer</th>
                    </tr>
                </c:if>
            </thead>
            <tbody>
                <c:forEach items="${book}" var="l">
                    <tr>
                        <td>
                            <div class="img-zoom">
                                    <img src="${l.lastname}" class="img-responsive img-zoom" alt="Not Found"  alt="Not Found" style="width:100px;height:130px;"/>
                                </div>

                        </td>
                        <td><c:out value="${l.title}"></c:out></td>
                        <td><c:out value="${l.writer}"></c:out></td>                        
                        </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>