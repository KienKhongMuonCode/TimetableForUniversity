<%-- 
    Document   : home
    Created on : Dec 12, 2022, 10:20:19 PM
    Author     : T490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/style.css">
        <title>Document</title>
    </head>
    <body>

        <div class="container">
            <div class="col-md-12">
                <center>
                    <h1><span>FPT University Academic Portal</span></h1>
                    <c:if test="${sessionScope.account ne null}">
                        <div>
                            <ol class="breadcrumb">
                                <li>
                                    <span>Hello <b>${sessionScope.account.displayname}</b>,  click 
                                        <a href="logout">here</a> 
                                        to logout.</span>
                                </li>
                            </ol>
                        </div>
                        <br>
                        <br>
                        <div class="box" style=" width: 100%">
                            <fieldset>
                                <legend>
                                    <span class="label  btn-warning">
                                        <b>Academic Information</b>
                                    </span>
                                </legend>
                                <c:if test="${sessionScope.account.roles.get(0).id eq 1}">
                                    <div class="listBoxWrapper">

                                        <center>
                                            <h4>Information Access(Tra cứu thông tin)</h4>
                                            <a href="lecturer/timetable?lid=${sessionScope.account.username}">Timetable (Thời khoá biểu)</a>
                                        </center>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.account.roles.get(0).id eq 2}">
                                    <div class="listBoxWrapper">
                                        <center>
                                            <h4>Information Access(Tra cứu thông tin)</h4>
                                            <a href="student/timetable?stdid=${sessionScope.account.username}">Timetable</a> (Thời khoá biểu) <br/>
                                            <a href="student/status?stdid=${sessionScope.account.username}&subid=${groups.get(0).subject.id}">Attendance report</a> (Báo cáo điểm danh)
                                        </center>
                                    </div>
                                </c:if>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account eq null}">
                        <h2>You are not logged in yet!</h2> 
                        <center> 
                        <button class="btn btn-default"> <a href="login">Go to Login
                            </a></button> 
                    </center>
                    </c:if>
                </center>
            </div>
        </div>
    </body>
</html>