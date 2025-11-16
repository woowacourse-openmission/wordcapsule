package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigUpdateRequest
import com.woowacourse.wordcapsule.dto.quiz.RandomQuizResponse
import org.springframework.data.domain.Pageable

/**
 * 퀴즈 설정 관리를 위한 서비스 인터페이스
 * 의존성 역전 원칙을 위해 추상화된 인터페이스 제공
 */
interface QuizConfigServiceInterface {

    /**
     * 퀴즈 설정을 생성하고 저장
     *
     * @param request 퀴즈 설정 생성 요청 DTO
     * @return 생성된 퀴즈 설정의 식별자
     */
    fun createQuizConfig(request: QuizConfigRequest): Long

    /**
     * 퀴즈 설정 목록을 페이징하여 조회
     *
     * @param level 레벨 필터 (선택사항)
     * @param quizType 퀴즈 타입 필터 (선택사항)
     * @param pageable 페이징 정보
     * @return 페이징된 퀴즈 설정 목록
     */
    fun getQuizConfigs(level: Level?, quizType: QuizType?, pageable: Pageable): PageResponse<QuizConfigListResponse>
    
    /**
     * ID로 퀴즈 설정 상세 정보 조회
     *
     * @param configId 퀴즈 설정 ID
     * @return 퀴즈 설정 상세 정보 (퀴즈 문제 및 선택지 포함)
     * @throws EntityNotFoundException 퀴즈 설정을 찾을 수 없는 경우
     */
    fun getQuizConfigDetail(configId: Long): QuizConfigDetailResponse
    
    /**
     * 퀴즈 설정 정보를 부분적으로 수정
     *
     * @param configId 수정할 퀴즈 설정 ID
     * @param request 수정할 필드들을 포함한 요청 DTO
     * @return 수정된 퀴즈 설정의 식별자
     * @throws EntityNotFoundException 퀴즈 설정을 찾을 수 없는 경우
     */
    fun updateQuizConfig(configId: Long, request: QuizConfigUpdateRequest): Long
    
    /**
     * 퀴즈 설정을 삭제
     *
     * @param configId 삭제할 퀴즈 설정 ID
     * @throws EntityNotFoundException 퀴즈 설정을 찾을 수 없는 경우
     */
    fun deleteQuizConfig(configId: Long)

    /**
     * 사용자에게 랜덤 퀴즈를 추천
     *
     * @param userId 사용자 ID
     * @return 랜덤 퀴즈 추천 결과 (추천 성공/레벨 완료/사용자 없음)
     */
    fun getRandomQuizRecommendation(userId: Long): RandomQuizResponse
}