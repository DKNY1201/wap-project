<%--
  Created by IntelliJ IDEA.
  User: Quy
  Date: 9/22/17
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login Success</title>
</head>
<body>
    <c:set var="username" value="${null}" scope="page" />
    <c:set var="sessionID" value="${null}" scope="page" />
    <c:set var="user" value="${sessionScope.sesUsername}" scope="page" />

    <c:forEach items="${cookie}" var="currentCookie">
        <c:if test="${currentCookie.key.equals('cokiUsername')}">
            <c:set var="username" value="${currentCookie.value.value}" />
        </c:if>
        <c:if test="${currentCookie.key.equals('JSESSIONID')}">
            <c:set var="sessionID" value="${currentCookie.value.value}" />
        </c:if>
    </c:forEach>

    <c:choose>
        <c:when test="${not empty username}">
            <h1>Hello <c:out value="${username}" />. Your session ID: <c:out value="${sessionID}" /></h1>
            <h2>User: <c:out value="${user}" /></h2>
        </c:when>
        <c:otherwise>
            <c:redirect url="login.html" />
        </c:otherwise>
    </c:choose>


    <br>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
