test_that("by default, changing case counts as an edit", {
  A <- c("Foo", "Bar", "Baz")
  B <- c("aleph", "bab", "jeen", "dal")
  expect_equal(fuzzy_matches(A, B),
               tibble::tibble(
                   LHS = rep(A, each = 4),
                   RHS = rep(B, 3),
                   Distance = c(5, 3, 4, 3,
                                5, 2, 4, 2,
                                5, 2, 4, 2)
               ))
  expect_equal(fuzzy_matches(A, B, ignore.case = TRUE),
               tibble::tibble(
                   LHS = rep(A, each = 4),
                   RHS = rep(B, 3),
                   Distance = c(5, 3, 4, 3,
                                5, 1, 4, 2,
                                5, 1, 4, 2)
               ))
})
