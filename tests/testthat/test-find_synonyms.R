discrete_example <- tibble::tribble(
    ~ PrimaryKey, ~ Dimension, ~ Order, ~ Label, ~ Synonym,
    1L, 1L, 1L, "A", NA,
    2L, 1L, 2L, "B", NA,
    3L, 1L, 3L, "C", NA,
    4L, 1L, NA, "Alpha", 1L,
    5L, 1L, NA, "Beta", 2L,
    6L, 1L, NA, "Gamma", 3L,
    7L, 1L, NA, "\u03B1", 4L,
    8L, 1L, NA, "\u03B2", 5L,
    9L, 1L, NA, "\u03B3", 6L
)

test_that("a lack of synonyms is no problem", {
    expect_equal(find_synonyms(discrete_example[1:3,]),
                 1L:3L)
})

test_that("one level of indirection is no problem", {
    expect_equal(find_synonyms(discrete_example[1:6,]),
                 rep(1L:3L, 2))
})

test_that("two level of indirection is no problem", {
    expect_equal(find_synonyms(discrete_example),
                 rep(1L:3L, 3))
})
