# Report for ForestQuery into Global Deforestation, 1990 to 2016

ForestQuery is on a mission to combat deforestation around the world and to raise awareness about how land-use change affects communities and ecosystems. This report uses the supplied World Bank forest-area, land-area, and regional datasets to identify the clearest patterns in global, regional, and country-level forestation between 1990 and 2016.

## 1. Global Situation

In 1990, the world had 41,282,694.90 sq km of forest area. By 2016, that figure had fallen to 39,958,245.90 sq km, a net loss of 1,324,449.00 sq km or 3.21%.

The amount of forest area lost during this period is closest to the 2016 total land area of Peru, which had 1,279,999.99 sq km of land area. That comparison helps frame the decline in more concrete terms: the world effectively lost forest cover on a scale comparable to an entire large country.

## 2. Regional Outlook

In 2016, 31.38% of the world's land area was forested. The highest regional forest share was in Latin America & Caribbean at 46.16%, while the lowest was in Middle East & North Africa at 2.07%.

In 1990, the world forest share was slightly higher at 32.42%. The highest regional forest share was again Latin America & Caribbean at 51.03%, and the lowest was again Middle East & North Africa at 1.78%.

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

The strongest positive outlier in the dataset is China, which increased its forest area by 527,229.06 sq km between 1990 and 2016. The next-largest gain came from Sudan, but its increase of 190,355.29 sq km was far smaller. This suggests ForestQuery can learn from countries that have paired large land bases with sustained reforestation or conservation gains.

When the analysis shifts from absolute change to percent change, the leader is Iceland, which increased forest area by 213.66%. This highlights that smaller countries can deliver dramatic relative gains even when their raw square-kilometer increase is not the largest in the world.

### Largest Concerns

The five countries with the largest absolute decreases in forest area between 1990 and 2016 are shown below.

| Country | Region | Forest Area Decrease |
| --- | --- | ---: |
| Brazil | Latin America & Caribbean | 541,510.00 sq km |
| Indonesia | East Asia & Pacific | 282,193.98 sq km |
| Myanmar | East Asia & Pacific | 107,234.00 sq km |
| Nigeria | Sub-Saharan Africa | 106,506.00 sq km |
| Tanzania | Sub-Saharan Africa | 102,320.00 sq km |

The next table shows the five largest percent decreases in forest area over the same period.

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

| Quartile | Number of Countries |
| --- | ---: |
| 1st quartile (0%-25%) | 96 |
| 2nd quartile (25%-50%) | 72 |
| 3rd quartile (50%-75%) | 38 |
| 4th quartile (>75%) | 9 |

The largest number of countries in 2016 were in the 1st quartile (0%-25%).

There were 9 countries in the top quartile with more than 75% of land designated as forest.

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

ForestQuery should prioritize interventions and partnerships in Brazil, Indonesia, Nigeria, and Tanzania. These countries represent either extremely large absolute losses, severe relative losses, or both.

The regional pattern also argues for sustained attention in Latin America & Caribbean and Sub-Saharan Africa, the only two non-world regions that moved backward over the period. Communications, grantmaking, and local partner support should be concentrated where these regional declines overlap with the most at-risk countries.

At the same time, ForestQuery should study positive cases such as China and Iceland to understand which policy, restoration, and land-management strategies might be adapted elsewhere. Learning from successful reforestation stories is likely to improve the impact of future campaigns.

## 5. Appendix: SQL Queries Used

See `forest_query_analysis.sql` for the complete SQL appendix, including the `forestation` view definition and every query used to answer the project questions.
