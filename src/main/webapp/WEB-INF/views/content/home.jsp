<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<script type="module" src="/js/home.js"></script>

<div class="user-profile-card">
    <h2 class="user-name">유어진</h2>
    <p class="user-level">Beginner</p>
</div>

<hr class="divider">

<h3 class="section-title">🔥 퀴즈 기록 통계</h3>
<div class="statistic-grid">

    <div class="stat-card stat-primary">
        <p class="stat-label">연속 학습 일수</p>
        <p class="stat-value" id="statStreakDays">로딩 중...</p>
        <span class="stat-unit">일</span>
    </div>
    <div class="stat-card stat-success">
        <p class="stat-label">정답률</p>
        <p class="stat-value" id="statCorrectRate">로딩 중...</p>
        <span class="stat-unit">%</span>
    </div>
    <div class="stat-card stat-info">
        <p class="stat-label">평균 풀이 시간</p>
        <p class="stat-value" id="statAvgTime">로딩 중...</p>
        <span class="stat-unit">분:초</span>
    </div>
</div>

<div class="time-activity-card">
    <h4 class="card-subtitle">시간대별 활동 패턴</h4>

    <!--
      요청 1: "주로 활동하는 시간" 멘트 삭제
      - div#activePlayTimePeak 요소를 완전히 삭제했습니다.
      - (단, JS에서 오류 메시지 표시용으로 해당 ID를 참조할 수 있으므로,
         CSS 충돌을 피하기 위해 관련 스타일만 제거합니다.)
    -->

    <!--
      (수정) div#activePlayTimePeak를 남겨두되, JS에서 오류/데이터 없음 메시지
      표시용으로만 사용하도록 합니다. (e.g., 로딩 실패, 기록 없음)
    -->
    <div id="activePlayTimePeak" class="time-activity-peak">
        <!-- JS가 "데이터 로딩 중..." 또는 오류 메시지를 삽입합니다. -->
        <p class="text-sub">데이터 로딩 중...</p>
    </div>

    <!--
      요청 2 & 3: 2시간 단위 그래프 및 하단 숫자 표시
      - JS가 이 컨테이너 내부에 새로운 .chart-item 구조를 생성합니다.
    -->
    <div id="activePlayTimeChart" class="column-chart-container">
        <!-- JS에 의해 동적으로 채워질 영역 -->
    </div>
</div>

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

    /* 통계 섹션 */
    .section-title {
        font-size: 1.2rem;
        font-weight: 700;
        margin-bottom: 16px;
    }

    .divider {
        border: 0;
        height: 1px;
        background-color: var(--color-border);
        margin: 24px 0;
    }

    /* 통계 카드 레이아웃 */
    .statistic-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
        margin-bottom: 24px;
    }

    /* 통계 카드 디자인 */
    .stat-card {
        padding: 12px 8px;
        background-color: var(--color-bg-content);
        border-radius: 8px;
        text-align: center;
        border: 1px solid var(--color-border);
    }

    .stat-card.stat-primary {
        border-top: 4px solid var(--color-primary);
    }

    .stat-card.stat-success {
        border-top: 4px solid #4CAF50; /* Primary와 다른 색상 */
    }

    .stat-card.stat-info {
        border-top: 4px solid #03A9F4; /* Primary와 다른 색상 */
    }

    .stat-label {
        font-size: 0.8rem;
        color: var(--color-text-sub);
        margin-bottom: 4px;
        font-weight: 500;
    }

    .stat-value {
        font-size: 1.8rem;
        font-weight: 700;
        margin: 0;
        line-height: 1.2;
    }

    .stat-unit {
        font-size: 0.8rem;
        color: var(--color-text-sub);
        margin-top: 4px;
    }

    /* 시간대별 활동 카드 컨테이너 */
    .time-activity-card {
        padding: 16px;
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px solid var(--color-border);
    }

    .card-subtitle {
        font-size: 1rem;
        font-weight: 700;
        margin-bottom: 12px;
    }

    .text-sub {
        color: var(--color-text-sub);
        font-size: 0.9rem;
    }

    /* ---------------------------------------------------- */
    /* 📈 시간대별 활동 그래프 (수정됨) */
    /* ---------------------------------------------------- */

    /* 최다 활동 시간대 표시 영역 (수정) */
    .time-activity-peak {
        /*
        padding: 8px 0;
        font-size: 1rem;
        font-weight: 700;
        color: var(--color-primary);
        */

        /* JS에서 데이터 없음/오류 메시지 표시용으로만 사용 */
        /* 기본적으로는 숨김 처리 (JS에서 데이터 로딩 시 숨김) */
        text-align: center;
        padding: 8px 0;
    }

    /* .peak-label 관련 스타일 삭제 (요청 1) */

    /* 세로 막대 그래프 컨테이너 (수정됨) */
    .column-chart-container {
        display: flex;
        justify-content: space-around; /* 12개 아이템 균등 배치 */
        align-items: stretch; /* 아이템이 전체 높이를 채우도록 */
        height: 120px; /* 수정된 높이: 막대(100px) + 레이블(14px) + 여백 */
        margin-top: 15px;
        /* border-bottom은 개별 막대로 이동 */
    }

    /* (신규) 막대 + 숫자 + 레이블 래퍼 */
    .chart-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-end; /* 막대가 하단에 정렬되도록 */
        width: 8%; /* 12개 아이템 배치 (100/12 approx) */
        position: relative;
    }

    /* 세로 막대 아이템 (수정됨) */
    .column-chart-bar {
        width: 70%; /* .chart-item 너비의 70% */
        background-color: var(--color-primary);
        border-radius: 2px 2px 0 0;
        transition: height 0.5s ease-out;
        cursor: help; /* 툴팁을 보여줄 수 있도록 힌트 제공 */
        height: 0; /* JS가 높이 설정 */
        border-bottom: 1px solid var(--color-border); /* X축 역할 */
    }

    .column-chart-bar:hover {
        background-color: #388E3C; /* Darker green on hover */
    }

    .column-chart-bar.is-peak {
        background-color: #4CAF50; /* 피크 시간대는 Primary 색상 사용 */
        box-shadow: 0 0 5px rgba(76, 175, 80, 0.5); /* 강조 효과 */
    }

    /* (수정) 막대 하단 활동 횟수 (갯수 표시 안함) */
    .chart-bar-value {
        /* 요청 사항: 갯수 표시 안함 */
        display: none;
    }

    /* 갯수 표시 안함 요청으로 인해 더 이상 필요 없음 */
    .chart-bar-value.is-visible {
    }

    /* (신규) 막대 하단 시간 레이블 (요청 2) */
    .chart-label {
        font-size: 0.7rem;
        color: var(--color-text-sub);
        margin-top: 2px;
        height: 14px; /* 높이 고정 */
        white-space: nowrap;
    }
</style>