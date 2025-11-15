<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<div class="user-profile-card">
    <h2 class="user-name">유어진</h2>
    <p class="user-level">Beginner</p>
</div>

<jsp:include page="quiz/record/statistic.jsp" flush="true"/>


<style>
    /* User Profile */
    .user-profile-card {
        padding: 16px;
        background-color: var(--color-bg-content);
        border-radius: 8px;
        margin-bottom: 20px;
        border: 1px solid var(--color-border);
    }

    .user-name {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 4px;
    }

    .user-level {
        font-size: 0.9rem;
        color: var(--color-text-sub);
    }
</style>