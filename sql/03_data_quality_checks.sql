-- Cyclistic Bike-Share Analysis
-- Step 3: Data quality checks
-- Run against trips_raw before cleaning.

-- 1. Check the raw dataset size and date range
SELECT
    COUNT(*) AS total_rows,
    MIN(started_at) AS first_start,
    MAX(started_at) AS last_start,
    MIN(ended_at) AS first_end,
    MAX(ended_at) AS last_end
FROM trips_raw;

-- 2. Check for missing key values
SELECT
    COUNT(*) FILTER (WHERE ride_id IS NULL) AS missing_ride_id,
    COUNT(*) FILTER (WHERE started_at IS NULL) AS missing_started_at,
    COUNT(*) FILTER (WHERE ended_at IS NULL) AS missing_ended_at,
    COUNT(*) FILTER (WHERE member_casual IS NULL) AS missing_rider_type
FROM trips_raw;

-- 3. Identify duplicate ride IDs
SELECT
    COUNT(*) AS duplicate_id_groups,
    SUM(copies - 1) AS excess_rows
FROM (
    SELECT ride_id, COUNT(*) AS copies
    FROM trips_raw
    WHERE ride_id IS NOT NULL
    GROUP BY ride_id
    HAVING COUNT(*) > 1
) duplicates;

-- 4. Check invalid and unusually long ride durations
SELECT
    COUNT(*) FILTER (
        WHERE ended_at <= started_at
    ) AS invalid_duration_rows,
    COUNT(*) FILTER (
        WHERE ended_at > started_at
          AND ended_at - started_at > INTERVAL '24 hours'
    ) AS rides_over_24_hours
FROM trips_raw;

-- 5. Check records starting before the study period
SELECT
    COUNT(*) AS rows_before_study_period
FROM trips_raw
WHERE started_at < TIMESTAMP '2025-11-01 00:00:00';

-- 6. Check rider category values
SELECT
    member_casual,
    COUNT(*) AS trips
FROM trips_raw
GROUP BY member_casual
ORDER BY trips DESC;
