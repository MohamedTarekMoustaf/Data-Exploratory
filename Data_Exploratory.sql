-- Exploratory Data Analysis
SELECT * FROM layoffs_stagging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off) FROM layoffs_stagging2;

SELECT * FROM layoffs_stagging2 
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT * FROM layoffs_stagging2 
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off) FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) FROM layoffs_stagging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT MIN(date), MAX(date) FROM layoffs_stagging2;

SELECT date, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY date
ORDER BY 2 DESC;

SELECT date, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY date
ORDER BY 1 DESC;

SELECT YEAR(date) AS YEARS, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY YEARS
HAVING YEARS IS NOT NULL
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY stage
HAVING stage IS NOT NULL
ORDER BY 2 DESC;

SELECT Year(date) AS YEARS, avg(percentage_laid_off)
FROM layoffs_stagging2
GROUP BY YEARS
HAVING YEARS IS NOT NULL
ORDER BY YEARS DESC;

SELECT date, YEAR(date) AS YEARS, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY YEARS
HAVING YEARS IS NOT NULL
ORDER BY 1 DESC;

SELECT DATE_FORMAT(`date`,'%Y-%m') AS `YEAR/MONTH`, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY `YEAR/MONTH`
HAVING `YEAR/MONTH` IS NOT NULL
ORDER BY 1;

-- Calculating the accumulative summation of total_laid_off for each month per year
SELECT *, SUM(TOTAL_LAID_OFFS) OVER (ORDER BY `YEAR/MONTH`)
AS ACCUMULATIVE_SUM
FROM (SELECT DATE_FORMAT(`date`,'%Y-%m') AS `YEAR/MONTH`, SUM(total_laid_off) AS TOTAL_LAID_OFFS
FROM layoffs_stagging2
GROUP BY `YEAR/MONTH`
HAVING `YEAR/MONTH` IS NOT NULL
ORDER BY 1) AS T1;

-- Total_laid_off per company per year
SELECT company, YEAR(`date`) AS YEARS, SUM(total_laid_off) AS TOTAL_LAID_OFFS
FROM layoffs_stagging2
GROUP BY company, YEARS
HAVING YEARS IS NOT NULL AND company IS NOT NULL AND TOTAL_LAID_OFFS IS NOT NULL 
ORDER BY 3 DESC;

-- RANKING TOTAL_LAID_OFFS in Ascending Order  
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY TOTAL_LAID_OFFS DESC) AS RANKING
FROM (SELECT company, YEAR(`date`) AS YEARS, SUM(total_laid_off) AS TOTAL_LAID_OFFS
FROM layoffs_stagging2
GROUP BY company, YEARS
HAVING YEARS IS NOT NULL AND company IS NOT NULL AND TOTAL_LAID_OFFS IS NOT NULL 
ORDER BY 3 DESC) AS T1
ORDER BY RANKING ASC;








