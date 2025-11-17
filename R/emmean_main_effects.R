# Copyright (C) 2025 by Higher Expectations for Racine County

#' Create a table of estimates for specific levels of a main effect
#'
#' This function is a wrapper for using [emmeans::emmeans()] to examine just
#' the levels of one main effect from a more complicated model.
#' It relabels some of the columns for easier use in visualizations.
#'
#' @param .obj `<obj>` a model or [emmeans::emmGrid] object to analyze
#' @param .field `<chr>` the name of the main effect to analyze
#'
#' @returns `<tbl>` a data frame with
#' as many rows as there are levels of `.field`
#' and eight columns
#' \describe{
#'   \item{`.field`}{`<chr>` the levels of the main effect}
#'   \item{emmean}{`<dbl>` the marginal mean for that level of the effect}
#'   \item{SE}{`<dbl>` the standard error of the marginal mean}
#'   \item{df}{`<int>` the estimated degrees of freedom for the t test}
#'   \item{lower.CL}{`<dbl>` the lower bound of the 95\% confidence interval}
#'   \item{upper.CL}{`<dbl>` the upper bound of the 95\% confidence interval}
#'   \item{`$t_\{df\}$`}{`<dbl>` the t statistic for this estimate, with df in the name.}
#'   \item{`$p$-value`}{`<dbl>` the p-value of the t test for this effect}
#' }
#' @export
#' @seealso [emmeans::emmeans()]
emmean_main_effects <- function(.obj, .field) {
    .margins <- .obj |>
        emmeans::emmeans(
            .field,
            infer = c(TRUE, TRUE)
        ) |>
        summary()
    .df_column <- paste0("$t_{", .margins$df[1], "}$")
    .margins |>
        dplyr::mutate(
            `95% Conf. Width` = .data$upper.CL - .data$emmean
        ) |>
        dplyr::rename(
            "{.df_column}" := "t.ratio",
            `$p$-value` = "p.value"
        )
}

# #' \describe{
# #'   \item{`.field`}{`<chr>` the levels of the main effect}
# #'   \item{emmean}{`<dbl>` the marginal mean for that level of the effect}
# #'   \item{SE}{`<dbl>` the standard error of the marginal mean}
# #'   \item{df}{`<int>` the estimated degrees of freedom for the t test}
# #'   \item{lower.CL}{`<dbl>` the lower bound of the 95% confidence interval}
# #'   \item{upper.CL}{`<dbl>` the upper bound of the 95% confidence interval}
# #'   \item{t_xxxx}{`<dbl>` the t statistic for this estimate, with df in the name.}
# #'   \item{*p*-value}{`<dbl>` the p-value of the t test for this effect}
# #' }
