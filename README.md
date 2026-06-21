# ForestQuery Deforestation Analysis

This repository contains a submission-ready version of the ForestQuery SQL project. The analysis uses the supplied World Bank starter CSVs to build a `forestation` view, answer the required business questions, and generate a polished written report.

## Files

- `forest_area.csv`, `land_area.csv`, `regions.csv`: starter datasets used for the project
- `forest_query_analysis.sql`: the view definition plus all SQL queries used in the appendix
- `generate_submission.py`: loads the CSVs into SQLite, validates the outputs, and generates report artifacts
- `submission/forest_query_report.md`: narrative report in Markdown
- `submission/forest_query_report.docx`: Word version of the report
- `submission/forest_query_report.pdf`: PDF version of the report

## Regenerating The Report

Run:

```powershell
python generate_submission.py
```

The script rebuilds the `submission` artifacts directly from the starter CSVs so the report stays tied to the validated data outputs.
