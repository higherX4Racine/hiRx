test_that("one argument prints successfully", {
    expect_snapshot(
        output_levels(c("foo",
                        "bar",
                        "baz"))
    )
})

test_that("multiple arguments print successfully", {
    expect_snapshot(
        output_levels("foo",
                      "bar",
                      "baz")
    )
})

test_that("arguments of different lengths print successfully", {
    expect_snapshot(
        output_levels("foo",
                      c("bar", "baz"),
                      "barf")
    )
})
