<%-- 
    Document   : timetable
    Created on : Oct 26, 2022, 2:20:36 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Table</title>
    </head>
    <style>
        .home{
           padding-top: 10px;
           text-align: center; 
           align-items: center;
        }
    </style>
    <body>
        Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
        <form action="timetable" method="GET">
            <input type="hidden" name="lid" value="${param.lid}"/>
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/> 
        </form>
        <table border="1px">
            <tr style="background-color: #6b90da;">
                <td> </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.description}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a href="takeatt?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                    <br/>
                                    ${ses.room.name}
                                    <c:if test="${ses.attandated}">
                                        <img style="width: 15px;" src="../img/png-transparent-green-area-pattern-green-tick-file-green-check-illustration-angle-text-hand-thumbnail.png" alt=""/>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        <img style="width: 15px;" src="../img/red-x-red-x-11563060665ltfumg5kvi.png" alt=""/>
                                    </c:if>
                                </c:if>
                                  
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
            <div class="home"><button><a href="../home">Home</a></button></div>
    </body>
</html