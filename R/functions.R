# Custom helper functions for the project

#' Summarize data
#'
#' Creates summary statistics for a dataset
#'
#' @param data A data frame
#' @return A summary data frame
summarize_data <- function(data) {
  data %>%
    summarise(
      n = n(),
      mean = mean(value, na.rm = TRUE),
      sd = sd(value, na.rm = TRUE),
      min = min(value, na.rm = TRUE),
      max = max(value, na.rm = TRUE)
    )
}
