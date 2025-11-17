import {apiUtil} from "../util/apiUtil.js";
// (참고) dateUtil.js에 'export const formatDate = (...) => { ... }'가 있어야 합니다.
import {formatDate} from "../util/dateUtil.js";
import {getUserId} from "../util/loginUtil.js";

// --- 모듈 스코프 변수 ---
let currentUserId = null;  // 현재 사용자 ID
let contextPath = '';      // JSP의 ContextPath
let listContainer = null;  // 기록 목록 DOM 요소
let paginationContainer = null; // 페이지네이션 DOM 요소

/**
 * 퀴즈 기록 목록을 화면에 렌더링 (전체 교체)
 * @param {Array<object>} list - 새로 불러온 퀴즈 기록 데이터 배열
 */
const renderRecordList = (list) => {
    if (!listContainer) return;

    // 1. 목록이 비어있는 경우
    if (!list || list.length === 0) {
        listContainer.innerHTML = `
            <div class="record-list-empty">
                아직 퀴즈 기록이 없습니다.
            </div>
        `;
        return;
    }

    // 2. 목록이 있는 경우 (기존 내용 전체 삭제 후 추가)
    listContainer.innerHTML = '';

    // DocumentFragment를 사용해 DOM 추가 최적화
    const fragment = document.createDocumentFragment();

    list.forEach(item => {
        const link = document.createElement('a');
        link.href = `${contextPath}/quiz/record/${item.id}`;
        link.className = 'record-item';
        link.innerHTML = `
            <div class="record-item__info">
                <span class="record-item__name">${item.quizName || '퀴즈 이름 없음'}</span>
                <span class="record-item__date">${formatDate(item.startedAt)}</span>
            </div>
            <div class="record-item__score">
                <span>${item.score}</span>점
            </div>
        `;
        fragment.appendChild(link);
    });

    // 기존 목록에 새로운 아이템들 추가
    listContainer.appendChild(fragment);
};

/**
 * 페이지네이션 UI를 렌더링합니다.
 * @param {object} pageResponse - API의 페이징 응답 데이터
 */
const renderPagination = (pageResponse) => {
    if (!paginationContainer) return;

    const {page, totalPages, first, last} = pageResponse;
    const currentPage = page; // 0-based

    // 1페이지거나 페이지가 없는 경우 렌더링 안함
    if (totalPages <= 1) {
        paginationContainer.innerHTML = '';
        return;
    }

    let html = '';

    // 5개 페이지 그룹 (0-4, 5-9, ...)
    const pageGroupSize = 5;
    const startPage = Math.floor(currentPage / pageGroupSize) * pageGroupSize;
    const endPage = Math.min(startPage + pageGroupSize - 1, totalPages - 1);

    // [이전] 버튼
    if (!first) {
        html += `<a href="#" class="page-link" data-page="${currentPage - 1}">&laquo;</a>`;
    } else {
        html += `<span class="page-link disabled">&laquo;</span>`;
    }

    // 페이지 번호
    for (let i = startPage; i <= endPage; i++) {
        const activeClass = (i === currentPage) ? 'active' : '';
        html += `<a href="#" class="page-link ${activeClass}" data-page="${i}">${i + 1}</a>`;
    }

    // [다음] 버튼
    if (!last) {
        html += `<a href="#" class="page-link" data-page="${currentPage + 1}">&raquo;</a>`;
    } else {
        html += `<span class="page-link disabled">&raquo;</span>`;
    }

    paginationContainer.innerHTML = html;
};

/**
 * URL의 쿼리 파라미터를 업데이트합니다. (페이지 리로드 없이)
 * @param {number} page - 새 페이지 번호
 */
const updateURL = (page) => {
    const newUrl = `${window.location.pathname}?page=${page}`;
    // 페이지 상태를 history에 push (브라우저 뒤로가기/앞으로가기 지원을 위함)
    history.pushState({page: page}, '', newUrl);
};


/**
 * 퀴즈 기록 목록 페이지를 API에서 가져오고 렌더링합니다.
 * @param {number} page - 조회할 페이지 번호
 */
const loadPage = async (page) => {
    if (!currentUserId) {
        console.error("사용자 ID가 없습니다.");
        renderRecordList([]); // 빈 화면 표시
        return;
    }

    try {
        // API 요청 (size=10은 컨트롤러 기본값과 일치)
        const response = await apiUtil.get(`/quiz/record?userId=${currentUserId}&page=${page}&size=5`);

        if (response && response.content) {
            // 1. 목록 렌더링
            renderRecordList(response.content);
            // 2. 페이지네이션 렌더링
            renderPagination(response);
            // 3. URL 업데이트
            updateURL(page);
        } else {
            console.warn("API 응답이 올바르지 않습니다.", response);
            renderRecordList([]);
            renderPagination({});
        }
    } catch (e) {
        console.error("퀴즈 기록을 불러오는 데 실패했습니다.", e);
        listContainer.innerHTML = `<div class="record-list-empty" style="color: var(--color-error);">기록을 불러오는 데 실패했습니다.</div>`;
    }
};

/**
 * 페이지네이션 클릭 이벤트 핸들러
 */
const onPageClick = (event) => {
    event.preventDefault(); // 링크의 기본 동작(페이지 이동) 방지
    const target = event.target.closest('.page-link');

    // 비활성화된 버튼이나 data-page 속성이 없으면 무시
    if (!target || target.classList.contains('disabled') || target.dataset.page === undefined) {
        return;
    }

    const newPage = Number(target.dataset.page);
    loadPage(newPage);
};

/**
 * 브라우저의 뒤로가기/앞으로가기 버튼(popstate) 이벤트 핸들러
 */
const onPopState = (event) => {
    // history.pushState로 저장한 state 객체에서 페이지 번호 가져오기
    const page = event.state?.page || 0;
    loadPage(page);
};

/**
 * 페이지 초기화
 * DOM이 로드된 후 실행됩니다.
 */
const initPage = async () => {
    // 전역 변수에 DOM 요소 할당
    listContainer = document.getElementById('record-list-container');
    paginationContainer = document.getElementById('pagination-container'); // 새 컨테이너

    if (!listContainer || !paginationContainer) {
        console.error("#record-list-container 또는 #pagination-container 요소를 찾을 수 없습니다.");
        return;
    }

    // JSP로부터 contextPath 읽어오기
    contextPath = listContainer.dataset.contextPath || '';

    // 사용자 ID 가져오기
    try {
        currentUserId = await getUserId();
        if (!currentUserId) throw new Error('User ID is null or undefined.');
    } catch (e) {
        console.error('Failed to get user ID:', e);
        listContainer.innerHTML = '<div class="record-list-empty" style="color: var(--color-error);">사용자 정보를 불러올 수 없습니다.</div>';
        return;
    }

    // 페이지네이션 클릭 이벤트 리스너 등록
    paginationContainer.addEventListener('click', onPageClick);

    // 브라우저 뒤로가기/앞으로가기 이벤트 리스너 등록
    window.addEventListener('popstate', onPopState);

    // URL에서 초기 페이지 번호 가져오기 (없으면 0)
    const urlParams = new URLSearchParams(window.location.search);
    const initialPage = Number(urlParams.get('page')) || 0;

    // 첫 페이지 데이터 로드
    await loadPage(initialPage);
};

// DOM이 준비되면 스크립트 실행
document.addEventListener('DOMContentLoaded', initPage);