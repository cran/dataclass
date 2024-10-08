% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validator.R
\name{df_like}
\alias{df_like}
\title{Validator: Check if element is a data like object}
\usage{
df_like(max_row = Inf, min_row = 1, level = "error")
}
\arguments{
\item{max_row}{The maximum row count of a data element}

\item{min_row}{The minimum row count of a data element}

\item{level}{Setting "warn" throws a warning, setting "error" halts}
}
\value{
A function with the following properties:
\itemize{
\item Checks whether something is a data frame like object
\item Determines whether the check will throw warning or error
\item Optionally checks for row count
}
}
\description{
This function is used to check whether something is data like. You can use
this function to check the data row count. You can also specify the level of
a violation. If level is set to "warn" then invalid inputs will warn you.
However, if level is set to "error" then invalid inputs will abort.
}
\examples{
# Define a dataclass for testing data:
my_dataclass <-
  dataclass(
    df = df_like(100)
  )

# `df` must be a data like object with at most 100 rows!
my_dataclass(
  df = mtcars
)
}
