#' Compute week numbers of dates for making calendars
#'
#' @param .days `<int|Date>` days of the month or dates
#' @param .wdays `<int?>` weekdays (Sunday == 1), required when `.days` is an integer
#'
#' @returns `<int>` row numbers (starting at 1) for plotting a calendar
#' @export
#'
#' @examples
#' week_of_month(lubridate::ymd(c("2026-01-01", "2026-02-01", "2026-03-01")))
week_of_month <- function(.days, .wdays = NULL) {
    if (lubridate::is.Date(.days)) {
        if (is.null(.wdays)) {
            .wdays <- lubridate::wday(.days)
        }
        .days <- lubridate::day(.days)
    } else if (is.null(.wdays)) {
        rlang::abort("either pass a date for `.days` or include `.wdays`")
    }
    as.integer((.days - 1L + (.wdays - .days) %% 7L) %/% 7L + 1L)
}
