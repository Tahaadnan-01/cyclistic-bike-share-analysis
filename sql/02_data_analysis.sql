-- Cyclistic Bike-Share Analysis
-- Step 2: Compare annual members and casual riders
-- Study period: November 2025 - October 2026
-- Database: DuckDB
-- Long rides over 24 hours are excluded from duration averages only.

-- 1. Number and percentage of trips by rider type
SELECT
    member_casual,
    COUNT(*) AS trips,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)
        AS percent_of_trips
FROM trips_clean
GROUP BY member_casual
ORDER BY trips DESC;

-- 2. Average and median ride duration
SELECT
    member_casual,
    COUNT(*) AS trips,
    ROUND(AVG(ride_length_minutes), 2) AS avg_minutes,
    ROUND(MEDIAN(ride_length_minutes), 2) AS median_minutes
FROM trips_clean
WHERE over_24_hours = FALSE
GROUP BY member_casual
ORDER BY member_casual;

-- 3. Weekday versus weekend usage
SELECT
    member_casual,
    CASE
        WHEN day_of_week IN ('Saturday', 'Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_group,
    COUNT(*) AS trips,
    ROUND(AVG(ride_length_minutes), 2) AS avg_minutes
FROM trips_clean
WHERE over_24_hours = FALSE
GROUP BY member_casual, day_group
ORDER BY member_casual, day_group;

-- 4. Trip volume by day of the week
SELECT
    member_casual,
    day_of_week,
    COUNT(*) AS trips
FROM trips_clean
GROUP BY member_casual, day_of_week
ORDER BY
    CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END,
    member_casual;

-- 5. Bike type by rider type
SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS trips,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (PARTITION BY member_casual),
        2
    ) AS percent_within_rider_type
FROM trips_clean
GROUP BY member_casual, rideable_type
ORDER BY member_casual, trips DESC;

-- 6. Trip volume by starting hour
SELECT
    member_casual,
    start_hour,
    COUNT(*) AS trips
FROM trips_clean
GROUP BY member_casual, start_hour
ORDER BY member_casual, start_hour;
