
<body>

    <section id="contact" class="">  


        <h1>CONTACT US</h1>
        <!-- map -->
        <div id="map-canvas"></div>
        
        <div class="container-fluid" id="email-back">
            <!--email-->
            <div class="container" id="emailform">
                <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="500ms">
                    <center><h2>Email Us&nbsp;<i class="fa fa-paper-plane-o"></i></h2></center>
                    <center><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, possimus odio,alias, eligendi molestias</p></center>
                    <center><p>dolore debitis sunt repellendus necessitatibus optio nisi dicta nostrum!</p></center>
                </div>
                <div class="col-lg-7 wow fadeInUp" data-wow-duration="1s" data-wow-delay="800ms">                                
                    <div class="alert alert-danger hidden" id="email-error" role="alert">
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        Enter a valid email address
                    </div>


                    <div class="div-form">
                        <form class="form form_login" id="contactform" name="contactform" action="" onsubmit="return false;"> 

                            <div class="col-md-6">
                                <div class="form-group has-feedback">                                                        
                                    <input class="form-control" type="text" name="f_user" id="username" placeholder="User" required />   
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">                                                       
                                    <input class="form-control" type="email" name="f_email" id="email" placeholder="Email" required />   
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">                                                        
                                    <input class="form-control text-field" type="text" name="phone" id="phone" placeholder="Phone" required />   
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                                                                            
                                    <span class="help-block">Introduce 9 numbers</span>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group has-feedback">    
                                    <input class="form-control" type="text" name="human" id="human" placeholder="Prove your not a robot... 2+2= ?" required />   
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>                            
                                </div>
                            </div>
                            <div class="col-md-12">
                                <textarea class="form-control" name="comments" cols="40" rows="8" id="comments" placeholder="Message"></textarea>
                            </div>


                            <div class="col-md-12">
                                <button type="" class="btn btn-default"  id="contactbtn2" value="">Send Message</button>

                            </div>

                        </form>
                    </div>

                </div>

                <!-- data address -->
                <div class="col-lg-5 address wow fadeInUp" data-wow-duration="1s" data-wow-delay="800ms">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, possimus odio, alias, eligendi molestias dolore debitis sunt repellendus necessitatibus optio nisi dicta nostrum!</p>
                    <ul class="">
                        <li><strong><i class="fa fa-map-marker"></i>  Address:</strong> Eusebio Barreto Street, Los Llanos de Aridane, La Palma, Canary Island (Spain)</li>
                        <li><strong><i class="fa fa-phone"></i>  Phone:</strong> +34 922 40 22 XX  </li>
                        <li><strong><i class="fa fa-envelope"></i>  Email:</strong><a href="mailto:support@arcoiris.com"> support@arcoiris.com</a></li>

                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- MODAL -->
    <div id="myModalEmail" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h2 class="modal-title"><img class="arco" src="images/logo/arco.png" alt="Image not found" height="27" width="46">&nbsp;Arcoiris</h2>
                </div>
                <div class="modal-body">
                    <p><stromg>Success!</stromg> Your message has been sent</p>
                </div>
                <div class="modal-footer">                                
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="ModalClose">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact -->
    <!--Google Maps API--><script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnycWatbGyK6ldFqErjFtko1yeMclNUOA&amp;sensor=true"></script>
    <script src="js/map.js" type="text/javascript"></script> 
    <script src="js/formChecking.js" type="text/javascript"></script>
    <!-- End Contact -->
</body>