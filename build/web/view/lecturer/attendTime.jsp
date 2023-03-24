<%-- 
    Document   : attendTime
    Created on : Dec 12, 2022, 11:05:48 PM
    Author     : T490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Document</title>
    </head>

    <body>
        <div class="container">
            <div class="col-md-12">
                <h1><span>FPT University Academic Portal</span></h1>
                <ol class="breadcrumb">
                    <li>
                        <span><a href="../home">Home</a></span>
                    </li>
                </ol>
                <h2>Single activity Attendance</h2>
                Take attendance for Group: ${requestScope.ses.group.name} <br/>
                Attendance for <strong> ${requestScope.ses.group.subject.name}</strong> will leacturer <strong>${sessionScope.account.username}</strong> at slot ${requestScope.ses.timeslot.id} on ${requestScope.ses.date} - ${requestScope.ses.timeslot.description}, in room ${requestScope.ses.room.name} at FU-HL<br>
                <form action="attendtime" method="POST">
                    <input type="hidden" name="sesid" value="${param.id}"/>
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Code</th>
                                <th>Name</th>
                                <!--<th>Image</th>-->
                                <th>Status</th>
                                <th>Comment</th>
                                <th>Record time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td><font color="#33CCFF">${a.student.id}</font>
                                        <input type="hidden" name="stdid" value="${a.student.id}"/>
                                    </td>
                                    <td><font color="blue">${a.student.name}</font></td>
                                    <td>
                                        <c:if test="${a.present}">
                                            <p><font color="green">Present</font></p>
                                            </c:if>
                                            <c:if test="${!a.present}">
                                            <p><font color="red">Absent</font></p>
                                            </c:if>
                                    </td>
                                    <td>${a.description}</td>
                                    <td>${a.record_time}</td>
                                </tr>   
                            </c:forEach>
                        </tbody>
                    </table>

                    <center> 
                        <button class="btn btn-default"> <a href="javascript:history.back()">Back
                            </a></button> 
                    </center>
                </form>
            </div>
        </div>
    </body>
</html>
