<%-- 
    Document   : account
    Created on : Jan 15, 2016, 2:19:08 AM
    Author     : mason
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="l" class="com.arcoiris.model.Login" scope="page"/>
<jsp:useBean id="cx" class="com.arcoiris.model.Connect" scope="page"/>
<% HttpSession sesionOK = request.getSession();%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <style>
            /*#account-body{
                margin-top: 110px;
            }*/
            form{
                background-color: #41C17D;
                padding-right: 75px;
                padding-left: 10px;
                padding-top: 20px;
                padding-bottom: 40px;
                border-radius: 2%;
                color: white;
            }

        </style>
    </head>

    <body id="account">
        <jsp:include page="includes/header_2.jsp"></jsp:include> 
            <div class="push-footer">
                <div class="container">

                    <div class="row">

                        <div class="alert alert-danger hidden" id="pass-error" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            Passwords are different
                        </div>

                        <div class="alert alert-danger hidden" id="email-error" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            Enter a valid email address
                        </div>

                    <%
                        String upd = request.getParameter("update");
                        if (upd == null) {
                            upd = "";
                        }
                        if (upd.contains("0")) {
                    %>
                    <div class="alert alert-danger">
                        <strong>Update Error!</strong> Please, try to update again.
                    </div>
                    <% } else if (upd.contains("1")) {%>
                    <div class="alert alert-success">
                        <strong><%=sesionOK.getAttribute("user")%>,</strong> your update has been successful!
                    </div>
                    <%}%>


                    <div class="col-lg-12">
                        <legend >Update Registration</legend>
                    </div>                

                    <div class="col-lg-5">
                        <%
                            String user = sesionOK.getAttribute("user").toString();
                            ResultSet rs = l.UserInformation(user);
                            while (rs.next()) {

                        %>
                        <!-- FORM -->
                        <form class="form form_login" id="contactform" action="cLogin" method="post" >                        

                            <div class="form-group has-feedback">
                                <label>User:</label>
                                <input class="form-control" type="text" name="f_user" id="username" value="<%=user%>" disabled/>  
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            </div>    

                            <div class="form-group has-feedback">
                                <label>Email</label>
                                <input class="form-control" type="email" name="f_email" id="email" value="<%=rs.getString("email")%>" required />   
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            </div>

                            <!-- User is disabled -->
                            <input class="form-control" type="hidden" name="f_user2" id="username" value="<%=user%>"/>  

                            <label class="control-label">Password</label>
                            <div class="form-group has-feedback">
                                <input class="form-control" type="password" id="pass1" name="f_pass" value="<%=rs.getString("password")%>" required>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" id="pass2" name="f_pass2" value="<%=rs.getString("password")%>" required>                            
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            </div>
                            <span class="help-block">Minimum 8 characters</span>

                            <div class="form-group has-feedback">
                                <label>Name:</label>
                                <input class="form-control" type="text" name="f_name" id="name" value="<%=rs.getString("name")%>" required />   
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            </div>
                            <div class="form-group has-feedback">
                                <label>Last Name:</label>
                                <input class="form-control" type="text" name="f_lastname" id="lastname" value="<%=rs.getString("lastname")%>" required/>   
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            </div>

                            <input type="hidden" name="f_sign" value="update"/> <!--Para sabes que es reg-->

                            <button type="button" class="btn btn-default" id="contactbtn">Update</button>                                   
                            <button type="reset" class="btn btn-default">Reset</button>   

                        </form>
                        <%}%>              
                </div>                      
            </div>
            <br/><br/>
        </div>
        <jsp:include page="includes/footer.jsp"></jsp:include>

        <!--Google Maps API-->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnycWatbGyK6ldFqErjFtko1yeMclNUOA&amp;sensor=true"></script>

        <!-- JavaScript -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/script.js"></script>
        <script src="js/map.js"></script>
        <!-- Check the data of the form-->
        <script src="js/formChecking.js" type="text/javascript"></script> 
    </body>
</html>
