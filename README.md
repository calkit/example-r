# R Example Research Project

An example R project structure for producing a scientific paper with data analysis and figures.

## Project Structure

```
.
├── data/
│   ├── raw/              # Original, untouched data
│   ├── processed/        # Cleaned/transformed data
│   └── README.md         # Data dictionary
├── R/
│   ├── functions.R       # Custom helper functions
│   ├── load_data.R       # Load and preprocess data
│   ├── analysis.R        # Statistical analysis
│   └── figures.R         # Create publication figures
├── figures/              # Generated plots and visualizations
├── output/               # Tables and summary statistics
├── paper.qmd             # Main manuscript (Quarto document)
├── references.bib        # Citation database
├── _quarto.yml           # Quarto configuration
├── DESCRIPTION           # Project metadata and dependencies
├── renv.lock             # Reproducible R environment
└── .Rprofile             # Project startup settings
```

## Workflow

1. **Load data**: Run scripts in `R/load_data.R` to read and preprocess raw data
2. **Analyze**: Use `R/analysis.R` for statistical tests and models
3. **Visualize**: Create figures with `R/figures.R`
4. **Write**: Embed code and results in `paper.qmd`
5. **Render**: Quarto processes the document to produce PDF/HTML

## Key Features

- **DESCRIPTION file**: Declares project dependencies and metadata
- **renv.lock**: Freezes package versions for reproducibility
- **R/ directory**: Organizes analysis scripts as functions
- **Quarto integration**: Combines R code, results, and narrative in one document
- **Modular structure**: Reusable functions and clear separation of concerns

## Getting Started

1. Install dependencies: `renv::restore()`
2. Edit data files and modify R scripts as needed
3. Update `paper.qmd` with your analysis and writing
4. Render the paper: `quarto render paper.qmd`
