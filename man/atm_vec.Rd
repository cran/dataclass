% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validator.R
\name{atm_vec}
\alias{atm_vec}
\title{Validator: Check if element is atomic}
\usage{
atm_vec(
  max_len = Inf,
  min_len = 1,
  level = "error",
  allow_na = FALSE,
  allow_dups = TRUE
)
}
\arguments{
\item{max_len}{The maximum length of an atomic element}

\item{min_len}{The minimum length of an atomic element}

\item{level}{Setting "warn" throws a warning, setting "error" halts}

\item{allow_na}{Should NA values be allowed?}

\item{allow_dups}{Should duplicates be allowed?}
}
\value{
A function with the following properties:
\itemize{
\item Checks whether something is atomic
\item Determines whether the check will throw warning or error
\item Optionally checks for element length
}
}
\description{
This function is used to check whether something is atomic. Atomic elements
are represented by simple vectors, (i.e., numeric, logical, character) but
also include special vectors like date vectors. You can use this function
to check the length of a vector. You can also specify the level of a
violation. If level is set to "warn" then invalid inputs will warn you.
However, if level is set to "error" then invalid inputs will abort.
}
\examples{
# Define a dataclass for testing atomic:
my_dataclass <-
  dataclass(
    num_val = num_vec(),
    # Setting warn means a warning will occur if violation is found
    # The default is "error" which is stricter and will halt upon violation
    atm_val = atm_vec(level = "warn")
  )

# While `num_val` must be a number, `atm_val` can be any atomic element!
my_dataclass(
  num_val = c(1, 2, 3),
  atm_val = Sys.Date()
)

my_dataclass(
  num_val = c(1, 2, 3),
  atm_val = c(TRUE, FALSE)
)

my_dataclass(
  num_val = c(1, 2, 3),
  atm_val = c("This is", "a character!")
)
}
