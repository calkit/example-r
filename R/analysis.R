# Main statistical analysis

library(tidyverse)

# Source the data loading script
source("R/load_data.R")

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

# Execute the analysis
data <- load_raw_data()
run_analysis(data)
