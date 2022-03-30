test_that("blues are blue", {
    should_be <-

    expect_equal(higher_ex_cols("Navy", "Bright Blue", "Medium Blue"),
                 c("#0C223F", "#00B2E2", "#0081C9"))
})
