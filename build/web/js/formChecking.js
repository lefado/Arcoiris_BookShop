/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateEmail(id) {
    var mail = $("#" + id).val();
    var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var div = $("#" + id).closest("div");
    var span = $("#" + id).next("span");
    if (!re.test(mail)) {
        div.addClass("has-error");
        span.addClass("glyphicon-remove");
        div.removeClass("has-success");
        span.removeClass("glyphicon-ok");

        //Show alert
        $("#email-error").removeClass("hidden");

        return false;
    } else {
        div.addClass("has-success");
        span.addClass("glyphicon-ok");
        div.removeClass("has-error");
        span.removeClass("glyphicon-remove");
        //Remove alert
        $("#email-error").addClass("hidden");
        return true;
    }
}

function emptyText(id) {
    var div = $("#" + id).closest("div");
    var span = $("#" + id).next("span");
    if ($("#" + id).val() === null || $("#" + id).val() === "") //Value of a specific el
    {
        div.addClass("has-error");
        span.addClass("glyphicon-remove");
        div.removeClass("has-success");
        span.removeClass("glyphicon-ok");
        return false;
    } else {
        div.addClass("has-success");
        span.addClass("glyphicon-ok");
        div.removeClass("has-error");
        span.removeClass("glyphicon-remove");
        return true;
    }
}

function human(id) {
    var div = $("#" + id).closest("div");
    var span = $("#" + id).next("span");

    if ($("#" + id).val() !== "4") //Value of a specific el
    {

        div.addClass("has-error");
        span.addClass("glyphicon-remove");
        div.removeClass("has-success");
        span.removeClass("glyphicon-ok");
        return false;
    } else {

        div.addClass("has-success");
        span.addClass("glyphicon-ok");
        div.removeClass("has-error");
        span.removeClass("glyphicon-remove");
        return true;
    }
}


function phone(id) {
    var div = $("#" + id).closest("div");
    var span = $("#" + id).next("span");

    var val = (Number.isInteger(parseInt($("#" + id).val())));



    if (($("#" + id).val().length !== 9) || (!val))
    {

        div.addClass("has-error");
        span.addClass("glyphicon-remove");
        div.removeClass("has-success");
        span.removeClass("glyphicon-ok");
        return false;
    } else {

        div.addClass("has-success");
        span.addClass("glyphicon-ok");
        div.removeClass("has-error");
        span.removeClass("glyphicon-remove");
        return true;
    }
}

function passCheck(id) {
    var div = $("#" + id).closest("div");
    var span = $("#" + id).next("span");
    if ($("#" + id).val().length < "8") {
        div.addClass("has-error");
        span.addClass("glyphicon-remove");
        div.removeClass("has-success");
        span.removeClass("glyphicon-ok");
        return false;
    } else {
        div.addClass("has-success");
        span.addClass("glyphicon-ok");
        div.removeClass("has-error");
        span.removeClass("glyphicon-remove");
        return true;
    }
}

function pass2Check(id1, id2) {
    var div1 = $("#" + id1).closest("div");
    var span1 = $("#" + id1).next("span");
    var div2 = $("#" + id2).closest("div");
    var span2 = $("#" + id2).next("span");

    if (($("#" + id1).val() !== $("#" + id2).val()) || $("#" + id2).val().length < 8) {
        div1.addClass("has-error");
        span1.addClass("glyphicon-remove");
        div1.removeClass("has-success");
        span1.removeClass("glyphicon-ok");
        div2.addClass("has-error");
        span2.addClass("glyphicon-remove");
        div2.removeClass("has-success");
        span2.removeClass("glyphicon-ok");

        //Show alert
        $("#pass-error").removeClass("hidden");
        return false;
    } else {
        div1.addClass("has-success");
        span1.addClass("glyphicon-ok");
        div1.removeClass("has-error");
        span1.removeClass("glyphicon-remove");
        div2.addClass("has-success");
        span2.addClass("glyphicon-ok");
        div2.removeClass("has-error");
        span2.removeClass("glyphicon-remove");

        //Show alert
        $("#pass-error").addClass("hidden");
        return true;
    }
}

$(document).ready(
        function () {

            $("#username").keyup(function () {
                if (!emptyText("username"))
                    return false;
            });
            $("#email").blur(function () {
                if (!validateEmail("email"))
                    return false;
            });
            $("#name").keyup(function () {
                if (!emptyText("name"))
                    return false;
            });
            $("#lastname").keyup(function () {
                if (!emptyText("lastname"))
                    return false;
            });
            $("#pass1").keyup(function () {
                if (!passCheck("pass1"))
                    return false;
            });
            $("#pass2").keyup(function () {
                if (!passCheck("pass2"))
                    return false;
            });
            $("#phone").keyup(function () {
                if (!phone("phone"))
                    return false;
            });
            $("#human").blur(function () {
                if (!human("human"))
                    return false;
            });

            $("#contactbtn").click(function () { //Button registratioin


                if (!emptyText("username")) {
                    $("#username").focus();
                    return false;
                }

                if (!validateEmail("email")) {
                    $("#email").focus();
                    return false;
                }

                if (!passCheck("pass1")) {
                    $("#pass1").focus();
                    return false;
                }
                if (!passCheck("pass2")) {
                    $("#pass2").focus();
                    return false;
                }

                if (!pass2Check("pass1", "pass2")) {
                    $("#pass1").focus();
                    return false;
                }
                if (!emptyText("name")) {
                    $("#name").focus();
                    return false;
                }
                if (!emptyText("lastname")) {
                    $("#lastname").focus();
                    return false;
                }

                $("form#contactform").submit();
            });

            $("#contactbtn2").click(function () { //Button send email


                if (!emptyText("username")) {
                    $("#username").focus();
                    return false;
                }

                if (!validateEmail("email")) {
                    $("#email").focus();
                    return false;
                }

                if (!phone("phone")) {
                    $("#phone").focus();
                    return false;
                }

                if (!human("human")) {
                    $("#human").focus();
                    return false;
                }

                $('#myModalEmail').modal('show');

                $("#ModalClose").click(function () {

                    $('#contactform')[0].reset();
                });
            });
        }
        );


