import {apiUtil} from "../util/apiUtil.js";

const fetchRecordList = async (recordId = 10) => {
    try {
        const response = await apiUtil.get(`/quiz/record/${recordId}`);
        console.log(response)
        return response;
    } catch (e) {
        console.error("퀴즈 기록을 불러오는 데 실패했습니다.", e);
        return []; // 오류 발생 시 빈 배열 반환
    }
};

fetchRecordList();
