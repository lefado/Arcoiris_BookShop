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

        <style>
            h4{
                margin-right: 15px;
            }
        </style>
    </head>



    <body id="all_clients_section">

        <h2>Best Clients:</h2>
        <form action="cClient" method="GET">            
            <div class="form-group  selectContainer pull-right">                
               
                <select class="form-control" id="sel1" name="LIMIT" onchange="this.form.submit()">
                    <c:forEach begin="1" end="${N_buyers}" varStatus="i">
                        <option>${i.index}</option>
                    </c:forEach>

                </select>
            </div>
            <label class="pull-right control-label"><h4>TOP</h4></label>
        </form>
        
        <table class="table table-responsive table-striped" style="">        

            <thead>
                <tr>
                    <th>Client</th>
                    <th>Purchases</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list_top}" var="l">
                    <tr>
                        <td><c:out value="${l.user}"></c:out></td>
                        <td><c:out value="${l.unit}"></c:out></td>
                        </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>