# Load and preprocess raw data

library(tidyverse)

#' Load raw data
#'
#' Reads raw data from the data/raw directory and performs initial cleaning
load_raw_data <- function() {
  # Read raw data from CSV
  data <- read_csv("data/raw/data.csv")

  # Perform cleaning and transformation
  processed_data <- data %>%
    filter(!is.na(value)) %>%
    mutate(
      group = as.factor(group),
      measurement_date = as.Date(measurement_date)
    )

  # Save processed data
  write_csv(processed_data, "data/processed/data.csv")

  message("Data loaded and processed. Rows: ", nrow(processed_data))

  # Return the processed data
  processed_data
}
