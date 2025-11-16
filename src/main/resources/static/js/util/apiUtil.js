/**
 * @fileoverview API 요청을 위한 공통 유틸리티
 * * Kotlin DTO 구조 (BaseResponse, DataResponse, ErrorResponse, SimpleResponse)에 맞춰 응답을 처리합니다.
 */

const API_BASE_URL = '/api'; // 프로젝트의 기본 API 경로에 맞게 수정하세요.

/**
 * 응답의 성공 여부를 확인하고 데이터를 반환하거나 에러를 throw하는 내부 함수.
 * * @param {Response} response - fetch API의 Response 객체
 * @returns {Promise<object>} 응답 본문 데이터
 * @throws {Error} 서버 응답이 실패 상태일 경우
 */
async function handleResponse(response) {
    // 204 No Content는 본문(body)이 없으므로, response.json() 호출 전에 처리해야 합니다.
    if (response.status === 204) {
        // SimpleResponse.noContent()에 대응
        return {
            code: 'S003', // ResponseCode.NO_CONTENT.code
            message: '처리되었습니다' // SimpleResponse.noContent()의 기본 메시지
        };
    }

    // JSON 파싱 시도 (JSON이 아닌 응답이 올 경우를 대비)
    let responseData;
    try {
        responseData = await response.json();
    } catch (e) {
        // 본문이 비어있거나 JSON 형식이 아닐 경우
        if (response.ok) {
            return {}; // 성공했지만 본문이 없는 경우
        }
        // 실패했으나 본문이 없는 경우
        throw new Error(`HTTP 오류: ${response.status} ${response.statusText}`);
    }

    // 1. HTTP 상태 코드 확인 (2xx가 아닌 경우 실패로 간주)
    if (!response.ok) {
        // ErrorResponse 구조를 따르는지 확인하고 메시지를 추출합니다.
        const errorResponse = responseData;
        const errorMessage = errorResponse.message || `API 요청 실패 (${response.status})`;

        // 상세 에러(ErrorDetailResponse)가 있다면 로그에 출력합니다.
        if (errorResponse.errors && Array.isArray(errorResponse.errors) && errorResponse.errors.length > 0) {
            console.error('Validation Errors:', errorResponse.errors);
        }

        // 전체 에러 응답 객체를 에러 객체에 담아 throw
        const error = new Error(errorMessage);
        error.response = responseData; // 상세 응답 정보를 에러 객체에 추가
        throw error;
    }

    // 2. 응답 성공 (DataResponse 또는 SimpleResponse)
    // DataResponse와 SimpleResponse 모두 BaseResponse를 상속받으므로 code와 message를 가집니다.
    return responseData;
}

/**
 * 공통 API 요청 함수.
 * * @param {string} endpoint - API 엔드포인트 (예: '/users')
 * @param endpoint
 * @param {string} method - HTTP 메서드 (예: 'GET', 'POST', 'DELETE')
 * @param {object | null} [data=null] - 요청 본문 데이터 (POST, PUT, PATCH 등에 사용)
 * @returns {Promise<object>} 응답의 'data' 필드 값 (DataResponse의 경우) 또는 전체 응답 객체 (SimpleResponse의 경우)
 */
async function request(endpoint, method = 'GET', data = null) {
    const url = `${API_BASE_URL}${endpoint}`;

    // 기본 옵션 설정
    const options = {
        method: method,
        headers: {
            'Content-Type': 'application/json',
            // 'User-Id': '1' // UserController처럼 헤더에 ID를 요구하는 경우 설정 가능
        },
    };

    // 본문 데이터 설정 (POST, PUT, PATCH의 경우)
    if (data && ['POST', 'PUT', 'PATCH'].includes(method.toUpperCase())) {
        options.body = JSON.stringify(data);
    }

    try {
        const response = await fetch(url, options);
        const result = await handleResponse(response);

        // DataResponse일 경우, 실제 데이터 필드(data)를 반환하여 사용 편의성을 높입니다.
        if (result.code && result.data !== undefined) {
            return result.data;
        }

        // SimpleResponse(No Content, Accepted 등)의 경우 전체 응답 객체를 반환합니다.
        return result;

    } catch (error) {
        console.error(`API 호출 에러 (${method} ${url}):`, error);

        // 에러 메시지 표시 (토이 프로젝트이므로 간단히 alert 사용)
        const displayMessage = error.message || '요청 처리 중 알 수 없는 오류가 발생했습니다.';
        alert(`[에러 발생] ${displayMessage}`);

        // 호출한 곳에서 추가 처리할 수 있도록 에러를 다시 던집니다.
        throw error;
    }
}

/**
 * 최종적으로 외부에 노출할 API 유틸 객체
 */
export const apiUtil = {
    get: (endpoint) => request(endpoint, 'GET'),
    post: (endpoint, data) => request(endpoint, 'POST', data),
    put: (endpoint, data) => request(endpoint, 'PUT', data),
    patch: (endpoint, data) => request(endpoint, 'PATCH', data),
    delete: (endpoint) => request(endpoint, 'DELETE'),
};

// <script type="module" src="apiUtil.js"></script>로 로드할 경우,
// window.apiUtil = apiUtil; 을 추가하여 전역 객체로 사용할 수도 있습니다.