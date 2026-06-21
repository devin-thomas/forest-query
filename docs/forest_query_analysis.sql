-- ForestQuery SQL Appendix
-- The queries below assume the three source tables already exist:
--   forest_area(country_code, country_name, year, forest_area_sqkm)
--   land_area(country_code, country_name, year, total_area_sq_mi)
--   regions(country_name, country_code, region, income_group)

CREATE OR REPLACE VIEW forestation AS
SELECT
    fa.country_code,
    fa.country_name,
    fa.year,
    fa.forest_area_sqkm,
    la.total_area_sq_mi,
    r.region,
    r.income_group,
    (fa.forest_area_sqkm / (la.total_area_sq_mi * 2.59)) * 100 AS percent_forest
FROM forest_area AS fa
JOIN land_area AS la
    ON fa.country_code = la.country_code
   AND fa.year = la.year
JOIN regions AS r
    ON fa.country_code = r.country_code;

-- 1a. World forest area in 1990
SELECT
    country_name,
    year,
    forest_area_sqkm
FROM forestation
WHERE country_name = 'World'
  AND year = 1990;

-- 1b. World forest area in 2016
SELECT
    country_name,
    year,
    forest_area_sqkm
FROM forestation
WHERE country_name = 'World'
  AND year = 2016;

-- 1c. Change in world forest area from 1990 to 2016
SELECT
    f1990.forest_area_sqkm AS forest_area_1990,
    f2016.forest_area_sqkm AS forest_area_2016,
    f1990.forest_area_sqkm - f2016.forest_area_sqkm AS forest_area_change_sqkm
FROM forestation AS f1990
JOIN forestation AS f2016
    ON f1990.country_code = f2016.country_code
WHERE f1990.country_name = 'World'
  AND f1990.year = 1990
  AND f2016.year = 2016;

-- 1d. Percent change in world forest area from 1990 to 2016
SELECT
    ROUND(
        ((f1990.forest_area_sqkm - f2016.forest_area_sqkm) / f1990.forest_area_sqkm) * 100,
        2
    ) AS percent_change
FROM forestation AS f1990
JOIN forestation AS f2016
    ON f1990.country_code = f2016.country_code
WHERE f1990.country_name = 'World'
  AND f1990.year = 1990
  AND f2016.year = 2016;

-- 1e. Country whose 2016 total land area is closest to the global forest loss
WITH world_loss AS (
    SELECT
        f1990.forest_area_sqkm - f2016.forest_area_sqkm AS area_lost_sqkm
    FROM forestation AS f1990
    JOIN forestation AS f2016
        ON f1990.country_code = f2016.country_code
    WHERE f1990.country_name = 'World'
      AND f1990.year = 1990
      AND f2016.year = 2016
)
SELECT
    country_name,
    ROUND(total_area_sq_mi * 2.59, 2) AS total_area_sqkm,
    ROUND(ABS((total_area_sq_mi * 2.59) - area_lost_sqkm), 2) AS difference_from_loss
FROM forestation
CROSS JOIN world_loss
WHERE year = 2016
  AND country_name <> 'World'
ORDER BY difference_from_loss
LIMIT 1;

-- 2. Percent forest by region in 1990 and 2016
SELECT
    region,
    ROUND(
        SUM(CASE WHEN year = 1990 THEN forest_area_sqkm END)
        / SUM(CASE WHEN year = 1990 THEN total_area_sq_mi * 2.59 END) * 100,
        2
    ) AS forest_percent_1990,
    ROUND(
        SUM(CASE WHEN year = 2016 THEN forest_area_sqkm END)
        / SUM(CASE WHEN year = 2016 THEN total_area_sq_mi * 2.59 END) * 100,
        2
    ) AS forest_percent_2016
FROM forestation
GROUP BY region
ORDER BY region;

-- 2a. Highest and lowest percent forest in 2016
SELECT
    region,
    ROUND(SUM(forest_area_sqkm) / SUM(total_area_sq_mi * 2.59) * 100, 2) AS forest_percent_2016
FROM forestation
WHERE year = 2016
GROUP BY region
ORDER BY forest_percent_2016 DESC;

-- 2b. Highest and lowest percent forest in 1990
SELECT
    region,
    ROUND(SUM(forest_area_sqkm) / SUM(total_area_sq_mi * 2.59) * 100, 2) AS forest_percent_1990
FROM forestation
WHERE year = 1990
GROUP BY region
ORDER BY forest_percent_1990 DESC;

-- 2c. Regions that decreased in percent forest area from 1990 to 2016
WITH regional_1990 AS (
    SELECT
        region,
        SUM(forest_area_sqkm) / SUM(total_area_sq_mi * 2.59) * 100 AS forest_percent_1990
    FROM forestation
    WHERE year = 1990
    GROUP BY region
),
regional_2016 AS (
    SELECT
        region,
        SUM(forest_area_sqkm) / SUM(total_area_sq_mi * 2.59) * 100 AS forest_percent_2016
    FROM forestation
    WHERE year = 2016
    GROUP BY region
)
SELECT
    r1990.region,
    ROUND(r1990.forest_percent_1990, 2) AS forest_percent_1990,
    ROUND(r2016.forest_percent_2016, 2) AS forest_percent_2016
FROM regional_1990 AS r1990
JOIN regional_2016 AS r2016
    ON r1990.region = r2016.region
WHERE r2016.forest_percent_2016 < r1990.forest_percent_1990
  AND r1990.region <> 'World'
ORDER BY forest_percent_1990 - forest_percent_2016 DESC;

-- 3a. Top 5 countries with the largest decrease in forest area
WITH country_changes AS (
    SELECT
        f1990.country_name,
        f1990.region,
        f1990.forest_area_sqkm AS forest_area_1990,
        f2016.forest_area_sqkm AS forest_area_2016,
        f1990.forest_area_sqkm - f2016.forest_area_sqkm AS decrease_sqkm,
        ROW_NUMBER() OVER (
            ORDER BY f1990.forest_area_sqkm - f2016.forest_area_sqkm DESC, f1990.country_name
        ) AS amount_rank
    FROM forestation AS f1990
    JOIN forestation AS f2016
        ON f1990.country_code = f2016.country_code
    WHERE f1990.year = 1990
      AND f2016.year = 2016
      AND f1990.country_name <> 'World'
)
SELECT
    country_name,
    region,
    ROUND(decrease_sqkm, 2) AS decrease_sqkm
FROM country_changes
WHERE amount_rank <= 5
ORDER BY amount_rank;

-- 3b. Top 5 countries with the largest percent decrease in forest area
WITH country_percent_changes AS (
    SELECT
        f1990.country_name,
        f1990.region,
        ROUND(
            ((f1990.forest_area_sqkm - f2016.forest_area_sqkm) / f1990.forest_area_sqkm) * 100,
            2
        ) AS percent_decrease,
        ROW_NUMBER() OVER (
            ORDER BY ((f1990.forest_area_sqkm - f2016.forest_area_sqkm) / f1990.forest_area_sqkm) DESC,
                     f1990.country_name
        ) AS percent_rank
    FROM forestation AS f1990
    JOIN forestation AS f2016
        ON f1990.country_code = f2016.country_code
    WHERE f1990.year = 1990
      AND f2016.year = 2016
      AND f1990.country_name <> 'World'
      AND f1990.forest_area_sqkm > 0
)
SELECT
    country_name,
    region,
    percent_decrease
FROM country_percent_changes
WHERE percent_rank <= 5
ORDER BY percent_rank;

-- 3c. Countries grouped by 2016 forestation quartile bands
SELECT
    CASE
        WHEN percent_forest <= 25 THEN '1st quartile (0% to 25%)'
        WHEN percent_forest <= 50 THEN '2nd quartile (25% to 50%)'
        WHEN percent_forest <= 75 THEN '3rd quartile (50% to 75%)'
        ELSE '4th quartile (greater than 75%)'
    END AS forest_quartile,
    COUNT(*) AS country_count
FROM forestation
WHERE year = 2016
  AND country_name <> 'World'
  AND percent_forest IS NOT NULL
GROUP BY forest_quartile
ORDER BY country_count DESC;

-- 3d. Countries in the 4th quartile in 2016
SELECT
    country_name,
    region,
    ROUND(percent_forest, 2) AS percent_forest
FROM forestation
WHERE year = 2016
  AND country_name <> 'World'
  AND percent_forest > 75
ORDER BY percent_forest DESC, country_name;

-- 3e. Number of countries with higher forestation than the United States in 2016
SELECT
    COUNT(*) AS countries_above_united_states
FROM forestation
WHERE year = 2016
  AND country_name <> 'World'
  AND percent_forest > (
      SELECT percent_forest
      FROM forestation
      WHERE country_name = 'United States'
        AND year = 2016
  );
