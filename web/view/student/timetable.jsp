<%-- 
    Document   : timetable
    Created on : Dec 10, 2022, 3:18:23 PM
    Author     : T490
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
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
        <title>JSP Page</title>
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
                <form action="timetable" method="GET">
                    <div class=" text-center">
                        Student: <input type="text" readonly="readonly" value="${requestScope.student.name}"/>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th rowspan="2">
                                    <input type="hidden" name="stdid" value="${param.stdid}"/>
                                    From: <input type="date" name="from" value="${requestScope.from}"/>
                                    <br>
                                    To  : <input type="date" name="to" value="${requestScope.to}"/>
                                    <input class="btn-success" type="submit" value="View"/> 
                                </th>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <th>${helper.getDayNameofWeek(d)}</th>
                                    </c:forEach>
                            </tr>
                            <tr>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <th>
                                        <fmt:formatDate value="${d}" pattern="dd/MM"/>
                                    </th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.slots}" var="slot">
                                <tr>
                                    <td>Slot ${slot.id} <br/> <span class="label label-success">${slot.description}</span></td> 
                                    
                                    <c:forEach items="${requestScope.dates}" var="d">
                                        <td>
                                            <c:forEach items="${requestScope.sessions}" var="ses">

                                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                                    <a href="">${ses.group.name}-${ses.group.subject.name}</a>
                                                    <br/>
                                                    ${ses.room.name}
                                                    <br/>

                                                    <c:if test="${ses.attandated}">
                                                        <c:if test="${ses.attandances.get(0).present}">
                                                            <a href=""><font color="green">(Present)</font></a>
                                                            </c:if>
                                                            <c:if test="${!ses.attandances.get(0).present}">
                                                            <a href=""><font color="red">(Absent)</font></a>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${!ses.attandated}">
                                                        <a href=""><font color="black">(Not yet)</font></a>  
                                                        </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>