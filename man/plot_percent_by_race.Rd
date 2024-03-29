% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_percent_by_race.R
\name{plot_percent_by_race}
\alias{plot_percent_by_race}
\title{Horizontal bar plots colored by race/ethnicity showing percentages}
\usage{
plot_percent_by_race(
  .x,
  response,
  label,
  .race_ethnicity = "Race/Ethnicity",
  .text_size = 4
)
}
\arguments{
\item{.x}{the data, including a "Race/Ethnicity" variable}

\item{response}{the percentage-valued response variable}

\item{label}{a horizontal axis label for the plot}

\item{.race_ethnicity, }{optional, defaults to "Race/Ethnicity"}

\item{.text_size, }{optional, defaults to 4}
}
\value{
a graphical object to chain with other ggplot2 items.
}
\description{
Horizontal bar plots colored by race/ethnicity showing percentages
}
