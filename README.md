# cyclistic-bike-share-analysis
Google Data Analytics capstone analyzing Cyclistic bike-share usage with SQL, DuckDB, and Tableau Public.
# Cyclistic Bike-Share Analysis

## Project Overview

This project explores how annual members and casual riders use Cyclistic bike-share services differently. The goal is to identify usage patterns and develop data-driven recommendations that could help convert casual riders into annual members.

This case study was completed as part of the Google Data Analytics Professional Certificate.

## Business Question

**How do annual members and casual riders use Cyclistic bikes differently?**

## Dataset

- **Source:** [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)
- **Analysis period:** November 2025 – October 2026
- **Original records:** 6,294,451
- **Cleaned records:** 6,294,259

The dataset contains bike trip records, including ride start and end times, bike types, station information, and rider membership categories.

## Tools Used

- **SQL:** Data cleaning, transformation, and analysis using DuckDB
- **Python:** Supporting data analysis
- **Tableau Public:** Data visualization and dashboard development
- **Microsoft Word:** Case study report

## Data Cleaning and Preparation

The data was combined and prepared for analysis using SQL in DuckDB.

The cleaning process included:
- Checking for duplicate ride IDs
- Removing records with zero or negative trip durations
- Reviewing trips lasting longer than 24 hours
- Checking dates against the selected analysis period
- Creating trip-duration and time-based fields for analysis

Long-duration trips were retained but flagged for sensitivity analysis.

## Key Findings

- **Membership:** Annual members accounted for approximately 64.42% of rides, while casual riders accounted for 35.58%.
- **Trip duration:** Casual riders had a longer average trip duration of approximately 17.44 minutes, compared with 11.87 minutes for members, excluding trips longer than 24 hours.
- **Days of the week:** Members recorded higher ride counts on weekdays, while casual riders recorded their highest ride counts on Saturday.
- **Time of day:** Both groups showed high usage around 5 PM. Members also showed a noticeable morning increase around 8 AM.
- **Bike type:** Electric bikes were the most-used bike type for both rider groups.

## Tableau Dashboard

Explore the interactive dashboard:

[**View the Cyclistic Bike-Share Analysis Dashboard**](https://public.tableau.com/app/profile/taha.adnan/viz/Cyclistic-Bike-ShareAnalysis/Dashboard1)

## Recommendations

Based on the observed usage patterns:

1. **Target casual riders with membership campaigns:** Use weekend promotions and targeted messaging to introduce the benefits of annual membership.
2. **Promote membership around commuting patterns:** Highlight convenience and potential value for frequent weekday riders.
3. **Use data to refine marketing:** Continue comparing ride frequency, duration, bike type, and seasonal patterns to identify the most promising opportunities for conversion.

These recommendations are based on observed ride patterns. The analysis does not establish that these strategies will necessarily cause casual riders to become members.

## Project Report

The full case study report is available in this repository.

## Author

Taha Adnan

This project demonstrates practical application of data cleaning, SQL analysis, data visualization, and business recommendations using a public bike-share dataset.
