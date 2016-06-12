/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {


    //Para ID = home, añade clase active para el padre del elemento=a que contiene Home (esta en header.jsp)
    //Active TAB (main menu)
    $("#home2 a:contains('Home')").parent().addClass('active');
    $("#contact a:contains('Contact')").parent().addClass('active');
    $("#about a:contains('About')").parent().addClass('active');
    $("#home a:contains('Old home')").parent().addClass('active');
    $("#suplier a:contains('Suplier')").parent().addClass('active');
    $("#suplier a:contains('Suplier')").parent().parent().parent().addClass('active');
    $("#contact_social a:contains('Contact')").parent().addClass('active');
    $("#contact_email a:contains('Contact')").parent().addClass('active');
    $("#all_book a:contains('All books')").parent().addClass('active');
    $("#all_book a:contains('All books')").parent().parent().parent().addClass('active');
    $("#all_book_2 a:contains('All Books_beta')").parent().addClass('active');
    $("#all_book_2 a:contains('All Books_beta')").parent().parent().parent().addClass('active');
    $("#top_sales a:contains('Top Sales')").parent().addClass('active');
    $("#top_sales a:contains('Top Sales')").parent().parent().parent().addClass('active');
    $("#all_clients a:contains('Clients Information')").parent().addClass('active');
    $("#all_clients a:contains('Clients Information')").parent().parent().parent().addClass('active');
    $("#all_clients_book a:contains('Clients Purchases')").parent().addClass('active');
    $("#all_clients_book a:contains('Clients Purchases')").parent().parent().parent().addClass('active');



    //Active TAB (aside menu)

    //Contact    
    $('.pill1').click(
            function () {
                $("#contact a:contains('Email')").parent().addClass('active');
                $("#contact a:contains('Networks')").parent().removeClass()('active');
            });
    $('.pill2').click(
            function () {

                $("#contact a:contains('Networks')").parent().addClass('active');
                $("#contact a:contains('Email')").parent().removeClass()('active');
            });



    /*HOVER MENU*/
    $('ul.nav li.dropdown').hover(//Accede al elemento=ul con la clase=nav, con elemento=li clase=dropdown
            function () {
                $('.dropdown-menu', this).fadeIn();//Accede clase=dropdown-menu
            },
            function () {
                $('.dropdown-menu', this).fadeOut('fast');

            });//Hover



});

