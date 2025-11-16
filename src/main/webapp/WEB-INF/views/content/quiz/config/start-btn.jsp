<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<div class="btn-container">
    <button class="btn-primary">
        퀴즈 시작
    </button>
</div>

<style>
    .btn-container {
        padding: 24px 0;
    }
</style>