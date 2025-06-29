WITH customer_revenue AS (
  SELECT 
    c.customer_id,
    c.channel,
    IFNULL(SUM(o.amount), 0) AS total_revenue
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id, c.channel
)

SELECT 
  channel,
  COUNT(*) AS total_customers,
  ROUND(AVG(total_revenue), 2) AS avg_cltv
FROM customer_revenue
GROUP BY channel
ORDER BY avg_cltv DESC;