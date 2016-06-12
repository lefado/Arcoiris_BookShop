/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var app = angular
        .module("bookModule", [])
        
        .controller("bookController", function ($scope, $http) {


            $http.get('cBook')
                    .then(function (response) {
                        $scope.book = response.data;
                    });

            //Header Filter
            $scope.sortData = function (column) {

                if ($scope.sortColumn === column)
                    $scope.reverseSort = !$scope.reverseSort;
                else
                    $scope.reverseSort = false;

                $scope.sortColumn = column;
            };


            $scope.getSortClass = function (column) {
                if ($scope.sortColumn === column) {
                    if ($scope.reverseSort === false) {
                        return 'glyphicon-arrow-down';
                    } else
                        return 'glyphicon-arrow-up';
                }
                return '';
            };


        });
