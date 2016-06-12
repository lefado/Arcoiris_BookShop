<%-- 
    Document   : listproveedor
    Created on : Oct 15, 2015, 11:48:07 AM
    Author     : mason
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="b" class="com.arcoiris.model.Book" scope="page"/>
<jsp:useBean id="cx" class="com.arcoiris.model.Connect" scope="page"/>

<html>
    <body>
        <div style="overflow-y:auto;">
            <table class="table table-hover table-responsive" style="table-layout:fixed">

                <%
                    String filter = request.getParameter("filter");
                    String id = "";
                    ResultSet rs = b.listBook();
                    if (filter == null) {
                        filter = "";
                    } else if (filter.contains("genre")) {
                        id = request.getParameter("id");
                        rs = b.listBookGenre(id);
                    } else if (filter.contains("writer")) {
                        id = request.getParameter("id");
                        rs = b.listBookWriter(id);
                    } else if (filter.contains("price")) {
                        id = request.getParameter("id");
                        String parts[] = id.split("-");
                        rs = b.listBookPrice(parts[0], parts[1]);
                    } else if (filter.contains("search")) {
                        id = request.getParameter("id");
                        rs = b.listBookSearch(id);
                    } else if (filter.contains("topsell")) {
                        id = request.getParameter("id");
                        rs = b.TopInfoSalesBook(id);
                    }
                    while (rs.next()) {
                %>

                <tr>
                    <td>
                        <div class="row simpleCart_shelfItem">                    
                            <div class="col-lg-2">
                                <img class="item_image" src="<%=b.loadImage(rs.getString("title"))%>" class="item_thumb" alt="Not Found" style="width:120px;height:150px;"/>
                            </div>
                            <div class="col-lg-5 col-lg-offset-1">                    
                                <h3 class="item_name"><%=rs.getString("title")%></h3>
                                <h4 class="item_writer"><%=rs.getString("writer")%></h4>                        
                                <h5><%=rs.getString("genre")%> </h5>
                                <h5 class="hidden item_isbn"><%=rs.getString("isbn")%></h5>
                            </div>
                            <div class="col-lg-2 col-lg-offset-1">
                                </br>
                                <!--<p><a  data-toggle="modal" data-target="#myBook" class="btn btn-default btn-lg" role="button">Add to basket</a></p>-->
                                <p><a class="btn btn-default btn-lg item_add" href="javascript:;" role="button" data-toggle="tooltip" data-placement="top" title="Added">Add to basket</a></p>                                

                                <br/>
                                <p><center><h4 class="price item_price"><%="Price: " + rs.getString("price") + " £"%></h4></center></strong></p>
                            </div>

                        </div>
                    </td>
                </tr>

                <% }%>

            </table>                
        </div>

       
    </body>

</html>