package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizAnswer
import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import com.woowacourse.wordcapsule.domain.quiz.QuizRecordFactory
import com.woowacourse.wordcapsule.domain.quiz.QuizRecordSpecs
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizAnswerRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordStatisticResponse
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizOptionRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizRecordRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizRepository
import jakarta.persistence.EntityNotFoundException
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.domain.Specification
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.time.Duration
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.EnumMap
import kotlin.math.abs

@Service
@Transactional
class QuizRecordService(
    private val quizRecordRepository: QuizRecordRepository,
    private val quizConfigRepository: QuizConfigRepository,
    private val quizOptionRepository: QuizOptionRepository,
    private val quizRepository: QuizRepository
): QuizRecordServiceInterface {

    /**
     * 퀴즈 기록 생성
     */
    @Transactional
    override fun createQuizRecord(request: QuizRecordRequest): Long {
        // TODO : 유저 연관관계 매핑
//        val user = userRepository...
        val configId = request.configId
        val quizConfig = quizConfigRepository.findById(configId)
            .orElseThrow { EntityNotFoundException("퀴즈 설정을 찾을 수 없습니다. ID: $configId") }

        val quizRecord = QuizRecordFactory.createQuizRecord(request, quizConfig)

        val savedQuizRecord = quizRecordRepository.save(quizRecord)

        val answers = request.answers.mapIndexed { index, answerDto -> buildQuizAnswer(index, answerDto, savedQuizRecord) }

        answers.forEach { answer -> savedQuizRecord.addAnswer(answer) }

        return savedQuizRecord.id
    }

    /**
     * 퀴즈 기록 목록 조회
     */
    override fun getUserQuizRecordList(
        userId: Long?,
        // score에 따른 검색, 다 맞은거 or 오답이 있는 것
        pageable: Pageable
    ): PageResponse<QuizRecordListResponse> {

        val spec = Specification.allOf(
            listOfNotNull(
                userId?.let { QuizRecordSpecs.userIdEq(it) }
            )
        )

        val page = quizRecordRepository.findAll(spec, pageable)
            .map(QuizRecordListResponse::from)

        return PageResponse.of(page)
    }

    /**
     * 퀴즈 기록 상세 조회
     */
    override fun getUserQuizRecordDetail(recordId: Long): QuizRecordDetailResponse {
        val quizRecord = quizRecordRepository.findById(recordId)
            .orElseThrow { EntityNotFoundException("퀴즈 기록을 찾을 수 없습니다. ID: $recordId") }

        return QuizRecordDetailResponse.from(quizRecord)
    }

    /**
     * 퀴즈 기록 내부에 답변 정보를 매핑
     */
    fun buildQuizAnswer(index: Int, request: QuizAnswerRequest, savedQuizRecord: QuizRecord): QuizAnswer {
        return QuizAnswer(
            record = savedQuizRecord,

            quiz = quizRepository.findById(request.quizId)
                .orElseThrow { EntityNotFoundException("퀴즈를 찾을 수 없습니다. ID: ${request.quizId}") },

            option = quizOptionRepository.findById(request.optionId)
                .orElseThrow { EntityNotFoundException("선택지를 찾을 수 없습니다. ID: ${request.optionId}") },

            questionNumber = index,

            isCorrect = request.isCorrect
        )
    }

    /**
     * 퀴즈 기록 통계
     */
    override fun getUserQuizRecordStatistic(userId: Long?): QuizRecordStatisticResponse {
        val spec = Specification.allOf(
            listOfNotNull(
                userId?.let { QuizRecordSpecs.userIdEq(it) }
            )
        )

        val quizRecordList = quizRecordRepository.findAll(spec)

        return QuizRecordStatisticResponse.from(quizRecordList)
    }

    /**
     * 퀴즈기록 삭제
     */
    override fun deleteQuizRecord(recordId: Long) {
        val quizRecord = quizRecordRepository.findById(recordId)
            .orElseThrow { EntityNotFoundException("퀴즈 기록을 찾을 수 없습니다. ID: $recordId") }

        quizRecordRepository.delete(quizRecord)
    }

    companion object {
        /** 연속 일 초기값 */
        const val INIT_STREAK_DAY = 1

        /** 날짜 비교 */
        fun getDayGap(today: LocalDateTime, tomorrow: LocalDateTime): Long {
            return abs(ChronoUnit.DAYS.between(today, tomorrow))
        }

        /** 연속일 구하기 */
        fun getStreakDay(dateList: List<LocalDateTime>): Int {
            var peakDay = INIT_STREAK_DAY;
            for (i in 0..<dateList.size - 1) {
                val isTomorrow = getDayGap(dateList[i], dateList[i + 1])

                when {
                    isTomorrow == 0L -> peakDay
                    isTomorrow == 1L -> peakDay++
                    isTomorrow > 1L -> peakDay = INIT_STREAK_DAY
                }
            }
            return peakDay
        }
    }
}