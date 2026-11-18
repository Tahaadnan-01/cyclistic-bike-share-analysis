Last login: Tue Nov 17 15:49:35 on ttys000
tahaadnan@Tahas-MacAir ~ % unzip -l ~/Downloads/Cyclistic_Capstone/Original_Zips/202601-divvy-tripdata-redownload.zip
Archive:  /Users/tahaadnan/Downloads/Cyclistic_Capstone/Original_Zips/202601-divvy-tripdata-redownload.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
 27856985  02-04-2026 19:09   202501-divvy-tripdata.csv
      598  02-04-2026 19:09   __MACOSX/._202501-divvy-tripdata.csv
---------                     -------
 27857583                     2 files
tahaadnan@Tahas-MacAir ~ % unzip -l ~/Downloads/Cyclistic_Capstone/Original_Zips/202601-divvy-tripdata-redownload.zip
Archive:  /Users/tahaadnan/Downloads/Cyclistic_Capstone/Original_Zips/202601-divvy-tripdata-redownload.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
 27856985  02-04-2026 19:09   202501-divvy-tripdata.csv
      598  02-04-2026 19:09   __MACOSX/._202501-divvy-tripdata.csv
---------                     -------
 27857583                     2 files
tahaadnan@Tahas-MacAir ~ % unzip -l ~/Downloads/Cyclistic_Capstone/Original_Zips/202601-divvy-tripdata-redownload.zip
Archive:  /Users/tahaadnan/Downloads/Cyclistic_Capstone/Original_Zips/202601-divvy-tripdata-redownload.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
 27856985  02-04-2026 19:09   202501-divvy-tripdata.csv
      598  02-04-2026 19:09   __MACOSX/._202501-divvy-tripdata.csv
---------                     -------
 27857583                     2 files
tahaadnan@Tahas-MacAir ~ % ls -lh ~/Downloads/Cyclistic_Capstone/Extracted_CSVs/*202601*.csv
-rw-r--r--@ 1 tahaadnan  staff    27M Feb  4  2026 /Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202601-divvy-tripdata.csv
tahaadnan@Tahas-MacAir ~ % python3 -c "import duckdb; con=duckdb.connect('$HOME/Downloads/Cyclistic_Capstone/cyclistic.duckdb'); print(con.execute('SELECT version()').fetchone()[0]); con.close()"
v2.0.0
tahaadnan@Tahas-MacAir ~ % >....                                                

paths = "[" + ", ".join(
    "'" + str(p).replace("'", "''") + "'"
    for p in files
) + "]"

con.execute(f"""
    CREATE OR REPLACE TABLE trips_raw AS
    SELECT *
    FROM read_csv_auto({paths}, union_by_name = true)
""")

print("\nImport complete.")
print("Rows imported:", con.execute(
    "SELECT COUNT(*) FROM trips_raw"
).fetchone()[0])
print("Columns:", con.execute(
    "DESCRIBE trips_raw"
).fetchall())

con.close()
PY

Files to import:
 - 202511-divvy-tripdata.csv
 - 202512-divvy-tripdata.csv
 - 202601-divvy-tripdata.csv
 - 202602-divvy-tripdata.csv
 - 202603-divvy-tripdata.csv
 - 202604-divvy-tripdata.csv
 - 202605-divvy-tripdata.csv
 - 202606-divvy-tripdata.csv
 - 202607-divvy-tripdata.csv
 - 202608-divvy-tripdata.csv
 - 202609-divvy-tripdata.csv
 - 202610-divvy-tripdata.csv

Import complete.
Rows imported: 6294451
Columns: [('ride_id', 'VARCHAR', 'YES', None, None, None), ('rideable_type', 'VARCHAR', 'YES', None, None, None), ('started_at', 'TIMESTAMP', 'YES', None, None, None), ('ended_at', 'TIMESTAMP', 'YES', None, None, None), ('start_station_name', 'VARCHAR', 'YES', None, None, None), ('start_station_id', 'VARCHAR', 'YES', None, None, None), ('end_station_name', 'VARCHAR', 'YES', None, None, None), ('end_station_id', 'VARCHAR', 'YES', None, None, None), ('start_lat', 'DOUBLE', 'YES', None, None, None), ('start_lng', 'DOUBLE', 'YES', None, None, None), ('end_lat', 'DOUBLE', 'YES', None, None, None), ('end_lng', 'DOUBLE', 'YES', None, None, None), ('member_casual', 'VARCHAR', 'YES', None, None, None)]
tahaadnan@Tahas-MacAir ~ % >....                                                
        ) AS zero_or_negative_duration,
        COUNT(*) FILTER (
            WHERE ended_at > started_at
              AND ended_at - started_at > INTERVAL '24 hours'
        ) AS longer_than_24_hours,
        ROUND(AVG(
            EPOCH(ended_at - started_at) / 60.0
        ), 2) AS avg_duration_minutes
    FROM trips_raw
""").fetchdf().to_string(index=False))

print("\n6. TRIPS PER MONTH")
print(con.execute("""
    SELECT
        STRFTIME(started_at, '%Y-%m') AS month,
        COUNT(*) AS trips
    FROM trips_raw
    GROUP BY month
    ORDER BY month
""").fetchdf().to_string(index=False))

con.close()

zsh: parse error near `)'
tahaadnan@Tahas-MacAir ~ % >....                                                
        ) AS zero_or_negative_duration,
        COUNT(*) FILTER (
            WHERE ended_at > started_at
              AND ended_at - started_at > INTERVAL '24 hours'
        ) AS longer_than_24_hours,
        ROUND(AVG(
            EPOCH(ended_at - started_at) / 60.0
        ), 2) AS avg_duration_minutes
    FROM trips_raw
""").fetchdf().to_string(index=False))

print("\n6. TRIPS PER MONTH")
print(con.execute("""
    SELECT
        STRFTIME(started_at, '%Y-%m') AS month,
        COUNT(*) AS trips
    FROM trips_raw
    GROUP BY month
    ORDER BY month
""").fetchdf().to_string(index=False))

con.close()

zsh: parse error near `)'
tahaadnan@Tahas-MacAir ~ % >....                                                
        ) AS zero_or_negative_duration,
        COUNT(*) FILTER (
            WHERE ended_at > started_at
              AND ended_at - started_at > INTERVAL '24 hours'
        ) AS longer_than_24_hours,
        ROUND(AVG(
            EPOCH(ended_at - started_at) / 60.0
        ), 2) AS avg_duration_minutes
    FROM trips_raw
""").fetchdf().to_string(index=False))

print("\n6. TRIPS PER MONTH")
print(con.execute("""
    SELECT
        STRFTIME(started_at, '%Y-%m') AS month,
        COUNT(*) AS trips
    FROM trips_raw
    GROUP BY month
    ORDER BY month
""").fetchdf().to_string(index=False))

con.close()

zsh: parse error near `)'
tahaadnan@Tahas-MacAir ~ % >....                                                
    "DURATION CHECK": """
        SELECT
            COUNT(*) FILTER (WHERE ended_at <= started_at) AS invalid_duration,
            COUNT(*) FILTER (
                WHERE ended_at > started_at
                AND ended_at - started_at > INTERVAL '24 hours'
            ) AS over_24_hours,
            ROUND(AVG(EPOCH(ended_at-started_at)/60.0), 2) AS avg_minutes
        FROM trips_raw
    """,
    "MONTHLY COUNTS": """
        SELECT STRFTIME(started_at, '%Y-%m') AS month, COUNT(*) AS trips
        FROM trips_raw GROUP BY month ORDER BY month
    """
}

for name, sql in checks.items():
    print(f"\n--- {name} ---")
    print(con.execute(sql).fetchdf().to_string(index=False))

con.close()
PY


--- DATE RANGE ---
        min(started_at)         max(started_at)           min(ended_at)           max(ended_at)
2025-10-31 01:24:38.549 2026-10-31 23:59:45.105 2025-11-01 00:00:08.881 2026-11-01 23:43:15.312

--- MISSING VALUES ---
 total_rows  missing_id  missing_start  missing_end  missing_type
    6294451           0              0            0             0

--- RIDER TYPES ---
member_casual   trips
       member 4055038
       casual 2239413

--- DUPLICATE IDS ---
 duplicate_id_groups
                  35

--- DURATION CHECK ---
 invalid_duration  over_24_hours  avg_minutes
               29           5155        15.07

--- MONTHLY COUNTS ---
  month  trips
2025-10    128
2025-11 356512
2025-12 140545
2026-01 137782
2026-02 201454
2026-03 317015
2026-04 448287
2026-05 653747
2026-06 762595
2026-07 869101
2026-08 868069
2026-09 770511
2026-10 768705
tahaadnan@Tahas-MacAir ~ % >....                                                
            ), 2) AS percentile_99
        FROM trips_raw
        WHERE ended_at > started_at
    """,
    "OCTOBER 2025 EDGE RECORDS": """
        SELECT COUNT(*) AS rows_before_november
        FROM trips_raw
        WHERE started_at < TIMESTAMP '2025-11-01 00:00:00'
    """,
    "RIDER TYPE VALUES": """
        SELECT DISTINCT member_casual
        FROM trips_raw
        ORDER BY member_casual
    """
}

for title, sql in queries.items():
    print(f"\n--- {title} ---")
    print(con.execute(sql).fetchdf().to_string(index=False))

con.close()
PY


--- DUPLICATE RECORD IMPACT ---
 rows_in_duplicate_groups  excess_rows  largest_group_size
                       35         35.0                   2

--- DUPLICATE EXAMPLES ---
         ride_id  copies
03C5375398BE0649       2
82EDB771CE5282E8       2
C85BE84CF8D18F6D       2
78D590AAA74CAE97       2
67C08EEA3F45893E       2
96EC33CC33D9FB6D       2
10117825A92C182D       2
4EBCC6DF233878B6       2
5C56F4FB55D5B5F5       2
69451215A387162E       2

--- LONG RIDES BY RIDER TYPE ---
member_casual  rides_over_24h  avg_hours  max_hours
       casual            4074      24.99       26.0
       member            1081      24.98       26.0

--- DURATION DISTRIBUTION IN MINUTES ---
 median_minutes  percentile_95  percentile_99
            9.2          37.43          80.52

--- OCTOBER 2025 EDGE RECORDS ---
 rows_before_november
                  128

--- RIDER TYPE VALUES ---
member_casual
       casual
       member
tahaadnan@Tahas-MacAir ~ % >....                                                
        (SELECT COUNT(*) FROM trips_clean
          WHERE over_24_hours) AS rides_over_24_hours
""").fetchdf().to_string(index=False))

print("\n--- CLEANED MONTHLY COUNTS ---")
print(con.execute("""
    SELECT ride_month, COUNT(*) AS trips
    FROM trips_clean
    GROUP BY ride_month
    ORDER BY ride_month
""").fetchdf().to_string(index=False))

print("\n--- CLEANED RIDER COUNTS ---")
print(con.execute("""
    SELECT member_casual, COUNT(*) AS trips
    FROM trips_clean
    GROUP BY member_casual
    ORDER BY trips DESC
""").fetchdf().to_string(index=False))

con.close()
PY


--- CLEANING SUMMARY ---
 raw_rows  clean_rows  excluded_rows  rides_over_24_hours
  6294451     6294259            192                 5128

--- CLEANED MONTHLY COUNTS ---
ride_month  trips
   2025-11 356483
   2025-12 140545
   2026-01 137782
   2026-02 201454
   2026-03 317015
   2026-04 448252
   2026-05 653747
   2026-06 762595
   2026-07 869101
   2026-08 868069
   2026-09 770511
   2026-10 768705

--- CLEANED RIDER COUNTS ---
member_casual   trips
       member 4054930
       casual 2239329
tahaadnan@Tahas-MacAir ~ % >....                                                
        SELECT member_casual, rideable_type, COUNT(*) AS trips,
               ROUND(100.0 * COUNT(*) /
                 SUM(COUNT(*)) OVER (PARTITION BY member_casual), 2)
                 AS percent_within_rider_type
        FROM trips_clean
        GROUP BY member_casual, rideable_type
        ORDER BY member_casual, trips DESC
    """,
    "6. START HOUR": """
        SELECT member_casual, start_hour, COUNT(*) AS trips
        FROM trips_clean
        GROUP BY member_casual, start_hour
        ORDER BY member_casual, start_hour
    """
}

for title, sql in queries.items():
    print(f"\n--- {title} ---")
    print(con.execute(sql).fetchdf().to_string(index=False))

con.close()
PY


--- 1. RIDER SHARE ---
member_casual   trips  percent_of_trips
       member 4054930             64.42
       casual 2239329             35.58

--- 2. RIDE DURATION BY RIDER ---
member_casual   trips  avg_minutes  median_minutes
       casual 2239329        20.12           10.73
       member 4054930        12.27            8.50

--- 3. WEEKDAY VS WEEKEND ---
member_casual day_group   trips  avg_minutes
       casual   Weekday 1394046        18.46
       casual   Weekend  845283        22.86
       member   Weekday 3093040        11.89
       member   Weekend  961890        13.48

--- 4. USAGE BY DAY ---
member_casual day_of_week  trips
       casual      Monday 258422
       member      Monday 566775
       casual     Tuesday 260417
       member     Tuesday 661016
       casual   Wednesday 257381
       member   Wednesday 644954
       casual    Thursday 272136
       member    Thursday 627321
       casual      Friday 345690
       member      Friday 592974
       casual    Saturday 482249
       member    Saturday 531151
       casual      Sunday 363034
       member      Sunday 430739

--- 5. BIKE TYPE ---
member_casual rideable_type   trips  percent_within_rider_type
       casual electric_bike 1703278                      76.06
       casual  classic_bike  536051                      23.94
       member electric_bike 2831820                      69.84
       member  classic_bike 1223110                      30.16

--- 6. START HOUR ---
member_casual  start_hour  trips
       casual           0  49929
       casual           1  33044
       casual           2  20637
       casual           3  12074
       casual           4   9390
       casual           5  15101
       casual           6  31256
       casual           7  54986
       casual           8  79903
       casual           9  76752
       casual          10  90972
       casual          11 115536
       casual          12 137751
       casual          13 145076
       casual          14 149626
       casual          15 166710
       casual          16 193749
       casual          17 210937
       casual          18 181789
       casual          19 136133
       casual          20 102038
       casual          21  89208
       casual          22  79492
       casual          23  57240
       member           0  39503
       member           1  24210
       member           2  14132
       member           3   9370
       member           4  10125
       member           5  39113
       member           6 114410
       member           7 224786
       member           8 293395
       member           9 186493
       member          10 158662
       member          11 183864
       member          12 210531
       member          13 208834
       member          14 209691
       member          15 267309
       member          16 381691
       member          17 435566
       member          18 342562
       member          19 237094
       member          20 168942
       member          21 134123
       member          22  98609
       member          23  61915
tahaadnan@Tahas-MacAir ~ % >....                                                
        FROM trips_clean
        GROUP BY member_casual, start_hour
        ORDER BY start_hour, member_casual
    """,

    "monthly_usage.csv": """
        SELECT member_casual, ride_month,
               COUNT(*) AS trips
        FROM trips_clean
        GROUP BY member_casual, ride_month
        ORDER BY ride_month, member_casual
    """
}

for filename, sql in queries.items():
    df = con.execute(sql).fetchdf()
    path = out_dir / filename
    df.to_csv(path, index=False)
    print(f"Created: {path} ({len(df):,} rows)")

con.close()
print("\nAll six analysis files exported successfully.")
PY
Created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/analysis_outputs/rider_share.csv (2 rows)
Created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/analysis_outputs/duration_by_rider.csv (2 rows)
Created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/analysis_outputs/daily_usage.csv (14 rows)
Created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/analysis_outputs/bike_type.csv (4 rows)
Created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/analysis_outputs/hourly_usage.csv (48 rows)
Created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/analysis_outputs/monthly_usage.csv (24 rows)

All six analysis files exported successfully.
tahaadnan@Tahas-MacAir ~ % >....                                                
COPY (
    SELECT
        rideable_type AS "Rideable Type",
        member_casual AS "Member Casual",
        COUNT(*) AS Trips
    FROM trips_clean
    GROUP BY rideable_type, member_casual
    ORDER BY rideable_type, member_casual
)
TO '{csv_path}' (HEADER, DELIMITER ',')
""")

print("CSV created:", csv_path)
print(con.execute("""
    SELECT rideable_type, member_casual, COUNT(*) AS trips
    FROM trips_clean
    GROUP BY rideable_type, member_casual
    ORDER BY rideable_type, member_casual
""").fetchdf().to_string(index=False))

con.close()
PY

CSV created: /Users/tahaadnan/Downloads/Cyclistic_Capstone/bike_type_preference.csv
rideable_type member_casual   trips
 classic_bike        casual  536051
 classic_bike        member 1223110
electric_bike        casual 1703278
electric_bike        member 2831820
tahaadnan@Tahas-MacAir ~ % >....                                                
csv_path = os.path.join(folder, "hourly_usage.csv")

con = duckdb.connect(db_path, read_only=True)

query = """
SELECT
    start_hour AS "Start Hour",
    member_casual AS "Member Casual",
    COUNT(*) AS Trips
FROM trips_clean
GROUP BY start_hour, member_casual
ORDER BY start_hour, member_casual
"""

df = con.execute(query).fetchdf()
df.to_csv(csv_path, index=False)
con.close()

print("Hourly dataset created successfully.")
print(f"Rows: {len(df)}")
print(f"Saved to: {csv_path}")
print(df.head(6).to_string(index=False))
PY
Hourly dataset created successfully.
Rows: 48
Saved to: /Users/tahaadnan/Downloads/Cyclistic_Capstone/hourly_usage.csv
 Start Hour Member Casual  Trips
          0        casual  49929
          0        member  39503
          1        casual  33044
          1        member  24210
          2        casual  20637
          2        member  14132
tahaadnan@Tahas-MacAir ~ % >....                                                
con = duckdb.connect(db_path, read_only=True)

query = """
SELECT
    member_casual AS "Member Casual",
    ROUND(AVG(ride_length_minutes), 2) AS "Avg Minutes",
    ROUND(MEDIAN(ride_length_minutes), 2) AS "Median Minutes",
    COUNT(*) AS "Trips"
FROM trips_clean
WHERE over_24_hours = FALSE
GROUP BY member_casual
ORDER BY member_casual
"""

result = con.execute(query).fetchdf()
print("\nRide duration excluding rides over 24 hours:\n")
print(result.to_string(index=False))

result.to_csv(output_path, index=False)
print(f"\nSaved comparison file to:\n{output_path}")

con.close()
PY

Ride duration excluding rides over 24 hours:

Member Casual  Avg Minutes  Median Minutes   Trips
       casual        17.44           10.71 2235273
       member        11.87            8.50 4053858

Saved comparison file to:
/Users/tahaadnan/Downloads/Cyclistic_Capstone/duration_by_rider_no_outliers.csv
tahaadnan@Tahas-MacAir ~ % >....                                                

db = duckdb.connect(
    '~/Downloads/Cyclistic_Capstone/cyclistic.duckdb',
    read_only=True
)

result = db.execute("""
    SELECT
        member_casual AS rider_type,
        ROUND(AVG(ride_length_minutes), 2) AS avg_minutes,
        ROUND(MEDIAN(ride_length_minutes), 2) AS median_minutes,
        COUNT(*) AS trips
    FROM trips_clean
    WHERE over_24_hours = FALSE
    GROUP BY member_casual
    ORDER BY member_casual
""").fetchdf()

print("\\nRide duration excluding rides over 24 hours:")
print(result.to_string(index=False))

db.close()
PY
\nRide duration excluding rides over 24 hours:
rider_type  avg_minutes  median_minutes   trips
    casual        17.44           10.71 2235273
    member        11.87            8.50 4053858
tahaadnan@Tahas-MacAir ~ % >....                                                
db = duckdb.connect(
    '~/Downloads/Cyclistic_Capstone/cyclistic.duckdb',
    read_only=True
)

result = db.execute("""
    SELECT
        member_casual AS rider_type,
        ROUND(AVG(ride_length_minutes), 2) AS avg_including_all,
        ROUND(AVG(ride_length_minutes)
            FILTER (WHERE over_24_hours = FALSE), 2)
            AS avg_excluding_long_rides,
        COUNT(*) AS all_trips,
        COUNT(*) FILTER (WHERE over_24_hours = FALSE)
            AS trips_excluding_long_rides
    FROM trips_clean
    GROUP BY member_casual
    ORDER BY member_casual
""").fetchdf()

print(result.to_string(index=False))
db.close()
PY
rider_type  avg_including_all  avg_excluding_long_rides  all_trips  trips_excluding_long_rides
    casual              20.12                     17.44    2239329                     2235273
    member              12.27                     11.87    4054930                     4053858
tahaadnan@Tahas-MacAir ~ % cd ~/Downloads/Cyclistic_Capstone
ls -lah
total 1294376
drwxr-xr-x    7 tahaadnan  staff   224B Nov 18 16:43 .
drwx------@ 241 tahaadnan  staff   7.5K Nov 18 16:40 ..
-rw-r--r--@   1 tahaadnan  staff   6.0K Nov 18 16:45 .DS_Store
drwxr-xr-x   10 tahaadnan  staff   320B Nov 18 16:43 analysis_outputs
-rw-r--r--@   1 tahaadnan  staff   632M Nov 17 21:19 cyclistic.duckdb
drwxr-xr-x   15 tahaadnan  staff   480B Nov 17 21:13 Extracted_CSVs
drwxr-xr-x   15 tahaadnan  staff   480B Nov 17 21:06 Original_Zips
tahaadnan@Tahas-MacAir Cyclistic_Capstone % python3 -c "import duckdb; con=duckdb.connect('cyclistic.duckdb', read_only=True); print(con.execute('SHOW TABLES').fetchdf().to_string(index=False)); con.close()"
       name
trips_clean
  trips_raw
tahaadnan@Tahas-MacAir Cyclistic_Capstone % history 2000 | grep -iE 'duckdb|CREATE TABLE|SELECT|COPY|read_csv|GROUP BY' | tail -40
fc: no such event: 2000
tahaadnan@Tahas-MacAir Cyclistic_Capstone % fc -l -2000 | grep -iE 'duckdb|CREATE TABLE|SELECT|COPY|read_csv|GROUP BY' | tail -40
   92  $ xcode-select --install
   93  xcode-select --install
  169  python3 -m pip install duckdb
  170  python3 -c "import duckdb; print(duckdb.__version__)"
  189  python3 -c "import duckdb; con=duckdb.connect('$HOME/Downloads/Cyclistic_Capstone/cyclistic.duckdb'); print(con.execute('SELECT version()').fetchone()[0]); con.close()"
  190  \npython3 - <<'PY'\nfrom pathlib import Path\nimport re\nimport duckdb\n\nfolder = Path.home() / "Downloads/Cyclistic_Capstone/Extracted_CSVs"\npattern = re.compile(\n    r"^(202511|202512|2026(?:0[1-9]|10))-divvy-tripdata\.csv$"\n)\nfiles = sorted(\n    p for p in folder.iterdir()\n    if p.is_file() and pattern.match(p.name)\n)\n\nif len(files) != 12:\n    print(f"Expected 12 monthly files, found {len(files)}:")\n    for p in files:\n        print(p.name)\n    raise SystemExit("Check the missing files before importing.")\n\nprint("Files to import:")\nfor p in files:\n    print(" -", p.name)\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db))\n\npaths = "[" + ", ".join(\n    "'" + str(p).replace("'", "''") + "'"\n    for p in files\n) + "]"\n\ncon.execute(f"""\n    CREATE OR REPLACE TABLE trips_raw AS\n    SELECT *\n    FROM read_csv_auto({paths}, union_by_name = true)\n""")\n\nprint("\nImport complete.")\nprint("Rows imported:", con.execute(\n    "SELECT COUNT(*) FROM trips_raw"\n).fetchone()[0])\nprint("Columns:", con.execute(\n    "DESCRIBE trips_raw"\n).fetchall())\n\ncon.close()\nPY\n
  191  \nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db), read_only=True)\n\nprint("\n1. DATE RANGE")\nprint(con.execute("""\n    SELECT MIN(started_at), MAX(started_at),\n           MIN(ended_at), MAX(ended_at)\n    FROM trips_raw\n""").fetchall())\n\nprint("\n2. MISSING VALUES")\nprint(con.execute("""\n    SELECT\n        COUNT(*) AS total_rows,\n        COUNT(*) FILTER (WHERE ride_id IS NULL) AS missing_ride_id,\n        COUNT(*) FILTER (WHERE started_at IS NULL) AS missing_started_at,\n        COUNT(*) FILTER (WHERE ended_at IS NULL) AS missing_ended_at,\n        COUNT(*) FILTER (WHERE member_casual IS NULL) AS missing_rider_type\n    FROM trips_raw\n""").fetchdf().to_string(index=False))\n\nprint("\n3. RIDER TYPES")\nprint(con.execute("""\n    SELECT member_casual, COUNT(*) AS trips\n    FROM trips_raw\n    GROUP BY member_casual\n    ORDER BY trips DESC\n""").fetchdf().to_string(index=False))\n\nprint("\n4. DUPLICATE RIDE IDS")\nprint(con.execute("""\n    SELECT COUNT(*) AS duplicate_rows\n    FROM (\n        SELECT ride_id\n        FROM trips_raw\n        WHERE ride_id IS NOT NULL\n        GROUP BY ride_id\n        HAVING COUNT(*) > 1\n    ) d\n""").fetchdf().to_string(index=False))\n\nprint("\n5. RIDE DURATIONS")\nprint(con.execute("""\n    SELECT\n        COUNT(*) FILTER (\n            WHERE ended_at <= started_at\n        ) AS zero_or_negative_duration,\n        COUNT(*) FILTER (\n            WHERE ended_at > started_at\n              AND ended_at - started_at > INTERVAL '24 hours'\n        ) AS longer_than_24_hours,\n        ROUND(AVG(\n            EPOCH(ended_at - started_at) / 60.0\n        ), 2) AS avg_duration_minutes\n    FROM trips_raw\n""").fetchdf().to_string(index=False))\n\nprint("\n6. TRIPS PER MONTH")\nprint(con.execute("""\n    SELECT\n        STRFTIME(started_at, '%Y-%m') AS month,\n        COUNT(*) AS trips\n    FROM trips_raw\n    GROUP BY month\n    ORDER BY month\n""").fetchdf().to_string(index=False))\n\ncon.close()\n
  192  \nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db), read_only=True)\n\nprint("\n1. DATE RANGE")\nprint(con.execute("""\n    SELECT MIN(started_at), MAX(started_at),\n           MIN(ended_at), MAX(ended_at)\n    FROM trips_raw\n""").fetchall())\n\nprint("\n2. MISSING VALUES")\nprint(con.execute("""\n    SELECT\n        COUNT(*) AS total_rows,\n        COUNT(*) FILTER (WHERE ride_id IS NULL) AS missing_ride_id,\n        COUNT(*) FILTER (WHERE started_at IS NULL) AS missing_started_at,\n        COUNT(*) FILTER (WHERE ended_at IS NULL) AS missing_ended_at,\n        COUNT(*) FILTER (WHERE member_casual IS NULL) AS missing_rider_type\n    FROM trips_raw\n""").fetchdf().to_string(index=False))\n\nprint("\n3. RIDER TYPES")\nprint(con.execute("""\n    SELECT member_casual, COUNT(*) AS trips\n    FROM trips_raw\n    GROUP BY member_casual\n    ORDER BY trips DESC\n""").fetchdf().to_string(index=False))\n\nprint("\n4. DUPLICATE RIDE IDS")\nprint(con.execute("""\n    SELECT COUNT(*) AS duplicate_rows\n    FROM (\n        SELECT ride_id\n        FROM trips_raw\n        WHERE ride_id IS NOT NULL\n        GROUP BY ride_id\n        HAVING COUNT(*) > 1\n    ) d\n""").fetchdf().to_string(index=False))\n\nprint("\n5. RIDE DURATIONS")\nprint(con.execute("""\n    SELECT\n        COUNT(*) FILTER (\n            WHERE ended_at <= started_at\n        ) AS zero_or_negative_duration,\n        COUNT(*) FILTER (\n            WHERE ended_at > started_at\n              AND ended_at - started_at > INTERVAL '24 hours'\n        ) AS longer_than_24_hours,\n        ROUND(AVG(\n            EPOCH(ended_at - started_at) / 60.0\n        ), 2) AS avg_duration_minutes\n    FROM trips_raw\n""").fetchdf().to_string(index=False))\n\nprint("\n6. TRIPS PER MONTH")\nprint(con.execute("""\n    SELECT\n        STRFTIME(started_at, '%Y-%m') AS month,\n        COUNT(*) AS trips\n    FROM trips_raw\n    GROUP BY month\n    ORDER BY month\n""").fetchdf().to_string(index=False))\n\ncon.close()\n
  193  \nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db), read_only=True)\n\nprint("\n1. DATE RANGE")\nprint(con.execute("""\n    SELECT MIN(started_at), MAX(started_at),\n           MIN(ended_at), MAX(ended_at)\n    FROM trips_raw\n""").fetchall())\n\nprint("\n2. MISSING VALUES")\nprint(con.execute("""\n    SELECT\n        COUNT(*) AS total_rows,\n        COUNT(*) FILTER (WHERE ride_id IS NULL) AS missing_ride_id,\n        COUNT(*) FILTER (WHERE started_at IS NULL) AS missing_started_at,\n        COUNT(*) FILTER (WHERE ended_at IS NULL) AS missing_ended_at,\n        COUNT(*) FILTER (WHERE member_casual IS NULL) AS missing_rider_type\n    FROM trips_raw\n""").fetchdf().to_string(index=False))\n\nprint("\n3. RIDER TYPES")\nprint(con.execute("""\n    SELECT member_casual, COUNT(*) AS trips\n    FROM trips_raw\n    GROUP BY member_casual\n    ORDER BY trips DESC\n""").fetchdf().to_string(index=False))\n\nprint("\n4. DUPLICATE RIDE IDS")\nprint(con.execute("""\n    SELECT COUNT(*) AS duplicate_rows\n    FROM (\n        SELECT ride_id\n        FROM trips_raw\n        WHERE ride_id IS NOT NULL\n        GROUP BY ride_id\n        HAVING COUNT(*) > 1\n    ) d\n""").fetchdf().to_string(index=False))\n\nprint("\n5. RIDE DURATIONS")\nprint(con.execute("""\n    SELECT\n        COUNT(*) FILTER (\n            WHERE ended_at <= started_at\n        ) AS zero_or_negative_duration,\n        COUNT(*) FILTER (\n            WHERE ended_at > started_at\n              AND ended_at - started_at > INTERVAL '24 hours'\n        ) AS longer_than_24_hours,\n        ROUND(AVG(\n            EPOCH(ended_at - started_at) / 60.0\n        ), 2) AS avg_duration_minutes\n    FROM trips_raw\n""").fetchdf().to_string(index=False))\n\nprint("\n6. TRIPS PER MONTH")\nprint(con.execute("""\n    SELECT\n        STRFTIME(started_at, '%Y-%m') AS month,\n        COUNT(*) AS trips\n    FROM trips_raw\n    GROUP BY month\n    ORDER BY month\n""").fetchdf().to_string(index=False))\n\ncon.close()\n
  194  \npython3 - <<'PY'\nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db), read_only=True)\n\nchecks = {\n    "DATE RANGE": """\n        SELECT MIN(started_at), MAX(started_at),\n               MIN(ended_at), MAX(ended_at)\n        FROM trips_raw\n    """,\n    "MISSING VALUES": """\n        SELECT\n            COUNT(*) AS total_rows,\n            COUNT(*) FILTER (WHERE ride_id IS NULL) AS missing_id,\n            COUNT(*) FILTER (WHERE started_at IS NULL) AS missing_start,\n            COUNT(*) FILTER (WHERE ended_at IS NULL) AS missing_end,\n            COUNT(*) FILTER (WHERE member_casual IS NULL) AS missing_type\n        FROM trips_raw\n    """,\n    "RIDER TYPES": """\n        SELECT member_casual, COUNT(*) AS trips\n        FROM trips_raw GROUP BY member_casual ORDER BY trips DESC\n    """,\n    "DUPLICATE IDS": """\n        SELECT COUNT(*) AS duplicate_id_groups FROM (\n            SELECT ride_id FROM trips_raw\n            WHERE ride_id IS NOT NULL\n            GROUP BY ride_id HAVING COUNT(*) > 1\n        ) d\n    """,\n    "DURATION CHECK": """\n        SELECT\n            COUNT(*) FILTER (WHERE ended_at <= started_at) AS invalid_duration,\n            COUNT(*) FILTER (\n                WHERE ended_at > started_at\n                AND ended_at - started_at > INTERVAL '24 hours'\n            ) AS over_24_hours,\n            ROUND(AVG(EPOCH(ended_at-started_at)/60.0), 2) AS avg_minutes\n        FROM trips_raw\n    """,\n    "MONTHLY COUNTS": """\n        SELECT STRFTIME(started_at, '%Y-%m') AS month, COUNT(*) AS trips\n        FROM trips_raw GROUP BY month ORDER BY month\n    """\n}\n\nfor name, sql in checks.items():\n    print(f"\n--- {name} ---")\n    print(con.execute(sql).fetchdf().to_string(index=False))\n\ncon.close()\nPY\n
  195  \npython3 - <<'PY'\nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db), read_only=True)\n\nqueries = {\n    "DUPLICATE RECORD IMPACT": """\n        SELECT\n            COUNT(*) AS rows_in_duplicate_groups,\n            SUM(n - 1) AS excess_rows,\n            MAX(n) AS largest_group_size\n        FROM (\n            SELECT ride_id, COUNT(*) AS n\n            FROM trips_raw\n            WHERE ride_id IS NOT NULL\n            GROUP BY ride_id\n            HAVING COUNT(*) > 1\n        ) d\n    """,\n    "DUPLICATE EXAMPLES": """\n        SELECT ride_id, COUNT(*) AS copies\n        FROM trips_raw\n        GROUP BY ride_id\n        HAVING COUNT(*) > 1\n        ORDER BY copies DESC\n        LIMIT 10\n    """,\n    "LONG RIDES BY RIDER TYPE": """\n        SELECT\n            member_casual,\n            COUNT(*) AS rides_over_24h,\n            ROUND(AVG(EPOCH(ended_at-started_at)/3600), 2)\n                AS avg_hours,\n            ROUND(MAX(EPOCH(ended_at-started_at)/3600), 2)\n                AS max_hours\n        FROM trips_raw\n        WHERE ended_at > started_at\n          AND ended_at - started_at > INTERVAL '24 hours'\n        GROUP BY member_casual\n    """,\n    "DURATION DISTRIBUTION IN MINUTES": """\n        SELECT\n            ROUND(quantile_cont(\n                EPOCH(ended_at-started_at)/60.0, 0.50\n            ), 2) AS median_minutes,\n            ROUND(quantile_cont(\n                EPOCH(ended_at-started_at)/60.0, 0.95\n            ), 2) AS percentile_95,\n            ROUND(quantile_cont(\n                EPOCH(ended_at-started_at)/60.0, 0.99\n            ), 2) AS percentile_99\n        FROM trips_raw\n        WHERE ended_at > started_at\n    """,\n    "OCTOBER 2025 EDGE RECORDS": """\n        SELECT COUNT(*) AS rows_before_november\n        FROM trips_raw\n        WHERE started_at < TIMESTAMP '2025-11-01 00:00:00'\n    """,\n    "RIDER TYPE VALUES": """\n        SELECT DISTINCT member_casual\n        FROM trips_raw\n        ORDER BY member_casual\n    """\n}\n\nfor title, sql in queries.items():\n    print(f"\n--- {title} ---")\n    print(con.execute(sql).fetchdf().to_string(index=False))\n\ncon.close()\nPY\n
  196  \npython3 - <<'PY'\nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db))\n\n# Preserve trips_raw. Rebuild only the separate cleaned table.\ncon.execute("""\nCREATE OR REPLACE TABLE trips_clean AS\nWITH ranked AS (\n    SELECT *,\n           ROW_NUMBER() OVER (\n               PARTITION BY ride_id\n               ORDER BY started_at, ended_at\n           ) AS duplicate_rank\n    FROM trips_raw\n),\nperiod_data AS (\n    SELECT *\n    FROM ranked\n    WHERE duplicate_rank = 1\n      AND started_at >= TIMESTAMP '2025-11-01 00:00:00'\n      AND started_at <  TIMESTAMP '2026-11-01 00:00:00'\n      AND ended_at > started_at\n)\nSELECT\n    ride_id,\n    rideable_type,\n    started_at,\n    ended_at,\n    start_station_name,\n    start_station_id,\n    end_station_name,\n    end_station_id,\n    start_lat,\n    start_lng,\n    end_lat,\n    end_lng,\n    member_casual,\n    ROUND(EPOCH(ended_at - started_at) / 60.0, 2)\n        AS ride_length_minutes,\n    CAST(started_at AS DATE) AS ride_date,\n    STRFTIME(started_at, '%A') AS day_of_week,\n    EXTRACT(HOUR FROM started_at) AS start_hour,\n    STRFTIME(started_at, '%Y-%m') AS ride_month,\n    (ended_at - started_at > INTERVAL '24 hours')\n        AS over_24_hours\nFROM period_data\n""")\n\nprint("\n--- CLEANING SUMMARY ---")\nprint(con.execute("""\n    SELECT\n        (SELECT COUNT(*) FROM trips_raw) AS raw_rows,\n        (SELECT COUNT(*) FROM trips_clean) AS clean_rows,\n        (SELECT COUNT(*) FROM trips_raw)\n          - (SELECT COUNT(*) FROM trips_clean) AS excluded_rows,\n        (SELECT COUNT(*) FROM trips_clean\n          WHERE over_24_hours) AS rides_over_24_hours\n""").fetchdf().to_string(index=False))\n\nprint("\n--- CLEANED MONTHLY COUNTS ---")\nprint(con.execute("""\n    SELECT ride_month, COUNT(*) AS trips\n    FROM trips_clean\n    GROUP BY ride_month\n    ORDER BY ride_month\n""").fetchdf().to_string(index=False))\n\nprint("\n--- CLEANED RIDER COUNTS ---")\nprint(con.execute("""\n    SELECT member_casual, COUNT(*) AS trips\n    FROM trips_clean\n    GROUP BY member_casual\n    ORDER BY trips DESC\n""").fetchdf().to_string(index=False))\n\ncon.close()\nPY\n
  197  \npython3 - <<'PY'\nimport duckdb\nfrom pathlib import Path\n\ndb = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\ncon = duckdb.connect(str(db), read_only=True)\n\nqueries = {\n    "1. RIDER SHARE": """\n        SELECT member_casual,\n               COUNT(*) AS trips,\n               ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)\n                   AS percent_of_trips\n        FROM trips_clean\n        GROUP BY member_casual\n        ORDER BY trips DESC\n    """,\n    "2. RIDE DURATION BY RIDER": """\n        SELECT member_casual,\n               COUNT(*) AS trips,\n               ROUND(AVG(ride_length_minutes), 2) AS avg_minutes,\n               ROUND(MEDIAN(ride_length_minutes), 2) AS median_minutes\n        FROM trips_clean\n        GROUP BY member_casual\n        ORDER BY member_casual\n    """,\n    "3. WEEKDAY VS WEEKEND": """\n        SELECT member_casual,\n               CASE WHEN day_of_week IN ('Saturday', 'Sunday')\n                    THEN 'Weekend' ELSE 'Weekday' END AS day_group,\n               COUNT(*) AS trips,\n               ROUND(AVG(ride_length_minutes), 2) AS avg_minutes\n        FROM trips_clean\n        GROUP BY member_casual, day_group\n        ORDER BY member_casual, day_group\n    """,\n    "4. USAGE BY DAY": """\n        SELECT member_casual, day_of_week, COUNT(*) AS trips\n        FROM trips_clean\n        GROUP BY member_casual, day_of_week\n        ORDER BY\n          CASE day_of_week\n            WHEN 'Monday' THEN 1 WHEN 'Tuesday' THEN 2\n            WHEN 'Wednesday' THEN 3 WHEN 'Thursday' THEN 4\n            WHEN 'Friday' THEN 5 WHEN 'Saturday' THEN 6\n            WHEN 'Sunday' THEN 7 END,\n          member_casual\n    """,\n    "5. BIKE TYPE": """\n        SELECT member_casual, rideable_type, COUNT(*) AS trips,\n               ROUND(100.0 * COUNT(*) /\n                 SUM(COUNT(*)) OVER (PARTITION BY member_casual), 2)\n                 AS percent_within_rider_type\n        FROM trips_clean\n        GROUP BY member_casual, rideable_type\n        ORDER BY member_casual, trips DESC\n    """,\n    "6. START HOUR": """\n        SELECT member_casual, start_hour, COUNT(*) AS trips\n        FROM trips_clean\n        GROUP BY member_casual, start_hour\n        ORDER BY member_casual, start_hour\n    """\n}\n\nfor title, sql in queries.items():\n    print(f"\n--- {title} ---")\n    print(con.execute(sql).fetchdf().to_string(index=False))\n\ncon.close()\nPY\n
  198  python3 - <<'PY'\nimport duckdb\nfrom pathlib import Path\n\ndb_path = Path.home() / "Downloads/Cyclistic_Capstone/cyclistic.duckdb"\nout_dir = Path.home() / "Downloads/Cyclistic_Capstone/analysis_outputs"\nout_dir.mkdir(parents=True, exist_ok=True)\n\ncon = duckdb.connect(str(db_path), read_only=True)\n\nqueries = {\n    "rider_share.csv": """\n        SELECT member_casual, COUNT(*) AS trips\n        FROM trips_clean\n        GROUP BY member_casual\n        ORDER BY member_casual\n    """,\n\n    "duration_by_rider.csv": """\n        SELECT member_casual,\n               COUNT(*) AS trips,\n               ROUND(AVG(ride_length_minutes), 2) AS avg_minutes,\n               ROUND(MEDIAN(ride_length_minutes), 2) AS median_minutes\n        FROM trips_clean\n        WHERE over_24_hours = FALSE\n        GROUP BY member_casual\n        ORDER BY member_casual\n    """,\n\n    "daily_usage.csv": """\n        SELECT member_casual, day_of_week,\n               COUNT(*) AS trips,\n               ROUND(AVG(ride_length_minutes), 2) AS avg_minutes,\n               CASE day_of_week\n                   WHEN 'Monday' THEN 1\n                   WHEN 'Tuesday' THEN 2\n                   WHEN 'Wednesday' THEN 3\n                   WHEN 'Thursday' THEN 4\n                   WHEN 'Friday' THEN 5\n                   WHEN 'Saturday' THEN 6\n                   WHEN 'Sunday' THEN 7\n               END AS day_order\n        FROM trips_clean\n        GROUP BY member_casual, day_of_week\n        ORDER BY day_order, member_casual\n    """,\n\n    "bike_type.csv": """\n        SELECT member_casual, rideable_type,\n               COUNT(*) AS trips\n        FROM trips_clean\n        GROUP BY member_casual, rideable_type\n        ORDER BY member_casual, rideable_type\n    """,\n\n    "hourly_usage.csv": """\n        SELECT member_casual, start_hour,\n               COUNT(*) AS trips\n        FROM trips_clean\n        GROUP BY member_casual, start_hour\n        ORDER BY start_hour, member_casual\n    """,\n\n    "monthly_usage.csv": """\n        SELECT member_casual, ride_month,\n               COUNT(*) AS trips\n        FROM trips_clean\n        GROUP BY member_casual, ride_month\n        ORDER BY ride_month, member_casual\n    """\n}\n\nfor filename, sql in queries.items():\n    df = con.execute(sql).fetchdf()\n    path = out_dir / filename\n    df.to_csv(path, index=False)\n    print(f"Created: {path} ({len(df):,} rows)")\n\ncon.close()\nprint("\nAll six analysis files exported successfully.")\nPY
  199  \npython3 - <<'PY'\nimport duckdb\nimport os\n\nfolder = os.path.expanduser("~/Downloads/Cyclistic_Capstone")\ndb_path = os.path.join(folder, "cyclistic.duckdb")\ncsv_path = os.path.join(folder, "bike_type_preference.csv")\n\ncon = duckdb.connect(db_path, read_only=True)\n\ncon.execute(f"""\nCOPY (\n    SELECT\n        rideable_type AS "Rideable Type",\n        member_casual AS "Member Casual",\n        COUNT(*) AS Trips\n    FROM trips_clean\n    GROUP BY rideable_type, member_casual\n    ORDER BY rideable_type, member_casual\n)\nTO '{csv_path}' (HEADER, DELIMITER ',')\n""")\n\nprint("CSV created:", csv_path)\nprint(con.execute("""\n    SELECT rideable_type, member_casual, COUNT(*) AS trips\n    FROM trips_clean\n    GROUP BY rideable_type, member_casual\n    ORDER BY rideable_type, member_casual\n""").fetchdf().to_string(index=False))\n\ncon.close()\nPY\n
  200  python3 - <<'PY'\nimport duckdb\nimport os\n\nfolder = os.path.expanduser("~/Downloads/Cyclistic_Capstone")\ndb_path = os.path.join(folder, "cyclistic.duckdb")\ncsv_path = os.path.join(folder, "hourly_usage.csv")\n\ncon = duckdb.connect(db_path, read_only=True)\n\nquery = """\nSELECT\n    start_hour AS "Start Hour",\n    member_casual AS "Member Casual",\n    COUNT(*) AS Trips\nFROM trips_clean\nGROUP BY start_hour, member_casual\nORDER BY start_hour, member_casual\n"""\n\ndf = con.execute(query).fetchdf()\ndf.to_csv(csv_path, index=False)\ncon.close()\n\nprint("Hourly dataset created successfully.")\nprint(f"Rows: {len(df)}")\nprint(f"Saved to: {csv_path}")\nprint(df.head(6).to_string(index=False))\nPY
  201  python3 - <<'PY'\nimport duckdb\nimport os\n\nfolder = os.path.expanduser("~/Downloads/Cyclistic_Capstone")\ndb_path = os.path.join(folder, "cyclistic.duckdb")\noutput_path = os.path.join(folder, "duration_by_rider_no_outliers.csv")\n\ncon = duckdb.connect(db_path, read_only=True)\n\nquery = """\nSELECT\n    member_casual AS "Member Casual",\n    ROUND(AVG(ride_length_minutes), 2) AS "Avg Minutes",\n    ROUND(MEDIAN(ride_length_minutes), 2) AS "Median Minutes",\n    COUNT(*) AS "Trips"\nFROM trips_clean\nWHERE over_24_hours = FALSE\nGROUP BY member_casual\nORDER BY member_casual\n"""\n\nresult = con.execute(query).fetchdf()\nprint("\nRide duration excluding rides over 24 hours:\n")\nprint(result.to_string(index=False))\n\nresult.to_csv(output_path, index=False)\nprint(f"\nSaved comparison file to:\n{output_path}")\n\ncon.close()\nPY
  202  python3 - <<'PY'\nimport duckdb\n\ndb = duckdb.connect(\n    '~/Downloads/Cyclistic_Capstone/cyclistic.duckdb',\n    read_only=True\n)\n\nresult = db.execute("""\n    SELECT\n        member_casual AS rider_type,\n        ROUND(AVG(ride_length_minutes), 2) AS avg_minutes,\n        ROUND(MEDIAN(ride_length_minutes), 2) AS median_minutes,\n        COUNT(*) AS trips\n    FROM trips_clean\n    WHERE over_24_hours = FALSE\n    GROUP BY member_casual\n    ORDER BY member_casual\n""").fetchdf()\n\nprint("\\nRide duration excluding rides over 24 hours:")\nprint(result.to_string(index=False))\n\ndb.close()\nPY
  203  python3 - <<'PY'\nimport duckdb\n\ndb = duckdb.connect(\n    '~/Downloads/Cyclistic_Capstone/cyclistic.duckdb',\n    read_only=True\n)\n\nresult = db.execute("""\n    SELECT\n        member_casual AS rider_type,\n        ROUND(AVG(ride_length_minutes), 2) AS avg_including_all,\n        ROUND(AVG(ride_length_minutes)\n            FILTER (WHERE over_24_hours = FALSE), 2)\n            AS avg_excluding_long_rides,\n        COUNT(*) AS all_trips,\n        COUNT(*) FILTER (WHERE over_24_hours = FALSE)\n            AS trips_excluding_long_rides\n    FROM trips_clean\n    GROUP BY member_casual\n    ORDER BY member_casual\n""").fetchdf()\n\nprint(result.to_string(index=False))\ndb.close()\nPY
  205  python3 -c "import duckdb; con=duckdb.connect('cyclistic.duckdb', read_only=True); print(con.execute('SHOW TABLES').fetchdf().to_string(index=False)); con.close()"
  206  history 2000 | grep -iE 'duckdb|CREATE TABLE|SELECT|COPY|read_csv|GROUP BY' | tail -40
tahaadnan@Tahas-MacAir Cyclistic_Capstone % ls -lh ~/Downloads/Cyclistic_Capstone/analysis_outputs
total 64
-rw-r--r--@ 1 tahaadnan  staff   147B Nov 17 22:02 bike_type_preference.csv
-rw-r--r--  1 tahaadnan  staff   147B Nov 17 21:25 bike_type.csv
-rw-r--r--@ 1 tahaadnan  staff   475B Nov 17 21:25 daily_usage.csv
-rw-r--r--  1 tahaadnan  staff    99B Nov 18 13:23 duration_by_rider_no_outliers.csv
-rw-r--r--@ 1 tahaadnan  staff    99B Nov 17 21:25 duration_by_rider.csv
-rw-r--r--@ 1 tahaadnan  staff   803B Nov 17 22:14 hourly_usage.csv
-rw-r--r--  1 tahaadnan  staff   554B Nov 17 21:25 monthly_usage.csv
-rw-r--r--@ 1 tahaadnan  staff    50B Nov 17 21:25 rider_share.csv
tahaadnan@Tahas-MacAir Cyclistic_Capstone % mkdir -p ~/Downloads/Cyclistic_Capstone/sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               
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
SQL
tahaadnan@Tahas-MacAir Cyclistic_Capstone % ls -lh ~/Downloads/Cyclistic_Capstone/sql
total 8
-rw-r--r--  1 tahaadnan  staff   1.5K Nov 18 16:53 01_data_cleaning.sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               
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
SQL

tahaadnan@Tahas-MacAir Cyclistic_Capstone % ls -lh ~/Downloads/Cyclistic_Capstone/sql
total 16
-rw-r--r--  1 tahaadnan  staff   1.5K Nov 18 16:53 01_data_cleaning.sql
-rw-r--r--  1 tahaadnan  staff   2.0K Nov 18 16:54 02_data_analysis.sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               
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
SQL

tahaadnan@Tahas-MacAir Cyclistic_Capstone % ls -lh ~/Downloads/Cyclistic_Capstone/sql
total 24
-rw-r--r--  1 tahaadnan  staff   1.5K Nov 18 16:53 01_data_cleaning.sql
-rw-r--r--  1 tahaadnan  staff   2.0K Nov 18 16:54 02_data_analysis.sql
-rw-r--r--  1 tahaadnan  staff   1.5K Nov 18 16:55 03_data_quality_checks.sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               
    cleaned = []
    for statement in statements:
        lines = [
            line for line in statement.splitlines()
            if not line.strip().startswith("--")
        ]
        statement = "\n".join(lines).strip()
        if statement:
            cleaned.append(statement)

    for i, statement in enumerate(cleaned, 1):
        try:
            con.execute(statement)
            print(f"  Query {i}: PASS")
        except Exception as e:
            print(f"  Query {i}: FAIL")
            print(f"  {e}")
            raise

con.close()
print("\nQuality checks and analysis tests completed.")
PY


Testing 03_data_quality_checks.sql...

Testing 02_data_analysis.sql...

Quality checks and analysis tests completed.
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               

folder = Path.home() / "Downloads/Cyclistic_Capstone"
db_path = folder / "cyclistic.duckdb"
sql_path = folder / "sql" / "01_data_cleaning.sql"

con = duckdb.connect(":memory:")
con.execute(
    "ATTACH ? AS source (READ_ONLY)",
    [str(db_path)]
)

script = sql_path.read_text()
script = script.replace("FROM trips_raw", "FROM source.trips_raw")

print("Testing cleaning script in temporary database...")
results = con.execute(script).fetchdf()
print("\nCleaning summary:")
print(results.to_string(index=False))

con.close()
print("\nCleaning script test completed.")
PY

Testing cleaning script in temporary database...

Cleaning summary:
 raw_rows  clean_rows  excluded_rows  rides_over_24_hours
  6294451     6294259            192                 5128

Cleaning script test completed.
tahaadnan@Tahas-MacAir Cyclistic_Capstone % find ~/Downloads/Cyclistic_Capstone/Extracted_CSVs -type f -name '*.csv' | head -15
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202511-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202610-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202603-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202512-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202608-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202605-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202606-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202607-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/__MACOSX/._202501-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202609-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202604-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202602-divvy-tripdata.csv
/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202601-divvy-tripdata.csv
tahaadnan@Tahas-MacAir Cyclistic_Capstone % find ~/Downloads/Cyclistic_Capstone/Extracted_CSVs \
-maxdepth 1 -type f \
-name '??????-divvy-tripdata.csv' | wc -l
      12
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202603-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202604-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202605-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202606-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202607-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202608-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202609-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202610-divvy-tripdata.csv'
    ],
    union_by_name = true
);

-- Verify the imported row count.
SELECT COUNT(*) AS raw_rows FROM trips_raw;
EOF
tahaadnan@Tahas-MacAir Cyclistic_Capstone % ls -l ~/Downloads/Cyclistic_Capstone/sql/00_import_data.sql
-rw-r--r--  1 tahaadnan  staff  1416 Nov 18 17:28 /Users/tahaadnan/Downloads/Cyclistic_Capstone/sql/00_import_data.sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % cat ~/Downloads/Cyclistic_Capstone/sql/00_import_data.sql
-- Cyclistic Bike-Share Analysis
-- Step 1: Import the 12 monthly CSV files into DuckDB.
-- Run this before 01_data_cleaning.sql.
-- Update the folder path to match your local machine.
-- This replaces trips_raw if it already exists.

CREATE OR REPLACE TABLE trips_raw AS
SELECT *
FROM read_csv_auto(
    [
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202511-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202512-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202601-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202602-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202603-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202604-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202605-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202606-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202607-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202608-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202609-divvy-tripdata.csv',
        '~/Downloads/Cyclistic_Capstone/Extracted_CSVs/202610-divvy-tripdata.csv'
    ],
    union_by_name = true
);

-- Verify the imported row count.
SELECT COUNT(*) AS raw_rows FROM trips_raw;
tahaadnan@Tahas-MacAir Cyclistic_Capstone % open -e ~/Downloads/Cyclistic_Capstone/sql/00_import_data.sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % >....                               
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202603-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202604-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202605-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202606-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202607-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202608-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202609-divvy-tripdata.csv',
        '/Users/tahaadnan/Downloads/Cyclistic_Capstone/Extracted_CSVs/202610-divvy-tripdata.csv'
    ],
    union_by_name = true
);

-- Verify the imported row count.
SELECT COUNT(*) AS raw_rows FROM trips_raw;

zsh: command not found: --
zsh: command not found: --
zsh: command not found: --
zsh: command not found: --
zsh: command not found: CREATE
zsh: command not found: SELECT
zsh: unknown file attribute: \n
zsh: command not found: --
zsh: no matches found: COUNT(*)
tahaadnan@Tahas-MacAir Cyclistic_Capstone % open -e ~/Downloads/Cyclistic_Capstone/sql/00_import_data.sql
tahaadnan@Tahas-MacAir Cyclistic_Capstone % 
