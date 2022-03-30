# Copyright (C) 2022 by Higher Expectations for Racine County

.main_palette_colors <- c("#FDB913",
                          "#58585B",
                          "#0C223F",
                          "#00B2E2",
                          "#0081C9")

test_that("the default color palette is created", {
    .palette_fun <- higher_ex_pal()
    expect_equal(.palette_fun(5),
                 .main_palette_colors)

})

test_that("a reverse color palette is created", {
    .palette_fun <- higher_ex_pal(reverse = TRUE)
    expect_equal(.palette_fun(5),
                 rev(.main_palette_colors))

})

test_that("named color palettes are created", {
    .blue_palette <- higher_ex_pal("blues")
    expect_equal(.blue_palette(3),
                 c("#00B2E2", "#0081C9", "#0C223F"))
    .logo_palette <- higher_ex_pal("logo")
    expect_equal(.logo_palette(3),
                 c("#58585B", "#FDB913", "#FFFFFF"))
})

test_that("color truncation makes nice scales", {
    .blues <- higher_ex_pal("blues", n.colors = 2)(3)
    .rgbs <- col2rgb(.blues)
    expect_equal(floor(apply(.rgbs[, -2], 1, mean)),
                 .rgbs[, 2])
})
