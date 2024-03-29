% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bls_utils.R
\name{get_prefix}
\alias{get_prefix}
\title{Strip out the first several characters from a column}
\usage{
get_prefix(.x, .col, .len)
}
\arguments{
\item{.x}{the input data frame}

\item{.col}{the character column to extract the prefix from}

\item{.len}{the length of the prefix}
}
\value{
a new data frame with a column, ``prefix`` inserted before ``.col``
}
\description{
Strip out the first several characters from a column
}
\examples{
get_prefix(
    tibble::tribble(~Text, "hello", "world"),
    Text,
    3
)
}
