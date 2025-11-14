package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordStatisticResponse
import org.springframework.data.domain.Pageable

interface QuizRecordServiceInterface {
    fun createQuizRecord(request: QuizRecordRequest): Long

    fun getUserQuizRecordList(userId: Long?, pageable: Pageable): PageResponse<QuizRecordListResponse>

    fun getUserQuizRecordDetail(recordId: Long): QuizRecordDetailResponse

    fun getUserQuizRecordStatistic(userId: Long?): QuizRecordStatisticResponse
}