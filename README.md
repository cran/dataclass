## dataclass

### Easily Create Structured Lists or Data Frames with Input Validation

Easily define templated lists with an associated validator function
for each element in the list. For example, if you wanted to create a list
with a min date, max date, and a dataframe, you could use dataclass to
validate that each of the elements are present and correct. This package
comes bundled with common validators, however, you can easily define your
own with an anonymous function. This could be considered a very-minimal
variant of the S7 standard aimed at standardizing structured data generation
within an R process.

```r
# Create a dataclass
my_dataclass <- dataclass(
  min_date = dte_vec(1), # Ensures min_date is a date vector of length 1
  max_date = dte_vec(1), # Ensures max_date is a date vector of length 1
  run_data = df_like(),  # Ensures run_date is a data object (i.e. tibble)
  run_note = chr_vec(1)  # Ensures run_note is a character vector of length 1
)

# This returns a validated list!
my_dataclass(
  min_date = as.Date("2022-01-01"),
  max_date = as.Date("2023-01-01"),
  run_data = head(mtcars),
  run_note = "A note!"
)

# This throws an error since run_data is not a data frame
my_dataclass(
  min_date = as.Date("2022-01-01"),
  max_date = as.Date("2023-01-01"),
  run_data = c(1, 2, 3),
  run_note = "A note!"
)

# Create a dataclass with anonymous functions
dataclass(
  start_date = dte_vec(1),
  # Ensures calculation is a column in this data and is data like
  results_df = function(x) "calculation" %in% names(x) && df_like(x)
)

# Define a dataclass for creating a tibble! Simply omit length restrictions:
my_df_dataclass <-
 dataclass(
   dte_col = dte_vec(),
   chr_col = chr_vec(),
   # Custom column validator which ensures column is numeric and postitive!
   new_col = function(x) num_vec(x) && all(x > 0)
 ) %>%
 # You MUST convert to a data validator for use with data frames
 data_validator()

# Validate a tibble!
tibble(
 dte_col = as.Date("2022-01-01"),
 chr_col = "String!",
 new_col = 100
) %>%
 my_df_dataclass()
```
