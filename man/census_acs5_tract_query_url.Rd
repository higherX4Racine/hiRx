% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/census_api_url.R
\name{census_acs5_tract_query_url}
\alias{census_acs5_tract_query_url}
\title{Create an API query URL for tract-level data from a 5-Year ACS}
\usage{
census_acs5_tract_query_url(..., for_items = NULL, state = 55, county = 101)
}
\arguments{
\item{...}{<[`dynamic dots`][rlang::dyn-dots]> named arguments to pass to \code{\link[hiRx]{census_api_url}}}

\item{for_items}{the tracts to fetch data for. Defaults to eastern Racine County}

\item{state}{the state to fetch data for. Defaults to Wisconsin}

\item{county}{the county to fetch data for. Defaults to Racine}
}
\value{
one URL for an API call
}
\description{
Create an API query URL for tract-level data from a 5-Year ACS
}
\examples{
census_acs5_tract_query_url(year = 2020,
                            variables = paste0("B25003_00", 1:3, "E"))
}
