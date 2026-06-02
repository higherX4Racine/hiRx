## Copyright (C) 2026 by Higher Expectations for Racine County

test_that("a nice comparison table comes from multiple inputs", {
    foo = tibble::tibble(
        Hey = c("Jude", "John", "Jasper"),
        There = c(3, 1, 4)
    )
    bar = tibble::tibble(Hey = "Horses", Whey = 42L)
    baz = tibble::tibble(Hey = 99, There = "seventy-one", Whey = 0)

  testthat::expect_equal(
      compare_table_column_types(Foo = foo, Bar = bar, Baz = baz),
      tibble::tribble(
          ~ Column, ~ `Foo Type`, ~ `Bar Type`, ~ `Baz Type`,
          "Hey",    "character",  "character",  "numeric",
          "There",  "numeric",    NA,           "character",
          "Whey",   NA,           "integer",    "numeric"
      )
  )
})
