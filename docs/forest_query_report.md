# Report for ForestQuery into Global Deforestation, 1990 to 2016

ForestQuery is on a mission to combat deforestation around the world and to raise awareness about how land-use change affects communities and ecosystems. This report uses the supplied World Bank forest-area, land-area, and regional datasets to identify the clearest patterns in global, regional, and country-level forestation between 1990 and 2016.

## 1. Global Situation

In 1990, the world had 41,282,694.90 sq km of forest area. By 2016, that figure had fallen to 39,958,245.90 sq km, a net loss of 1,324,449.00 sq km or 3.21%.

The amount of forest area lost during this period is closest to the 2016 total land area of Peru, which had 1,279,999.99 sq km of land area. That comparison helps frame the decline in more concrete terms: the world effectively lost forest cover on a scale comparable to an entire large country.

## 2. Regional Outlook

In 2016, 31.38% of the world's land area was forested. The highest regional forest share was in Latin America & Caribbean at 46.16%, while the lowest was in Middle East & North Africa at 2.07%.

In 1990, the world forest share was slightly higher at 32.42%. The highest regional forest share was again Latin America & Caribbean at 51.03%, and the lowest was again Middle East & North Africa at 1.78%.

**Table 2.1. Percent Forest Area by Region, 1990 and 2016**

| Region | 1990 Forest Percentage | 2016 Forest Percentage |
| --- | ---: | ---: |
| East Asia & Pacific | 25.78% | 26.36% |
| Europe & Central Asia | 37.28% | 38.04% |
| Latin America & Caribbean | 51.03% | 46.16% |
| Middle East & North Africa | 1.78% | 2.07% |
| North America | 35.65% | 36.04% |
| South Asia | 16.51% | 17.51% |
| Sub-Saharan Africa | 30.67% | 28.79% |
| World | 32.42% | 31.38% |

Only two non-world regions saw their forest share decline from 1990 to 2016: Latin America & Caribbean fell from 51.03% to 46.16%, and Sub-Saharan Africa fell from 30.67% to 28.79%. Every other region increased slightly, but those gains were not large enough to offset the declines in these two regions, so the world total still fell from 32.42% to 31.38%.

## 3. Country-Level Detail

### Success Stories

There is one particularly bright spot in the data at the country level: China. It increased forest area by 527,229.06 sq km between 1990 and 2016. The next-largest gain came from Sudan, but that increase of 190,355.29 sq km was much smaller, which makes China's improvement stand out even among the world's largest countries.

China and Sudan are both large countries in total land area, so it is useful to check relative change as well as raw square kilometers. On that basis, Iceland leads the dataset with a 213.66% increase in forest area from 1990 to 2016. ForestQuery should study both kinds of success stories: large-scale gains that move global totals and smaller-country gains that show how quickly policy and restoration changes can compound.

### Largest Concerns

Which countries are seeing deforestation to the largest degree? The first lens is absolute forest loss between 1990 and 2016.

**Table 3.1. Top 5 Amount Decrease in Forest Area by Country, 1990 and 2016**

| Country | Region | Forest Area Decrease |
| --- | --- | ---: |
| Brazil | Latin America & Caribbean | 541,510.00 sq km |
| Indonesia | East Asia & Pacific | 282,193.98 sq km |
| Myanmar | East Asia & Pacific | 107,234.00 sq km |
| Nigeria | Sub-Saharan Africa | 106,506.00 sq km |
| Tanzania | Sub-Saharan Africa | 102,320.00 sq km |

The second lens is percent decrease, which highlights countries where forest loss was severe relative to the country's starting forest base.

**Table 3.2. Top 5 Percent Decrease in Forest Area by Country, 1990 and 2016**

| Country | Region | Pct Forest Area Decrease |
| --- | --- | ---: |
| St. Martin (French part) | Latin America & Caribbean | 100.00% |
| Togo | Sub-Saharan Africa | 75.45% |
| Nigeria | Sub-Saharan Africa | 61.80% |
| Uganda | Sub-Saharan Africa | 59.13% |
| Mauritania | Sub-Saharan Africa | 46.75% |

Four of the top five countries by percent forest loss are in Sub-Saharan Africa: Togo, Nigeria, Uganda, and Mauritania. The fifth is St. Martin (French part) in Latin America & Caribbean.

Nigeria is the only country that appears in the top five for both absolute loss and percent loss. That combination makes it an especially urgent case for ForestQuery because the country is losing forest at scale and at a severe relative rate.

### Quartiles

To understand how forestation was distributed in 2016, countries were grouped into four percentage bands based on their share of land covered by forest.

**Table 3.3. Count of Countries Grouped by Forestation Percent Quartiles, 2016**

| Quartile | Number of Countries |
| --- | ---: |
| 1st quartile (0% to 25%) | 96 |
| 2nd quartile (more than 25% to 50%) | 72 |
| 3rd quartile (more than 50% to 75%) | 38 |
| 4th quartile (more than 75%) | 9 |

The largest number of countries in 2016 were in the 1st quartile (0% to 25%), with 96 countries in that band.

There were 9 countries in the top quartile in 2016. These are the countries with more than 75% of their land area designated as forest.

**Table 3.4. Top-Quartile Countries, 2016**

| Country | Region | Pct Designated as Forest |
| --- | --- | ---: |
| Suriname | Latin America & Caribbean | 98.26% |
| Micronesia, Fed. Sts. | East Asia & Pacific | 91.86% |
| Gabon | Sub-Saharan Africa | 90.04% |
| Seychelles | Sub-Saharan Africa | 88.41% |
| Palau | East Asia & Pacific | 87.61% |
| American Samoa | East Asia & Pacific | 87.50% |
| Guyana | Latin America & Caribbean | 83.90% |
| Lao PDR | East Asia & Pacific | 82.11% |
| Solomon Islands | East Asia & Pacific | 77.86% |

In 2016, 94 countries had a higher forestation percentage than the United States.

## 4. Recommendations

ForestQuery should prioritize interventions and partnerships in Brazil and Indonesia because their absolute forest losses are so large that improvements there would materially affect the global total.

The regional pattern also argues for sustained attention in Latin America & Caribbean and Sub-Saharan Africa, the only two non-world regions that moved backward over the period. Within those regions, countries such as Nigeria, Togo, and Uganda deserve urgent support because the losses are not just large, they are also steep relative to each country's original forest base.

At the same time, ForestQuery should study positive cases such as China and Iceland to understand which policy, restoration, and land-management strategies might be adapted elsewhere. Learning from successful reforestation stories is likely to improve the impact of future campaigns.

## 5. Appendix: SQL Queries Used

```sql
-- ForestQuery SQL Appendix
-- The queries below assume the three source tables already exist:
--   forest_area(country_code, country_name, year, forest_area_sqkm)
--   land_area(country_code, country_name, year, total_area_sq_mi)
--   regions(country_name, country_code, region, income_group)

DROP VIEW IF EXISTS forestation;

CREATE VIEW forestation AS
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
LEFT JOIN land_area AS la
    ON fa.country_code = la.country_code
   AND fa.year = la.year
LEFT JOIN regions AS r
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
INNER JOIN forestation AS f2016
    ON f1990.country_code = f2016.country_code
   AND f2016.year = 2016
WHERE f1990.country_name = 'World'
  AND f1990.year = 1990;

-- 1d. Percent change in world forest area from 1990 to 2016
SELECT
    ROUND(
        ((f1990.forest_area_sqkm - f2016.forest_area_sqkm) / f1990.forest_area_sqkm) * 100,
        2
    ) AS percent_change
FROM forestation AS f1990
INNER JOIN forestation AS f2016
    ON f1990.country_code = f2016.country_code
   AND f2016.year = 2016
WHERE f1990.country_name = 'World'
  AND f1990.year = 1990;

-- 1e. Country whose 2016 total land area is closest to the global forest loss
WITH world_loss AS (
    SELECT
        f1990.forest_area_sqkm - f2016.forest_area_sqkm AS area_lost_sqkm
    FROM forestation AS f1990
    INNER JOIN forestation AS f2016
        ON f1990.country_code = f2016.country_code
       AND f2016.year = 2016
    WHERE f1990.country_name = 'World'
      AND f1990.year = 1990
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
INNER JOIN regional_2016 AS r2016
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
    INNER JOIN forestation AS f2016
        ON f1990.country_code = f2016.country_code
       AND f2016.year = 2016
    WHERE f1990.year = 1990
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
    INNER JOIN forestation AS f2016
        ON f1990.country_code = f2016.country_code
       AND f2016.year = 2016
    WHERE f1990.year = 1990
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
WITH quartile_groups AS (
    SELECT
        CASE
            WHEN percent_forest <= 25 THEN '1st quartile (0% to 25%)'
            WHEN percent_forest <= 50 THEN '2nd quartile (more than 25% to 50%)'
            WHEN percent_forest <= 75 THEN '3rd quartile (more than 50% to 75%)'
            ELSE '4th quartile (more than 75%)'
        END AS forest_quartile,
        CASE
            WHEN percent_forest <= 25 THEN 1
            WHEN percent_forest <= 50 THEN 2
            WHEN percent_forest <= 75 THEN 3
            ELSE 4
        END AS quartile_order,
        country_code
    FROM forestation
    WHERE year = 2016
      AND country_name <> 'World'
      AND percent_forest IS NOT NULL
)
SELECT
    forest_quartile,
    COUNT(DISTINCT country_code) AS country_count
FROM quartile_groups
GROUP BY forest_quartile, quartile_order
ORDER BY quartile_order;

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
```
