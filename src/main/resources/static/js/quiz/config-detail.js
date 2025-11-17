import {apiUtil} from "../util/apiUtil.js";

// --- 공통 변수 ---
const container = document.querySelector('.quiz-config-detail-container');
const configId = container.dataset.configId;

// --- 1. 수정 폼 토글 기능 ---
const btnEditToggle = document.getElementById('btn-edit-toggle');
const configUpdateCard = document.getElementById('config-update-card');

btnEditToggle.addEventListener('click', () => {
    configUpdateCard.classList.toggle('hidden');
});

// --- 2. 수정 저장 기능 ---
const btnUpdate = document.getElementById('btn-update');
btnUpdate.addEventListener('click', async () => {
    const quizNameInput = document.getElementById('quizName');
    const levelSelect = document.getElementById('quizLevel');

    const quizName = quizNameInput.value;
    const level = levelSelect.value;

    const request = {
        quizName: quizName,
        level: level
    };

    if (!quizName || quizName.trim().length === 0) {
        alert('퀴즈 이름은 1자 이상이어야 합니다.');
        quizNameInput.focus();
        return;
    }
    if (quizName.length > 50) {
        alert('퀴즈 이름은 50자 이하여야 합니다.');
        quizNameInput.focus();
        return;
    }

    try {
        const response = await apiUtil.patch(`/quiz/config/${configId}`, request);
        console.log(response);
        alert('퀴즈 설정이 성공적으로 수정되었습니다.');
        location.reload();
    } catch (e) {
        console.error(e);
        alert('수정 중 오류가 발생했습니다: ' + (e.message || '서버 오류'));
    }
});

// --- 3. 삭제 기능 ---
const btnDelete = document.getElementById('btn-delete');
btnDelete.addEventListener('click', async () => {

    if (!confirm('정말로 이 퀴즈 설정을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.')) {
        return;
    }

    try {
        await apiUtil.delete(`/quiz/config/${configId}`);
        alert('퀴즈 설정이 삭제되었습니다.');
        location.href = `/quiz/configs`;
    } catch (e) {
        console.error(e);
        alert('삭제 중 오류가 발생했습니다: ' + (e.message || '서버 오류'));
    }
});
