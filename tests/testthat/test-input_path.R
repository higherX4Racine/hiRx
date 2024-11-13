test_that("an empty input path is the system DATA_PATH", {
    expect_equal(
        hiRx::input_path(),
        Sys.getenv("DATA_PATH")
    )
})

test_that("input path component concatenation succeeds", {
    expect_equal(
        hiRx::input_path("Hello"),
        file.path(Sys.getenv("DATA_PATH"),
                  "Hello")
    )
    expect_equal(
        hiRx::input_path("Hello", "World"),
        file.path(Sys.getenv("DATA_PATH"),
                  "Hello",
                  "World")
    )
})
