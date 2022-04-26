test_that("Racine City's Code is Correct", {
    expect_equal(bls_geography("CT",
                               55,
                               66000),
                 "CT5566000000000")
})

test_that("Racine County's Code is Correct", {
    expect_equal(bls_geography("CN",
                               55,
                               101),
                 "CT5510100000000")
})

test_that("Wisconsin's State Code is Correct", {
    expect_equal(bls_geography("ST",
                               55,
                               NULL),
                 "ST5500000000000")
})
