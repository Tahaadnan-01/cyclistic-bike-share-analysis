-- Cyclistic Bike-Share Analysis
-- Step 1: Clean the raw trip data
-- Study period: November 2025 - October 2026
-- Database: DuckDB

CREATE OR REPLACE TABLE trips_clean AS
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY ride_id
               ORDER BY started_at, ended_at
           ) AS duplicate_rank
    FROM trips_raw
),
period_data AS (
    SELECT *
    FROM ranked
    WHERE duplicate_rank = 1
      AND started_at >= TIMESTAMP '2025-11-01 00:00:00'
      AND started_at < TIMESTAMP '2026-11-01 00:00:00'
      AND ended_at > started_at
)
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
    ROUND(EPOCH(ended_at - started_at) / 60.0, 2)
        AS ride_length_minutes,
    CAST(started_at AS DATE) AS ride_date,
    STRFTIME(started_at, '%A') AS day_of_week,
    EXTRACT(HOUR FROM started_at) AS start_hour,
    STRFTIME(started_at, '%Y-%m') AS ride_month,
    (ended_at - started_at > INTERVAL '24 hours')
        AS over_24_hours
FROM period_data;

-- Check the cleaning results
SELECT
    (SELECT COUNT(*) FROM trips_raw) AS raw_rows,
    (SELECT COUNT(*) FROM trips_clean) AS clean_rows,
    (SELECT COUNT(*) FROM trips_raw)
        - (SELECT COUNT(*) FROM trips_clean) AS excluded_rows,
    (SELECT COUNT(*) FROM trips_clean
        WHERE over_24_hours) AS rides_over_24_hours;
