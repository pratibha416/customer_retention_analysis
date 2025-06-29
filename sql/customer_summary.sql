WITH customer_summary AS (
  SELECT 
    c.customer_id,
    c.signup_date,
    c.channel,
    IFNULL(SUM(o.amount), 0) AS total_revenue,
    COUNT(o.order_id) AS total_orders,
    ROUND(IFNULL(AVG(o.amount), 0), 2) AS avg_order_value,
    GREATEST(
      IFNULL(MAX(o.order_date), NULL),
      IFNULL(MAX(l.login_date), NULL)
    ) AS last_active_date
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  LEFT JOIN logins l ON c.customer_id = l.customer_id
  GROUP BY c.customer_id, c.signup_date, c.channel
)

SELECT 
  customer_id,
  signup_date,
  channel,
  total_revenue,
  total_orders,
  avg_order_value,
  CASE 
    WHEN last_active_date IS NOT NULL THEN DATEDIFF(last_active_date, signup_date)
    ELSE NULL
  END AS customer_lifetime_days,
  CASE 
    WHEN last_active_date IS NULL THEN 'Churned'
    WHEN DATEDIFF(last_active_date, signup_date) < 30 THEN 'Churned'
    ELSE 'Active'
  END AS churn_status
FROM customer_summary
ORDER BY total_revenue DESC;
