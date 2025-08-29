# Data-Exploratory
Layoffs Data Exploration (SQL Project)
📌 Overview

This project performs Exploratory Data Analysis (EDA) on company layoff data using SQL.
It aims to uncover insights into layoffs across companies, countries, industries, and years.

The dataset is stored in a staging table called layoffs_stagging2.
The queries explore layoff patterns, accumulative trends, company rankings, and industry-level breakdowns.

⚙️ Features

The SQL script includes queries for:

✅ Viewing raw layoff data

✅ Identifying maximum layoffs and percentages

✅ Companies and industries with highest layoffs

✅ Layoff distribution by country, stage, and funding

✅ Timeline analysis (daily, monthly, yearly trends)

✅ Accumulative layoffs over time

✅ Company-level layoffs ranked by year

🗂️ Example Queries

Max layoffs & percentages

SELECT MAX(total_laid_off), MAX(percentage_laid_off) 
FROM layoffs_stagging2;


Layoffs per country

SELECT country, SUM(total_laid_off) 
FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC;


Accumulative layoffs per month

SELECT *, SUM(TOTAL_LAID_OFFS) OVER (ORDER BY `YEAR/MONTH`) AS ACCUMULATIVE_SUM
FROM (
    SELECT DATE_FORMAT(`date`,'%Y-%m') AS `YEAR/MONTH`, SUM(total_laid_off) AS TOTAL_LAID_OFFS
    FROM layoffs_stagging2
    GROUP BY `YEAR/MONTH`
    HAVING `YEAR/MONTH` IS NOT NULL
    ORDER BY 1
) AS T1;

📈 Insights

Some of the questions explored:

Which companies had the largest layoffs in a given year?

Which countries and industries were most affected?

How do layoffs trend over time (yearly/monthly)?

What is the accumulative layoff count across the dataset?

🛠️ Tools & Technologies

SQL (MySQL / MariaDB syntax used)

Data Staging for preprocessing

Window Functions for ranking and cumulative analysis

🚀 How to Use

Import your dataset into a SQL database (table: layoffs_stagging2).

Run the queries in Data_Exploratory.sql.

Modify queries as needed for deeper insights.

📬 Author

👤 Muhammad Moustafa

🎓 Electrical Engineer & Data Enthusiast

🌐 Focus on Data Science & Analytics

💼 Exploring automation, analytics, and process optimization
