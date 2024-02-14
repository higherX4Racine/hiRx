test_that("default works", {
  expect_equal(academic_year_from_month(1:12, 2024),
               c(rep(2024, 7), rep(2023, 5)))
})

test_that("changing the month works", {
    expect_equal(academic_year_from_month(1:12, 2024, 7),
                 c(rep(2024, 6), rep(2023, 6)))
})

test_that("changin the year works", {
    expect_equal(academic_year_from_month(1:12, 2000),
                 c(rep(2000, 7), rep(1999, 5)))
})
