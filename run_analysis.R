# Run analysis pipeline outside of Quarto
# This ensures all dependencies are available

library(tidyverse)
library(ggplot2)

# Source analysis scripts
source("R/load_data.R")
source("R/analysis.R")
source("R/figures.R")

# Run the pipeline
data <- load_raw_data()
results <- run_analysis(data)
create_plots(data)

cat("\n✓ Analysis complete. Figures saved to figures/\n")
cat("✓ Results saved to output/\n")
