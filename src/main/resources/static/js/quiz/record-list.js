import {apiUtil} from "../util/apiUtil.js";
import {formatDate} from "../util/dateUtil.js";
import {getUserId} from "../util/loginUtil.js";

/**
 * 퀴즈 기록 목록을 API에서 가져옵니다.
 * @param {number} userId - 조회할 사용자 ID
 * @returns {Promise<Array<object>>} 퀴즈 기록 목록 (content 배열)
 */
const fetchRecordList = async () => {
    const userId = await getUserId();

    try {
        const response = await apiUtil.get(`/quiz/record?userId=${userId}`);

        if (response && Array.isArray(response.content)) {
            console.log("퀴즈 기록 데이터:", response.content);
            return response.content;
        }

        console.warn("API 응답에서 'content' 배열을 찾을 수 없습니다.", response);
        return [];

    } catch (e) {
        console.error("퀴즈 기록을 불러오는 데 실패했습니다.", e);
        return [];
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

    // 1. JSP로부터 contextPath 읽어오기
    // (list.jsp의 <div id="record-list-container">에 data-context-path 속성으로 값을 전달받음)
    const contextPath = container.dataset.contextPath || '';

    // 2. 목록이 비어있는 경우
    if (!list || list.length === 0) {
        container.innerHTML = `
            <div class="record-list-empty">
                아직 퀴즈 기록이 없습니다.
            </div>
        `;
        return;
    }

    // 3. 목록이 있는 경우: <div>를 <a href="..."> 태그로 변경
    container.innerHTML = list.map(item => `
        <a href="${contextPath}/quiz/records/${item.id}" class="record-item">
            <div class="record-item__info">
                <span class="record-item__name">${item.quizName || '퀴즈 이름 없음'}</span>
                <span class="record-item__date">${formatDate(item.startedAt)}</span>
            </div>
            <div class="record-item__score">
                <span>${item.score}</span>점
            </div>
        </a>
    `).join('');
};

/**
 * 페이지 초기화
 * DOM이 로드된 후 실행됩니다.
 */
const initPage = async () => {
    const recordList = await fetchRecordList();
    renderRecordList(recordList);
};

document.addEventListener('DOMContentLoaded', initPage);