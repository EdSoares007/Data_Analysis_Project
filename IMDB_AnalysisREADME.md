# 2024 IMDB Movies Analysis and Dashboard (using Microsoft Excel)

## Project objective
This project was set out to demonstrate my capabilities in cleaning and exploring data, as well as generating dashboards while relying solely on Microsoft Excel.
For this exercise, an imaginary film executive tasked me in answering some KPIs for future movie developments.

## Dataset used
- <a href="https://github.com/EdSoares007/Data_Analysis_Project/blob/main/IMDB_Analysis.xlsx">Dataset</a>

## Questions (KPIs)
- What was the release timeline?
- What is the correlation between the country where the movie was created and its revenue?
- What was the month with the highest Return on Investment (ROI)?
- How is the rating distribution?
- Does a movie with a long runtime tend to have higher revenue?

## Process
### Cleaning
- Removal of duplicates: No duplicates were found.
- Highlighting of missing values.
- Truncation of the Homepage column values: Only the unique code of the page remained.
- Deletion of unnecessary data for analysis: Columns Tagline, Storyline, and Overview.
- Conversion of relevant data to numeric values: Columns Vote_Count, Budget, and Revenue.
- Remodeling of date values in the Release_Date column.

### Pivot Tables creation
By using Pivot Tables, the KPIs were addressed.
With each Pivot Table, a chart was created for smoother analysis and to further assemble into the final dashboard.

## Dashboard
![IMDB_Dashboard](https://github.com/EdSoares007/Data_Analysis_Project/blob/main/IMDB_Dashboard.png)

## Project Insights
- Despite an increase in releases each month, the ROI was below expectations.
- February 2024 was the month with the highest ROI on average, though the fourth quarter as a whole had a greater ROI.
- Due to its high volume of movies in this dataset, the US was by far the country that demonstrated a great ROI.
- As expected, movies with higher ratings generated greater ROI.
- The majority of movies released in 2024 were classified with a rating between 7 and 8.
- Two sets of runtimes indicated a higher ROI: Movies around 45 minutes and 195 minutes.

## Conclusion
Based on the results of this analysis, as a business venture, for a higher return on initial investment when creating a movie, one should aim to release it in the fourth quarter of the year. It should also be noted that the ideal runtime should be either 45 or 195 minutes.
Additionally, this dataset was highly focused on movies originating from the United States.
