# R Example Research Project

An example R project managed with Calkit that demonstrates reproducible data analysis and figure generation.

## Project Structure

```
.
├── data/
│   ├── raw/              # Original, untouched data (input)
│   ├── processed/        # Cleaned/transformed data (output from analyze stage)
│   └── README.md         # Data dictionary
├── R/
│   ├── analyze.R         # Data processing and statistical analysis
│   └── plot.R            # Create publication figures
├── figures/              # Generated plots and visualizations
├── output/               # Analysis results and summaries
├── calkit.yaml           # Calkit pipeline configuration
├── DESCRIPTION           # Project metadata and R dependencies
├── renv/                 # R environment configuration and packages
├── references.bib        # Citation database
└── README.md             # This file
```

## Workflow

The entire project is reproduced with a single command:

```bash
calkit run
```

This executes the pipeline defined in `calkit.yaml`:

1. **Analyze stage** (`R/analyze.R`):
   - Reads raw data from `data/raw/data.csv`
   - Performs statistical analysis
   - Outputs processed data to `data/processed/data.csv`
   - Saves analysis results to `output/analysis_results.rds`

2. **Plot stage** (`R/plot.R`):
   - Uses processed data from `data/processed/data.csv`
   - Generates publication-ready figures
   - Outputs plots to `figures/`

## Key Features

- **Calkit pipeline**: Declarative workflow defined in `calkit.yaml` ensures reproducible execution
- **DESCRIPTION file**: Declares R package dependencies
- **renv**: Locks package versions for complete reproducibility
- **Modular R scripts**: Each analysis step is a separate, focused R script
- **Dependency tracking**: Pipeline automatically runs stages in correct order with proper inputs/outputs

## Getting Started

1. Run the entire pipeline: `calkit run`
2. Modify R scripts in `R/` as needed for your analysis
3. Run again: `calkit run` (only affected stages will re-execute)

## Requirements

- R (>= 4.0)
- Calkit CLI
- Dependencies listed in DESCRIPTION (managed by renv)
