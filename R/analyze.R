# Load raw data, process it, and perform analysis

library(tidyverse)

#' Load and preprocess raw data
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

#' Run main analysis
#'
#' Performs statistical tests and modeling on processed data
run_analysis <- function(data) {
  # T-test comparing groups
  t_test_result <- t.test(value ~ group, data = data)

  # Linear regression model
  lm_result <- lm(value ~ group, data = data)

  # Summary statistics by group
  summary_stats <- data %>%
    group_by(group) %>%
    summarise(
      n = n(),
      mean = mean(value),
      sd = sd(value),
      min = min(value),
      max = max(value),
      .groups = "drop"
    )

  # Save results to output/
  results <- list(
    t_test = t_test_result,
    lm = lm_result,
    summary = summary_stats
  )

  saveRDS(results, "output/analysis_results.rds")

  message("\nT-test p-value: ", round(t_test_result$p.value, 4))
  message("\nSummary statistics by group:")
  print(summary_stats)

  results
}

# Execute the pipeline
data <- load_raw_data()
run_analysis(data)
