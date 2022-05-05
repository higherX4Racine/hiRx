# Copyright (C) 2022 by Higher Expectations for Racine County

.input <- tibble::tribble(
    ~ srd_code, ~ measure_code,
    "42",       "2",
    "-1",       "03"
)

test_that("char-to-integer code conversion works", {

    .output <- convert_code_columns(.input)

    expect_equal(.output$srd_code, c(42, -1))

    expect_equal(.output$measure_code, c(2, 3))
})
