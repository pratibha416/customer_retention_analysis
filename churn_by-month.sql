WITH base AS (
  SELECT 
    c.customer_id,
    DATE_FORMAT(c.signup_date, '%Y-%m') AS signup_month,
    GREATEST(
      IFNULL(MAX(o.order_date), '1900-01-01'),
      IFNULL(MAX(l.login_date), '1900-01-01')
    ) AS last_active_date
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  LEFT JOIN logins l ON c.customer_id = l.customer_id
  GROUP BY c.customer_id, c.signup_date
),

labeled AS (
  SELECT *,
    DATEDIFF('2022-05-01', last_active_date) AS days_inactive,
    CASE 
      WHEN DATEDIFF('2022-05-01', last_active_date) > 60 THEN 1 ELSE 0 
    END AS churned
  FROM base
)

SELECT 
  signup_month,
  COUNT(*) AS total_customers,
  SUM(churned) AS churned_customers,
  ROUND(100.0 * SUM(churned) / COUNT(*), 2) AS churn_rate_percent
FROM labeled
GROUP BY signup_month
ORDER BY signup_month;
