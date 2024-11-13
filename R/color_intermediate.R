color_intermediate <- function(a, b) {
    .c <- methods::as(
        colorspace::hex2RGB(c(a,
                              b)),
        "polarLUV"
    )
    .p_chroma <- mean(
        .c@coords[, 2] /
            colorspace::max_chroma(h = .c@coords[, 3],
                                   l = .c@coords[, 1])
    )
    .d <- apply(.c@coords, 2, mean)
    .d[2] <- .p_chroma * colorspace::max_chroma(.d[3], .d[1])
    colorspace::hex(
        colorspace::polarLUV(
            matrix(.d, ncol = 3)
        )
    )
}
