package com.woowacourse.wordcapsule.util

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import org.springframework.ui.ExtendedModelMap
import org.springframework.ui.Model
import java.util.stream.Stream

class ModelExtensionTest {

    data class TestDto(
        val id: Long,
        val name: String,
        val detail: TestDetailDto,
        val list: List<TestListDto>,
        val isNull: Any?
    )

    data class TestDetailDto(
        val id: Long,
    )

    data class TestListDto(
        val id: Long
    )

    private fun setUpDto(): TestDto {
        return TestDto(
            id = 1L,
            name = "test",
            detail = TestDetailDto(1L),
            list = listOf(
                TestListDto(1L),
                TestListDto(2L),
                TestListDto(3L),
            ),
            isNull = null,
        )
    }

    private fun newModel(): Model = ExtendedModelMap()

    companion object {

        @JvmStatic
        fun addFromMethods(): Stream<Arguments> {
            return Stream.of(
                Arguments.of(
                    "addFromTest",
                    { model: Model, dto: TestDto ->
                        model.addFromTest(dto)
                    }
                ),
                Arguments.of(
                    "addFromTest2",
                    { model: Model, dto: TestDto ->
                        model.addFromTest2(dto)
                    }
                ),
                Arguments.of(
                    "addFromTest3",
                    { model: Model, dto: TestDto ->
                        model.addFromTest3(dto)
                    }
                ),
                Arguments.of(
                    "addFromTest4",
                    { model: Model, dto: TestDto ->
                        model.addAllAttributesFrom(dto)
                    }
                ),
            )
        }
    }

    @ParameterizedTest(name = "{0} - 프로퍼티명과 값 매핑 테스트")
    @MethodSource("addFromMethods")
    @DisplayName("DTO 프로퍼티명과 값이 Model에 동일하게 매핑된다")
    fun testNameAndValue(
        methodName: String,
        mapper: (Model, TestDto) -> Unit
    ) {
        // given
        val dto = setUpDto()
        val model = newModel()

        // when
        mapper(model, dto)

        // then
        val asMap = model.asMap()

        // 기본 타입
        assertThat(asMap["id"])
            .`as`("$methodName - id 프로퍼티 매핑")
            .isEqualTo(1L)
        assertThat(asMap["name"])
            .`as`("$methodName - name 프로퍼티 매핑")
            .isEqualTo("test")

        // detail
        assertThat(asMap["detail"])
            .`as`("$methodName - detail 프로퍼티 타입")
            .isInstanceOf(TestDetailDto::class.java)
        val detail = asMap["detail"] as TestDetailDto
        assertThat(detail.id)
            .`as`("$methodName - detail.id 값")
            .isEqualTo(1L)

        // list
        assertThat(asMap["list"])
            .`as`("$methodName - list 프로퍼티 타입")
            .isInstanceOf(List::class.java)
        val list = asMap["list"] as List<*>
        assertThat(list).hasSize(3)
        val first = list[0] as TestListDto
        val second = list[1] as TestListDto
        val third = list[2] as TestListDto
        assertThat(first.id).isEqualTo(1L)
        assertThat(second.id).isEqualTo(2L)
        assertThat(third.id).isEqualTo(3L)

        // null check
        assertThat(asMap["isNull"]).isNull()
    }
}
