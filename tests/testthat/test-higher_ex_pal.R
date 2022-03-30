# Copyright (C) 2022 by Higher Expectations for Racine County

test_that("the default color palette is created", {
    .palette_fun <- higher_ex_pal()
    expect_equal(.palette_fun(5),
                 c("#FDB913",
                   "#58585B",
                   "#0C223F",
                   "#00B2E2",
                   "#0081C9")
    )

})
