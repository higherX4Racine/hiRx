.input <- tibble::tribble(
    ~ series,
    "LAUST290000000000009",
    "LAUCS233569500000005",
    "LAUMT542658000000003",
    "LAUCN170630000000005",
    "LAUCA392120000000004",
    "LAUCN210230000000003",
    "LAUCN190410000000006",
    "LAUCT134319200000005",
    "LAUMC554802000000004",
    "LAURD840000000000006"
)

.output <- tibble::tribble(
    ~ seasonal, ~ area_prefix, ~ srd_code, ~ area_fips, ~ measure_code
    "U", "ST", 29, "00000000000", 9,
    "U", "CS", 23, "35695000000", 5,
    "U", "MT", 54, "26580000000", 3,
    "U", "CN", 17, "06300000000", 5,
    "U", "CA", 39, "21200000000", 4,
    "U", "CN", 21, "02300000000", 3,
    "U", "CN", 19, "04100000000", 6,
    "U", "CT", 13, "43192000000", 5,
    "U", "MC", 55, "48020000000", 4,
    "U", "RD", 84, "00000000000", 6
)

test_that("parsing a data frame works", {
    expect_equal(laus_parse_series(.input), .output)
})

test_that("parsing a character vector works", {
    expect_equal(laus_parse_series(.input$series), .output)
})

test_that("illegal inputs throw an error.", {
    expect_error(laus_parse_series(42))
})
