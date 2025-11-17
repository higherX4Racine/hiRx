test_that("snakes turn into camels", {
    expect_equal(to_camel_case("death_adder"),
                 "DeathAdder")
    expect_equal(to_camel_case("timber_rattler"),
                 "TimberRattler")
})

test_that("kebabs turn into camels", {
    expect_equal(to_camel_case("kebab-case-does-work"),
                 "KebabCaseDoesWork")
})

test_that("things without underscores become camels", {
    expect_equal(to_camel_case("capital work, there, crew!"),
                 "CapitalWorkThereCrew")
})
