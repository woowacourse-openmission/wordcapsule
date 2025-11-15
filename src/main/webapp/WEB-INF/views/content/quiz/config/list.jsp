<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<div>
    <h1>퀴즈 설정 리스트</h1>
    <c:if test="${empty data.content}">
        <p>생성된 퀴즈 설정이 없습니다.</p>
    </c:if>
    <c:if test="${not empty data.content}">
        <table>
            <thead>
            <tr>
                <th>설정 ID</th>
                <th>이름 (또는 제목)</th>
                <th>레벨</th>
                <th>생성일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="config" items="${data.content}">
                <tr>
                    <td>${config.configId}</td>
                    <td>${config.quizName}</td>
                    <td>${config.level}</td>
                    <td>${config.createdAt}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr>
    </c:if>
</div>