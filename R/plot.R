# Create figures for publication using raw and processed data

library(tidyverse)
library(ggplot2)

#' Create exploratory plots
#'
#' Generates publication-quality figures from processed data
create_plots <- function(data) {
  # Boxplot comparing groups
  p1 <- data %>%
    ggplot(aes(x = group, y = value, fill = group)) +
    geom_boxplot(alpha = 0.7) +
    geom_jitter(width = 0.2, alpha = 0.5) +
    theme_minimal() +
    theme(legend.position = "none") +
    labs(
      title = "Value Comparison Between Groups",
      x = "Group",
      y = "Measured Value"
    )

  # Time series plot
  p2 <- data %>%
    group_by(measurement_date, group) %>%
    summarise(mean_value = mean(value), .groups = "drop") %>%
    ggplot(aes(x = measurement_date, y = mean_value, color = group)) +
    geom_line(linewidth = 1) +
    geom_point(size = 2) +
    theme_minimal() +
    labs(
      title = "Mean Values Over Time",
      x = "Date",
      y = "Mean Value",
      color = "Group"
    )

  ggsave("figures/boxplot.pdf", p1, width = 6, height = 4)
  ggsave("figures/timeseries.pdf", p2, width = 7, height = 4)

  message("Figures saved: figures/boxplot.pdf, figures/timeseries.pdf")

  invisible(NULL)
}

# Load processed data and create plots
data <- read_csv("data/processed/data.csv")
create_plots(data)
