<%-- 
    Document   : listproveedor
    Created on : Oct 15, 2015, 11:48:07 AM
    Author     : mason
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="b" class="com.arcoiris.model.Book" scope="page"/>
<jsp:useBean id="cx" class="com.arcoiris.model.Connect" scope="page"/>



<head>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        #categories{
            background-color: #41C17D;
            border-radius: 8px;
            padding: 8px;
            padding-top: 4px;
            margin-top: 30px;
        }
        .badge{
            background-color: #41C17D !important;
            
        }
        a{
            color:  white;
        }
        

    </style>
</head>


<body id="listbook_aside">

    <div class="alert alert-warning hidden" id="search-error" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">Error:</span>Please, introduce searching data
    </div>
    <!-- Searcher -->
    <div id="search">
        <div class="input-group">
            <input type="text" class="form-control" id="searcher" placeholder="Search a book" name="q">
            <div class="input-group-btn">                                
                <button id="searcher-b" type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>

    </div>


    <!-- ACCORDION -->
    <div id="categories">
        <h3><center>Categories</center></h3>
        <p>You can filter for some categories:</p>
        <div class="row">
            <p><a href="all_books.jsp?filter=&id=" class="btn btn-default col-lg-offset-7" role="button">Clear filter</a></p>
        </div>
        <div class="accordion" id="categories">

            <!--Writer -->
            <section class="accordion-group">
                <div class="accordion-heading">
                    <a href="#writer" class="accordion-toggle" data-toggle="collapse" data-parent="#shops">
                        <% List<String> l = new ArrayList<String>();
                            l = b.listWriter();%>                                               
                        <button class="btn btn-default2 btn-block" type="button">
                            <span class="glyphicon glyphicon-pencil"></span>&nbsp;Writer <span class="badge"><%=l.size()%></span>
                        </button>
                    </a>
                </div>
            </section>

            <div id="writer" class="accordion-body collapse">
                <section class="accordion-inner">                    
                    <%for (int i = 0; i < l.size(); i++) {%>
                    <p><a href="all_books.jsp?filter=writer&id=<%=l.get(i)%>"><%=l.get(i)%></a></p>
                        <% }%>
                </section>
            </div>

            <!-- Genre -->
            <section class="accordion-group">
                <div class="accordion-heading">
                    <a href="#genre" class="accordion-toggle" data-toggle="collapse" data-parent="#shops">
                        <% List<String> s = new ArrayList<String>();
                            s = b.listGenre();%>
                        <p></p>
                        <button class="btn btn-default2 btn-block " type="button">
                            <span class="glyphicon glyphicon-sort-by-attributes"></span>&nbsp;Genre <span class="badge"><%=s.size()%></span>
                        </button>
                    </a>
                </div>
            </section>
            <div id="genre" class="accordion-body collapse">
                <section class="accordion-inner">
                    <%for (int i = 0; i < s.size(); i++) {%>
                    <p><a href="all_books.jsp?filter=genre&id=<%=s.get(i)%>"><%=s.get(i)%></a></p> 
                        <% }%>
                </section>
            </div>

            <!-- Prices -->
            <section class="accordion-group">
                <div class="accordion-heading">
                    <a href="#price" class="accordion-toggle" data-toggle="collapse" data-parent="#shops">
                        <% List<String> t = new ArrayList<String>();
                            t = b.listRangePrice();%>                        
                        <p></p>
                        <button class="btn btn-default2 btn-block" type="button">
                            <span class="glyphicon glyphicon-euro"></span>&nbsp;Prices <span class="badge"><%=t.size()%></span>
                        </button>
                    </a>
                </div>
            </section>
            <div id="price" class="accordion-body collapse">
                <section class="accordion-inner">
                    <%for (int i = 0; i < t.size(); i++) {%>
                    <p><a href="all_books.jsp?filter=price&id=<%=t.get(i)%>"><%=t.get(i)%></a></p> 
                        <% }%>
                </section>
            </div>            
        </div>         
    </div>

    <script src="js/jQuery.js" type="text/javascript"></script>
    <script>

        //Get data from input seacher and it is sended through the search image hyperlink
        $("#searcher-b").click(function () {
            var data = $("#searcher").val();
            if (data === "") {
                $("#search-error").removeClass("hidden")
            } else {
                $("#search-error").addClass("hidden")
                window.location.href = "all_books.jsp?filter=search&id=" + data;
            }
        });

        $("#searcher").keyup(function (event) {
            if (event.keyCode == 13) {
                $("#searcher-b").click();
            }
        });

    </script>

</body>
