<%-- 
    Document   : listbook_2
    Created on : Jan 24, 2016, 6:15:05 PM
    Author     : mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html ng-app="bookModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arcoiris</title>

        <link href="css/image-zoom.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body ng-controller="bookController" id="all_book_2">
        <jsp:include page="includes/header_2.jsp"></jsp:include>
            <div class="push-footer">
                <div class="container">
                    <div class="row">


                        <section class="col-lg-9">
                            <label>Sort by checking on header column</label>
                            <table class="table table-responsive">
                                <thead>
                                    <tr>                            
                                        <th>Cover</th>
                                        <th ng-click="sortData('title')"> Title 
                                            <span class="glyphicon" ng-class="getSortClass('title')"></span>
                                        </th>
                                        <th ng-click="sortData('writer')"> Writer 
                                            <span class="glyphicon" ng-class="getSortClass('writer')"></span>
                                        </th>
                                        <th ng-click="sortData('genre')"> Genre 
                                               <span class="glyphicon" ng-class="getSortClass('genre')"></span>
                                        </th>
                                        <th ng-click="sortData('price')"> Price 
                                            <span class="glyphicon" ng-class="getSortClass('price')"></span>
                                        </th>        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="b in book| orderBy: sortColumn:reverseSort | filter:searchText">

                                        <th>
                                            <div class="img-zoom"><img src="{{b.cover}}" class="img-responsive img-zoom" alt="" style="height: 100px; width: 80px;"></div>
                                        </th>

                                        <th>{{b.title}}</th>
                                        <th>{{b.writer}}</th>
                                        <th>{{b.genre}}</th>
                                        <th>{{b.price}}</th>
                                    </tr>

                                </tbody>
                            </table>

                        </section>


                        <section class="col-lg-3">

                            <!-- Searcher -->                           
                            <i class="glyphicon glyphicon-search"></i>
                            <input type="text" class="form-control" id="" placeholder="Search" name="" ng-model="searchText"/>

                            <!-- ACCORDION -->
                            <div id="categories">
                                <h3><center>Categories</center></h3>
                                <p>You can filter for some categories:</p>
                                <div class="row">
                                    <p><a href="" class="btn btn-default col-lg-offset-7" role="button">Clear filter</a></p>
                                </div>

                                <div class="accordion" id="categories">

                                    <!--Writer -->
                                    <section class="accordion-group">
                                        <div class="accordion-heading">
                                            <a href="#writer" class="accordion-toggle" data-toggle="collapse" data-parent="#shops">

                                                <button class="btn btn-facebook btn-block" type="button">
                                                    <span class="glyphicon glyphicon-pencil"></span>&nbsp;Writer <span class="badge"></span>
                                                </button>
                                            </a>
                                        </div>
                                    </section>

                                    <div id="writer" class="accordion-body collapse">
                                        <section class="accordion-inner">                    
                                            <p ng-repeat="g in book| unique: 'genre'">{{g.genre}}</p>

                                        </section>
                                    </div>


                                </div>         
                            </div>


                        </section>


                    </div>
                </div>
            </div>
        <jsp:include page="includes/footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0-rc.1/angular.js"></script>
        <script src="js/Book_angular.js" type="text/javascript"></script>
        <script src="js/unique.js" type="text/javascript"></script>
        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
