import {apiUtil} from "../util/apiUtil.js";

/**
 * 날짜 문자열(ISO)을 "YYYY. MM. DD. HH:MM" 형식으로 변환합니다.
 * @param {string} isoString - ISO 8601 날짜 문자열
 * @returns {string} 포맷팅된 날짜
 */
const formatDate = (isoString) => {
    if (!isoString) return '';
    try {
        const date = new Date(isoString);

        // KST(UTC+9)를 수동으로 적용 (Date 객체가 로컬 타임존을 사용하므로)
        // 만약 서버 시간이 이미 KST라면 new Date()만으로 충분합니다.
        // new Date()가 UTC로 해석한다면 KST 보정이 필요할 수 있습니다.
        // 여기서는 isoString이 로컬 타임존(KST)으로 바로 변환된다고 가정합니다.

        const y = date.getFullYear();
        const m = String(date.getMonth() + 1).padStart(2, '0');
        const d = String(date.getDate()).padStart(2, '0');
        const h = String(date.getHours()).padStart(2, '0');
        const min = String(date.getMinutes()).padStart(2, '0');

        return `${y}. ${m}. ${d}. ${h}:${min}`;
    } catch (e) {
        console.error("날짜 포맷팅 오류:", e);
        return "날짜 정보 없음";
    }
};

/**
 * 퀴즈 기록 목록을 API에서 가져옵니다.
 * @param {number} userId - 조회할 사용자 ID
 * @returns {Promise<Array<object>>} 퀴즈 기록 목록 (content 배열)
 */
const fetchRecordList = async (userId = 1) => {
    try {
        // API 요청 및 JSON 응답 파싱
        const response = await apiUtil.get(`/quiz/record?userId=${userId}`);

        // 응답 구조에서 content 배열 반환
        if (response && Array.isArray(response.content)) {
            console.log("퀴즈 기록 데이터:", response.content);
            return response.content;
        }

        // content가 없거나 배열이 아닌 경우
        console.warn("API 응답에서 'content' 배열을 찾을 수 없습니다.", response);
        return [];

    } catch (e) {
        console.error("퀴즈 기록을 불러오는 데 실패했습니다.", e);
        return []; // 오류 발생 시 빈 배열 반환
    }
};

/**
 * 퀴즈 기록 목록을 화면에 렌더링합니다.
 * @param {Array<object>} list - 퀴즈 기록 데이터 배열
 */
const renderRecordList = (list) => {
    const container = document.getElementById('record-list-container');
    if (!container) {
        console.error("#record-list-container 요소를 찾을 수 없습니다.");
        return;
    }

    // 1. 목록이 비어있는 경우
    if (!list || list.length === 0) {
        container.innerHTML = `
            <div class="record-list-empty">
                아직 퀴즈 기록이 없습니다.
            </div>
        `;
        return;
    }

    // 2. 목록이 있는 경우
    container.innerHTML = list.map(item => `
        <div class="record-item">
            <div class="record-item__info">
                <span class="record-item__name">${item.quizName || '퀴즈 이름 없음'}</span>
                <span class="record-item__date">${formatDate(item.startedAt)}</span>
            </div>
            <div class="record-item__score">
                <span>${item.score}</span>점
            </div>
        </div>
    `).join('');
};

/**
 * 페이지 초기화
 * DOM이 로드된 후 실행됩니다.
 */
const initPage = async () => {
    // 유저 ID (임시로 1 사용, 실제로는 로그인 정보에서 가져와야 함)
    const userId = 1;

    const recordList = await fetchRecordList(userId);
    renderRecordList(recordList);
};

// DOM이 준비되면 스크립트 실행
// (JSP가 <main> 내에 포함되므로, 전체 DOM 로드를 기다리는 것이 안전)
document.addEventListener('DOMContentLoaded', initPage);