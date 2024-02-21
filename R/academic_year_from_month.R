#' Compute the year in an academic year from a month
#'
#' @param months <int> the months to find the years for
#' @param ending_year <int> the calendar year when the academic year ends.
#' @param starting_month <int, optional> the first month of the academic year
#' defaults to August.
#'
#' @return <int> a vector of years suitable for use in e.g. [lubridate::make_date()]
#' @export
#'
#' @examples
#' academic_year_from_month(1:12, 2024, 9)
academic_year_from_month <- function(months, ending_year, starting_month = 8L){
    ending_year + (months - starting_month + 1) %/% -12
}
