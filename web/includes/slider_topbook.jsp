<%-- 
    Document   : all_books
    Created on : Jan 14, 2016, 12:44:23 AM
    Author     : mason
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.arcoiris.model.Book"%>
<jsp:useBean id="b" class="com.arcoiris.model.Book" scope="page"/>
<jsp:useBean id="p" class="com.arcoiris.model.Purchase" scope="page"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            #Slider{
                width:275px;
                height: 350px;
            }
        
        </style>
    </head>

    <body id="all_book">      

                <!-- SLIDER -->
                <div id="Slider" class="carousel slide " data-ride="carousel">
                    <%  List<String> l = new ArrayList<String>();
                        List<Book> bo = new ArrayList<Book>();
                        l = p.TopSalesBook("10"); //TOP 5
                        bo = p.TopInfoSalesBook();
                    %>

                    <!--Indicatiors-->
                    <ol class="carousel-indicators">
                        <li data-target="#Slider" data-slide-to="0" class="active"></li>
                            <% for (int i = 1; i < 5; i++) {%>
                        <li data-target="#Slider" data-slide-to="<%=i%>"</li>	
                            <%}%>        	
                    </ol>

                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <%String image = b.loadImage(bo.get(0).getTitle());%>
                            <a href="#" class="thumbnail">
                            <img src="<%=image%>" class="tales" alt="Not Found" style="width:275px;height:350px;">
                            </a>
                            <div class="carousel-caption">
                                <h1><strong>1#</strong></h1>
                                <h3><strong><%=bo.get(0).getTitle()%></strong></h3>
                            </div>
                        </div>
                        <% for (int i = 1; i < 5; i++) {
                                image = b.loadImage(bo.get(i).getTitle());%>
                        <div class="item">
                            <img src="<%=image%>" class="tales" alt="Not Found" style="width:275px;height:350px;"/>
                            <div class="carousel-caption">
                                <h1><strong><%=(i + 1)%>#</strong></h1>
                                <h3><strong><%=bo.get(i).getTitle()%></strong></h3>
                            </div>
                        </div>
                        <%}%>
                    </div> 
                </div>
            
            <!-- JavaScript -->        
            <script src="js/jQuery.js" type="text/javascript"></script>
            <script src="js/bootstrap.js"></script>
    </body>
</html>
