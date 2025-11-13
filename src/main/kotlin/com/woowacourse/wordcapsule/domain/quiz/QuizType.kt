package com.woowacourse.wordcapsule.domain.quiz

/**
 * 퀴즈 유형을 나타내는 열거형
 */
enum class QuizType {
    /** 단어 뜻 맞추기 */
    WORD_MEANING,

    /** 일치하는 단어 맞추기 */
    WORD_MATCHING,

    /** 문장에 빈칸 채우기 */
    FILL_BLANK,

    /** 단어 조합하여 문장 만들기 */
    SENTENCE_ORDER
}