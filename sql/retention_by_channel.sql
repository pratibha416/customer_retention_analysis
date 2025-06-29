SELECT 
  c.channel,
  COUNT(*) AS total_customers,
  SUM(
    CASE 
      WHEN DATEDIFF('2022-04-01', GREATEST(
        IFNULL(o.order_date, '1900-01-01'),
        IFNULL(l.login_date, '1900-01-01')
      )) <= 60 THEN 1 ELSE 0 
    END
  ) AS retained_customers,
  ROUND(
    100.0 * SUM(CASE 
      WHEN DATEDIFF('2022-04-01', GREATEST(
        IFNULL(o.order_date, '1900-01-01'),
        IFNULL(l.login_date, '1900-01-01')
      )) <= 60 THEN 1 ELSE 0 
    END) / COUNT(*), 2
  ) AS retention_rate_percent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN logins l ON c.customer_id = l.customer_id
GROUP BY c.channel;
