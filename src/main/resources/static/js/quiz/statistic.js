// quiz/statistic.js

import {apiUtil} from '../util/apiUtil.js';

/**
 * 시간을 분:초 형식으로 변환하는 헬퍼 함수
 */
const formatTime = (seconds) => {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = (seconds % 60).toString().padStart(2, '0');
    return `${minutes}:${remainingSeconds}`;
};

/**
 * 퀴즈 통계 데이터를 화면에 업데이트하는 함수 (수정됨)
 */
const updateStatistics = (statisticData) => {
    // 1. 통계 값 업데이트
    document.getElementById('statStreakDays').textContent = statisticData.streakDays;
    const rate = (statisticData.correctAnswerRate * 100).toFixed(0);
    document.getElementById('statCorrectRate').textContent = rate;
    const avgTimeFormatted = formatTime(statisticData.averageSolveTime.toFixed(0));
    document.getElementById('statAvgTime').textContent = avgTimeFormatted;

    // 2. 시간대별 활동 패턴 (그래프 로직 수정)
    const activeTimes = statisticData.activePlayTimeRange;
    const chartContainer = document.getElementById('activePlayTimeChart');

    // (요청 1) 멘트 표시 영역 (오류/데이터 없음 메시지 표시용)
    const peakContainer = document.getElementById('activePlayTimePeak');

    if (!chartContainer) {
        console.error("Critical Error: 'activePlayTimeChart' element not found in the DOM.");
        return;
    }

    // (요청 1) 멘트 표시 영역이 있다면, 데이터 로딩이 시작되었으므로 기본적으로 숨김
    if (peakContainer) {
        peakContainer.style.display = 'none';
        peakContainer.innerHTML = ''; // 내용 초기화
    }

    // (요청 2) 데이터를 2시간 단위 12개 블록으로 집계
    const hourlyCounts = [];
    for (let i = 0; i < 12; i++) {
        const hour1 = i * 2;
        const hour2 = i * 2 + 1;
        const hourKey1 = `H${hour1.toString().padStart(2, '0')}`;
        const hourKey2 = `H${hour2.toString().padStart(2, '0')}`;

        const count1 = activeTimes[hourKey1] || 0;
        const count2 = activeTimes[hourKey2] || 0;
        const totalCount = count1 + count2;

        hourlyCounts.push(totalCount);
    }

    const maxPlays = Math.max(...hourlyCounts);
    const maxHeightPercent = 100; // 막대 최대 높이 (CSS .chart-item 높이 100px 기준)

    let chartHtml = '';

    // 데이터가 아예 없을 경우 처리
    if (maxPlays === 0) {
        if (peakContainer) {
            peakContainer.innerHTML = '<p class="text-sub">아직 활동 기록이 없습니다.</p>';
            peakContainer.style.display = 'block'; // 이 경우엔 다시 보이게
        }
    }

    // (요청 2 & 3) 12개의 막대 HTML 생성
    for (let i = 0; i < 12; i++) {
        const count = hourlyCounts[i];

        // 막대 높이 계산
        const heightPercent = maxPlays > 0 ? (count / maxPlays) * maxHeightPercent : 0;
        const isPeak = maxPlays > 0 && count === maxPlays;

        // 레이블 생성 (요청 3: 0, 2, 4...)
        const hourStart = i * 2;
        const hourEnd = hourStart + 2;
        const timeLabel = `${hourStart}`; // 예: "0", "2"
        const titleText = `${hourStart.toString().padStart(2, '0')}-${hourEnd.toString().padStart(2, '0')}시: ${count}회`; // 툴팁

        // 새로운 HTML 구조 생성
        chartHtml += `
            <div class="chart-item" title="${titleText}">
                <div 
                    class="column-chart-bar ${isPeak ? 'is-peak' : ''}"
                    style="height: ${heightPercent}%;"
                ></div>
                
                <!-- (요청 4) 갯수 표시는 CSS에서 display:none 처리됨 -->
                <div class="chart-bar-value">
                    ${count}
                </div>
                
                <!-- (요청 3) 시간 레이블 -->
                <div class="chart-label">
                    ${timeLabel}
                </div>
            </div>
        `;
    }

    // 그래프 컨테이너 업데이트
    chartContainer.innerHTML = chartHtml;

    // (요청 1) 최다 활동 시간 텍스트 업데이트 로직 (제거됨)
};

/**
 * API를 호출하고 데이터를 화면에 업데이트하는 주 함수
 */
const fetchStatistic = async (userId) => {
    const statElements = ['statStreakDays', 'statCorrectRate', 'statAvgTime'];
    // (요청 1) peakContainer 참조는 오류 메시지 표시용으로 유지
    const peakContainer = document.getElementById('activePlayTimePeak');
    const chartContainer = document.getElementById('activePlayTimeChart');

    try {
        const statisticData = await apiUtil.get(`/quiz/record/statistic?userId=${userId}`);
        console.log(statisticData)

        if (!statisticData || typeof statisticData.streakDays === 'undefined') {
            throw new Error("Invalid statistic data structure received.");
        }

        updateStatistics(statisticData);

    } catch (error) {
        console.error('데이터 조회 실패:', error);

        statElements.forEach(id => {
            const element = document.getElementById(id);
            if (element) element.textContent = '—';
        });

        // (수정) 오류 발생 시 peakContainer를 다시 표시
        if (peakContainer) {
            peakContainer.innerHTML = `<p class="text-sub">통계 데이터를 불러오지 못했습니다.</p>`;
            peakContainer.style.display = 'block'; // 오류 메시지 표시
        }
        if (chartContainer) {
            chartContainer.innerHTML = '';
        }
    }
};

// 사용자 ID 1에 대해 통계 데이터 로드 시작
fetchStatistic(1);