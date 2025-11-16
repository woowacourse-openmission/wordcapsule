/**
 * 날짜 문자열(ISO)을 "YYYY. MM. DD. HH:MM" 형식으로 변환합니다.
 * @param {string} isoString - ISO 8601 날짜 문자열
 * @returns {string} 포맷팅된 날짜
 */
export const formatDate = (isoString) => {
    if (!isoString) return '';
    try {
        const date = new Date(isoString);

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