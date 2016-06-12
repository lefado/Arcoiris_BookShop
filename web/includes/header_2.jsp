<%-- 
    Document   : header
    Created on : Oct 16, 2015, 7:50:13 PM
    Author     : mason
--%>


<%
    HttpSession sesionOK = request.getSession();
    String UserName = "";
    if (sesionOK.getAttribute("user") == null) {
        UserName = "Guest";
    } else {
        UserName = sesionOK.getAttribute("user").toString();
    }
%>

<head>
    <link href="css/bootstrap.css" rel="stylesheet">    
    <link href="css/header.css" rel="stylesheet" type="text/css"/>

</head>



<body>
    <div class="row" id="myheader">

        <header class="clearfix" id="header">

            <nav id="menu" class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">

                    <!-- Logo -->
                    <div class="navbar-header col-md-2">    
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynavbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="index.jsp"><img id="arco" class="arco" src="images/logo/arco.png" alt="Image not found" height="100" width="160"></a>
                    </div>

                    <div id="mynavbar" class="navbar-collapse collapse">
                        <div id="menu-1" class="col-md-offset-1 col-md-5 ">
                            <ul id="bootstrap-menu" class="nav navbar-nav">

                                <li id="menu-home" class="page-scroll"><a href="index.jsp#myheader">HOME</a></li>                                                                                                                  
                                <li id="menu-about" class="page-scroll" data-offset="100"><a href="index.jsp#about">ABOUT</a></li>

                                <!--Books-->
                                <li id="menu-book" class="dropdown page-scroll"><a class="dropdown-toggle" data-toggle="dropdown" href="index.jsp#book">BOOKS&nbsp;<span class="glyphicon glyphicon-chevron-down"></span></a>
                                    <ul class="dropdown-menu submenu">                                
                                        <li><a tabindex="-1" href="all_books.jsp">All books</a></li>
                                        <li><a tabindex="-1" href="all_books_2.jsp">All Books_beta</a></li>
                                        <li><a tabindex="-1" href="top_sales.jsp">Top Sales</a></li>
                                    </ul>
                                </li>

                                <!--Clients-->
                                <li id="menu-client" class="dropdown page-scroll"><a class="dropdown-toggle" data-toggle="dropdown" href="index.jsp#client">CLIENTS&nbsp;<span class="glyphicon glyphicon-chevron-down"></span></a>
                                    <ul class="dropdown-menu submenu">                                
                                        <li><a tabindex="-1" href="cClient">Clients Information</a></li>
                                        <li><a tabindex="-1" href="cClientBook">Clients Purchases</a></li>                                                               
                                    </ul>
                                </li>

                                <li id="menu-contact" ><a class="page-scroll" href="index.jsp#contact">CONTACT</a></li>

                            </ul>
                        </div>
                        <div id="menu-2">
                            <!-- Contact -->
                            <div class="pull-right">                        
                                <ul role="menu" aria-labelledby="dropdownMenu1" class="nav navbar-nav">  
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong><%=UserName%> <span class="caret"></span></strong></a>
                                                <%if (UserName.contains("Guest")) {%>
                                        <ul class="dropdown-menu submenu">                                
                                            <li><a tabindex="-1" href="login.jsp">Sign In</a></li>  
                                            <li><a tabindex="-1" href="registration.jsp">Sign Up</a></li>                                    
                                        </ul>
                                        <%} else {%>
                                        <ul class="dropdown-menu submenu">                                
                                            <li><a tabindex="-1" href="account.jsp">My Account</a></li>
                                            <li role="separator" class="divider"></li>                                    
                                            <li><a data-toggle="modal" data-target="#myModal" tabindex="-1"> <!--href="logout_dialog.jsp"--><strong>Log Out</strong></a></li>
                                        </ul>
                                        <%}%>
                                    </li>
                                </ul>
                                <img src="images/logo/index.png" alt="Not Found"  height="50" width="40"/>
                            </div>                        

                            <!-- Basket -->
                            <div class="pull-right">          

                                <ul role="menu" aria-labelledby="dropdownMenu1" class="nav navbar-nav">  
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><ins><span class="simpleCart_quantity"></span> items</ins><span class="caret"></span></a>

                                        <ul class="dropdown-menu submenu">                                
                                            <li><a tabindex="-1" href="basket.jsp"><strong>Check Out</strong></a></li>                                       
                                            <li><a href="javascript:;" tabindex="-1" class="simpleCart_empty"><em>Empty Cart</em></a></li> 

                                        </ul>
                                    </li>
                                </ul>   
                                <img src="images/logo/cart.png" alt="Not Found" height="50" width="40">
                            </div>
                        </div>

                    </div>

                </div>
            </nav>
            <!-- MODAL -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h2 class="modal-title"><img class="arco" src="images/logo/arco.png" alt="Image not found" height="27" width="46">&nbsp;Arcoiris</h2>
                        </div>
                        <div class="modal-body">
                            <p>Do you really want to log out?</p>
                        </div>
                        <div class="modal-footer">
                            <a href="logout.jsp" class="btn btn-default" role="button">Log Out</a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Stay on page</button>
                        </div>
                    </div>
                </div>
            </div>
        </header>        
    </div>
</body>