<%-- 
    Document   : attendstatus
    Created on : Dec 10, 2022, 10:07:35 PM
    Author     : T490
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div class="container ">
            <div class="col-md-12">
                <h1><span>FPT University Academic Portal</span></h1>
                <ol class="breadcrumb">
                    <li>
                        <span><a href="../home">Home</a></span>
                    </li>
                </ol>
                <form action="status" method="post">
                    <c:forEach  items="${requestScope.group.sessions}" var="ses"  begin="0" end="0">
                        <b>Status attendance of group: ${ses.group.name}</b> <br/>
                        Lecturer: ${ses.lecturer.name} <br/>
                        Subject: ${ses.group.subject.name} <br/>
                        Room: ${ses.room.name}
                    </c:forEach>
                </form>
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Group</th>
                            <th>Student ID</th>
                            <th>Full Name</th>
                                <c:forEach items="${requestScope.group.sessions}" var="ses" varStatus="loop">
                                <th> Slot ${loop.index+1} <br>
                                    <fmt:formatDate value="${ses.date}" pattern="dd/MM"/>
                                </th>
                            </c:forEach>
                            <th>Absent</th>                         
                        </tr>
                    </thead>
                    <c:forEach items="${requestScope.group.students}" var="std" varStatus="loop"> 
                        <tr>
                            <c:set var="total" value="0"/>
                            <c:set var="absent" value="0"/>
                            <td>${loop.index+1}</td>
                            <td>${requestScope.group.id}</td>
                            <td>${std.id}</td>
                        <input type="hidden" name="stdid" value="${a.student.id}"/>
                        <td>${std.name}</td> 
                        <!-- need a loop -->    
                        <c:forEach items="${requestScope.group.sessions}" var="a">  
                            <c:set var="total" value="${total+1}"/>
                            <c:forEach items="${a.attandances}" var="b">               
                                <c:if test="${b.student.id eq std.id}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${b.present}">
                                                <p><font color="green">Present</font></p>
                                                </c:when> 
                                                <c:when test="${!a.attandated}">
                                                <p> Not yet </p>
                                            </c:when> 
                                            <c:otherwise>
                                                <p><font color="red">Absent</font></p>
                                                    <c:set var="absent" value="${absent+1}"/>
                                                </c:otherwise>
                                            </c:choose>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </c:forEach>   
                        <c:if test="${absent/total <= 0.4}">
                            <td><font color="green">${absent/total*100}/100%</font></td>
                            </c:if>
                            <c:if test="${absent/total >= 0.6}">
                            <td><font color="red">${absent/total*100}/100%</font></td>
                            </c:if>
                        </c:forEach>    
                    </tr>   
                </table>
                <c:forEach  items="${requestScope.group.sessions}" var="ses"  begin="0" end="0">
                    <center> 
                        <button class="btn btn-default"> <a href="timetable?lid=${ses.lecturer.id}">Back
                            </a></button> 
                    </center>
                </c:forEach>
            </div>
        </div>
    </body>
</html>