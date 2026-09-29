-- =============================================
-- Bank Customer Churn Analysis - SQL Queries
-- =============================================

-- 1. Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customers;


-- 2. Churn Rate by Geography
SELECT 
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY Geography
ORDER BY churn_rate_percent DESC;


-- 3. Churn Rate by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN '18-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY age_group
ORDER BY churn_rate_percent DESC;


-- 4. Churn Rate by Number of Products
SELECT 
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY NumOfProducts
ORDER BY churn_rate_percent DESC;


-- 5. Churn Rate by Active vs Inactive Members
SELECT 
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY IsActiveMember
ORDER BY churn_rate_percent DESC;


-- 6. Churn Rate by Balance Range
SELECT 
    CASE 
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance BETWEEN 0.01 AND 50000 THEN 'Low (0-50K)'
        WHEN Balance BETWEEN 50000.01 AND 100000 THEN 'Medium (50K-100K)'
        WHEN Balance BETWEEN 100000.01 AND 150000 THEN 'High (100K-150K)'
        ELSE 'Very High (150K+)'
    END AS balance_range,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY balance_range
ORDER BY churn_rate_percent DESC;