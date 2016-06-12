<%-- 
    Document   : footer
    Created on : Jan 4, 2016, 4:32:51 PM
    Author     : mason
--%>

<html>
    <head>
        <link href="css/footer.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">         
    </head>
    <body>
        <footer>
            <div id="footer-1">
                <nav id="footer-1-1">
                    <div class="row">
                        <div class="pull-right incident">Any problem?&nbsp;&nbsp;<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="incident@arcoiris.com">Send Incident</button></div>
                        <ul class="breadcrumb col-lg-5">                                        
                            <li><a href="">Policy</a></li>
                            <li><a href="">Terms</a></li>
                            <li><a href="">Condition</a></li>                     
                        </ul>     

                        <div class="page-scroll">
                            <a href="#myheader" id="" class="btn btn-circle">
                                <i class="fa fa-angle-double-up animated"></i>
                            </a>
                        </div>


                    </div>
                </nav>
            </div>


            <div id="footer-2">
                <p><center><span class="glyphicon glyphicon-copyright-mark"></span> Arcoiris 2016. All Right Reserved</center></p>
                <p><center>Designed by Diego</center></p>
            </div>
        </footer>  

        <!--MODAL-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel"><img class="arco" src="images/logo/arco.png" alt="Image not found" height="27" width="46">&nbsp;Send message to the Administration</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Message:</label>
                                <textarea class="form-control" id="message-text"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-default">Send message</button>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript -->
        <script src="js/jQuery.js" type="text/javascript"></script>

        <!-- Scroll -->
        <script src="js/wow.min.js" type="text/javascript"></script>
        <script src="js/jquery.scrollTo.js" type="text/javascript"></script>
        <script src="js/jquery.easing.min.js" type="text/javascript"></script>
        <script src="js/customScroll.js" type="text/javascript"></script>
        <!-- Custom -->
        <script src="js/script.js" type="text/javascript"></script>
    </body>

</html>