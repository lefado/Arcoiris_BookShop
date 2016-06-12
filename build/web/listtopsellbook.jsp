<%-- 
    Document   : listproveedor
    Created on : Oct 15, 2015, 11:48:07 AM
    Author     : mason
--%>



<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="p" class="com.arcoiris.model.Purchase" scope="page"/>
<jsp:useBean id="cx" class="com.arcoiris.model.Connect" scope="page"/>

<head>

    <style>
        tr {
            height:  168px;

        }
        td{
            width: 5px;
        }
        #ranking{
            color: #41C17D;
        }
    </style>
</head>

<body>
    <div style="overflow-y:auto;">
        <table class="table table-responsive" style="table-layout:fixed">

            <%
                String filter = request.getParameter("filter");
                String id = "";

                if (filter == null) {
                    filter = "";
                } else if (filter.contains("topsell")) {
                    id = request.getParameter("id");
                }
                List<String> l = p.TopSalesBook(id);
                for (int i = 0; i < l.size(); i++) {
            %>

            <tr>
                <td>
                    <div class="row ">                    
                        <p><h1 id="ranking"><center><%=i + 1%></center></h1></p>
                       
                        <p><center>Units Sold:</center></p>
                        <p><h4><center><strong><%=l.get(i)%></strong></h4></center></p>
                    </div>
                </td>
            </tr>

            <% }%>

        </table>
    </div>

</body>