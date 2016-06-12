
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                margin-top: 80px;              
            }
        </style>
    </head>
    
    <body id="login">    

        <div class="container">  

            <%
                String auth = request.getParameter("auth");
                if (auth == null) {
                    auth = "";
                }
                if (auth.contains("no")) {
            %>
            <div class="alert alert-danger">
                <strong>Access Denied!</strong> Please, introduce your access information correctly.
            </div>
            <% } else if (auth.contains("reg")) {
                String name = request.getParameter("user");%>
            <div class="alert alert-success">
                <strong><%=name%>,</strong> your registration has been successful!
            </div>
            <%}%>

            <div class="row" id="login-body">

                <div class="col-lg-12">
                    <legend >Access Form</legend>
                </div>

                </br></br>
                <div class="col-lg-5 form_login">
                    <!-- FORM -->  

                    <form class="form" action="cLogin" method="post">                        
                        <div class="form-group">
                            <label>User:</label>
                            <input class="form-control" type="text" name="f_user" placeholder="Type your user"/>   
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <input class="form-control" type="password" name="f_pass" placeholder="Type your password"/>                        
                        </div>

                        <button type="submit" class="btn btn-default" name="f_sign" value="sign_in">Sign In</button>                                   
                        <button type="reset" class="btn btn-default">Reset</button>   
                        <button type="submit" class="btn btn-default col-lg-offset-5" name="f_sign" value="sign_up">Sign Up</button>  

                    </form>
                </div>

                <!-- Image -->
                <div class="col-lg-5 col-lg-offset-2" id="image-part">       
                    <label id="arco-text"><center>Welcome!</p></label>
                    <img class="img-responsive" src="images/logo/arco.png" alt="Not Found" style="width:270px;height:170px;"/>                    
                </div>

                <div class="col-lg-12">
                    <br/><br/>
                    <legend ></legend>
                </div>

            </div>
        </div>
    </body>
</html>
