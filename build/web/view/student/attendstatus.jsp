<%-- 
    Document   : attendstatus
    Created on : Dec 9, 2022, 2:11:11 PM
    Author     : T490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="row">
                <div class="col-md-8">
                    <h1>
                        <span>FPT University Academic Portal</span>
                    </h1>
                </div>
                <ol class="breadcrumb">
                    <span><a href="../home">Home</a></span>
                </ol>
            </div>
            <table>
                <tbody>
                    <tr style="border-bottom: 0 none">
                        <td>
                            <div> 
                                <h2>View attendance for <span>${sessions.get(0).group.students.get(0).id} (${sessions.get(0).group.students.get(0).name})</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td valign="top">
                                                <h3>Select a campus/program, term, course ...</h3>
                                                <table summary="Select a course">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Campus/program</th>
                                                            <th scope="col">Term</th>
                                                            <th scope="col">Course</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                                <b>FU-HL</b>
                                                            </td>
                                                            <td valign="top">
                                                                <b>${sessions.get(0).group.sem}${sessions.get(0).group.year}</b>
                                                            </td>
                                                            <td valign="top">
                                                                <div>
                                                                    <table>
                                                                        <tbody>
                                                                            <c:forEach items="${groups}" var="g">
                                                                                <tr>
                                                                                    <td>
                                                                                        <a href="status?stdid=${sessions.get(0).group.students.get(0).id}&subid=${g.subject.id}">
                                                                                            ${g.subject.name}
                                                                                        </a>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <h3>... then see report</h3><br><br>
                                                <table>
                                                    <tbody>
                                                        <tr></tr>
                                                    </tbody>
                                                    <thead> 
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Date</th>
                                                            <th>Slot</th>
                                                            <th>Room</th>
                                                            <th>Lecturer</th>
                                                            <th>Group Name</th>
                                                            <th>Attedance status</th>
                                                            <th>Lecturer's comment</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set var="total" value="0"/>
                                                        <c:set var="absent" value="0"/>
                                                        <c:forEach items="${requestScope.sessions}" var="ses" varStatus="loop">
                                                            <c:set var="total" value="${total+1}"/>
                                                            <tr>
                                                                <td>${loop.index+1}</td>
                                                                <td><span class="label label-primary">${ses.date}</span></td>
                                                                <td><span class="label label-danger">${ses.timeslot.id}_${ses.timeslot.description}</span></td>
                                                                <td>${ses.room.name}</td>
                                                                <td>${ses.lecturer.id}</td>
                                                                <td>${ses.group.name}</td>
                                                                <c:if test="${ses.attandated}">
                                                                    <c:if test="${ses.attandances.get(0).present}">
                                                                        <td>
                                                                            <font color="green">Present</font>
                                                                        </td>
                                                                    </c:if>
                                                                    <c:if test="${!ses.attandances.get(0).present}">
                                                                        <td>
                                                                            <font color="red">Absent</font>
                                                                            <c:set var="absent" value="${absent+1}"/>
                                                                        </td>
                                                                    </c:if>
                                                                </c:if>
                                                                <c:if test="${ses.attandated eq false}">
                                                                    <td>
                                                                        <font color="black">Future</font>
                                                                    </td>
                                                                </c:if>
                                                                <td>${ses.attandances.get(0).description}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr style="text-align: center">
                                                            <td colspan="6">
                                                                ABSENT:    <c:if test="${absent/total <= 0.4}">
                                                                    <span style="color:green"> ${absent/total*100}%</span> / ABSENT SO FAR (${absent} ABSENT ON ${total} TOTAL).
                                                                </c:if>
                                                                <c:if test="${absent/total >= 0.6}">
                                                                    <span style="color:red"> ${absent/total*100}%</span> / ABSENT SO FAR (${absent} ABSENT ON ${total} TOTAL).
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>      
                                    </tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <center> 
                <button class="btn btn-default"> <a href="../home">Back
                    </a></button> 
            </center>
        </div>
    </body>
</html>