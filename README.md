# Cyclistic Bike-Share Analysis

A Google Data Analytics Professional Certificate capstone project analyzing how annual members and casual riders use Cyclistic bike-share services differently, using SQL, DuckDB, Python, and Tableau Public.

## Project Overview

This case study investigates differences in bike usage between annual members and casual riders. The objective is to identify behavioral patterns and develop data-driven recommendations that could help Cyclistic convert casual riders into annual members.

## Business Question

**How do annual members and casual riders use Cyclistic bikes differently?**

## Dataset

- **Source:** [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)
- **Analysis period:** November 2025 – October 2026
- **Original records:** 6,294,451
- **Cleaned records:** 6,294,259

The dataset contains bike-trip records, including ride start and end times, bike types, station information, and rider membership categories.

## Tools Used

- **SQL and DuckDB:** Data cleaning, transformation, quality checks, and analysis
- **Python:** Supporting data analysis
- **Tableau Public:** Interactive data visualization
- **Microsoft Word:** Case study documentation

## Data Cleaning and Preparation

The monthly trip datasets were combined and prepared for analysis using SQL in DuckDB.

The cleaning process included:

- Checking for duplicate ride IDs
- Removing duplicate records
- Excluding trips with zero or negative durations
- Reviewing trips lasting longer than 24 hours
- Checking records against the selected analysis period
- Creating trip-duration, date, weekday, start-hour, and monthly fields

Trips longer than 24 hours were retained in the cleaned dataset but flagged for sensitivity analysis. The main ride-duration comparison excludes these trips.

**SQL scripts:**
### SQL Scripts

Run the scripts in this order:

1. `sql/00_import_data.sql` — Import the 12 monthly CSV files into `trips_raw`.
2. `sql/01_data_cleaning.sql` — Clean the raw data and create `trips_clean`.
3. `sql/02_data_analysis.sql` — Run the analysis queries used for the project.
4. `sql/03_data_quality_checks.sql` — Run data quality checks to validate the results.

**Note:** Update the file paths in `00_import_data.sql` to match your local CSV folder before running it. The import script replaces the existing `trips_raw` table.


## Key Findings

- **Membership:** Annual members accounted for approximately 64.42% of rides, while casual riders accounted for 35.58%.
- **Trip duration:** Casual riders had a longer average ride duration of approximately 17.44 minutes, compared with 11.87 minutes for members, excluding trips longer than 24 hours.
- **Days of the week:** Members recorded higher ride counts on weekdays, while casual riders recorded their highest ride count on Saturday.
- **Time of day:** Both rider groups showed high usage around 5 PM. Members also showed a noticeable morning increase around 8 AM.
- **Bike type:** Electric bikes were the most-used bike type for both rider groups.

## Analysis Outputs

Selected CSV outputs are available for further inspection:

- [Rider share](analysis_outputs/rider_share.csv)
- [Ride duration comparison](analysis_outputs/duration_by_rider_no_outliers.csv)
- [Daily usage](analysis_outputs/daily_usage.csv)
- [Hourly usage](analysis_outputs/hourly_usage.csv)
- [Monthly usage](analysis_outputs/monthly_usage.csv)
- [Bike type preference](analysis_outputs/bike_type_preference.csv)
  
## Business Recommendations

Based on the observed differences between casual riders and annual members, the following strategies are recommended:

1. **Target weekend riders:** Test membership promotions aimed at casual riders, particularly around Saturday, when casual ridership is highest.

2. **Use behavior-based marketing:** Align campaign timing with the hours and days when casual riders are most active.

3. **Communicate membership value:** Highlight the convenience and potential savings of membership for riders who use the service frequently.

4. **Measure conversion performance:** Evaluate campaigns using membership conversion rates, campaign engagement, and membership sign-ups to identify effective strategies.

These recommendations are hypotheses for testing. Further campaign data would be needed to establish their effectiveness.

## Tableau Dashboard

Explore the interactive dashboard to compare rider behavior and usage patterns.

**[View the Cyclistic Bike-Share Analysis Dashboard](https://public.tableau.com/app/profile/taha.adnan/viz/Cyclistic-Bike-ShareAnalysis/Dashboard1)**

## Recommendations

Based on the observed usage patterns:

1. **Target casual riders with membership campaigns:** Use weekend promotions and targeted messaging to communicate the benefits of annual membership.
2. **Promote membership around commuting patterns:** Highlight the convenience and potential value of membership for riders who travel frequently on weekdays.
3. **Refine marketing using data:** Continue comparing ride frequency, duration, bike type, and seasonal patterns to identify promising opportunities for conversion.

These recommendations are based on observed ride patterns. The analysis does not establish that these strategies will necessarily cause casual riders to become members.

## Full Case Study Report

Read the complete written case study:

[**Google Data Analytics Capstone — Cyclistic Bike-Share Analysis (Word Document)**](Google-Capstone-Project-Cyclistic.docx)

## Author

**Taha Adnan**

This project demonstrates practical application of data cleaning, SQL analysis, data visualization, and business recommendations using public bike-share data.
