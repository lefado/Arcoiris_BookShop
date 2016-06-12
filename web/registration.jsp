<%-- 
    Document   : registration
    Created on : Jan 5, 2016, 12:05:48 PM
    Author     : mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris-Registration</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">                
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        
        <style>
            body{
                margin-top: 30px;              
            }
        </style>
    </head>
    <body id="login">            
        <div class="container">

            <%
                String user = request.getParameter("user");
                if (user == null) {
                    user = "";
                }
                if (user.contains("1")) {
            %>
            <div class="alert alert-warning">
                <strong>User already Exists!</strong> Please, select other user.
            </div>
            <% }%>


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


            <div class="row"  id="login-body">
                <div class="col-lg-12">
                    <legend >Registration Form</legend>
                </div>

                <div class="col-lg-5">
                    <!-- FORM -->
                    <form class="form form_login" id="contactform" action="cLogin" method="post" enctype="">                        

                        <div class="form-group has-feedback">
                            <label>User:</label>
                            <input class="form-control" type="text" name="f_user" id="username" placeholder="Type your user" required />   
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                        </div>

                        <div class="form-group has-feedback">
                            <label>Email</label>
                            <input class="form-control" type="email" name="f_email" id="email" placeholder="Type your email" required />   
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                        </div>

                        <label class="control-label">Password</label>
                        <div class="form-group has-feedback">
                            <input class="form-control" type="password" id="pass1" name="f_pass" placeholder="Password" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                            <span class="help-block">Minimum 8 characters</span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" id="pass2" name="f_pass2"  placeholder="Confirm" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                        </div>
                        

                        <div class="form-group has-feedback">
                            <label>Name:</label>
                            <input class="form-control" type="text" name="f_name" id="name" placeholder="Type your name" required />   
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                        </div>
                        <div class="form-group has-feedback">
                            <label>Last Name:</label>
                            <input class="form-control" type="text" name="f_lastname" id="lastname" placeholder="Type your last name" required/>   
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                        </div>


                        <input type="hidden" name="f_sign" value="registration"/> <!--Para sabes que es reg-->

                        <button type="button" class="btn btn-default" id="contactbtn">Register</button>                                   
                        <button type="reset" class="btn btn-default">Reset</button>   

                    </form>
                </div>                
            </div>
        </div>

        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <!-- Check the data of the form-->
        <script src="js/formChecking.js" type="text/javascript"></script> 
    </body>
</html>
