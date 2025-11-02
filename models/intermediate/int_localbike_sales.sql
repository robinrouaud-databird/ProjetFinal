--
-- Cohorte : time spent after first order by customer 
--
WITH first_order AS (
  SELECT
    customer_id,
    MIN(order_created_at) AS first_order_date
  FROM {{ ref('int_localbike_orders') }}
  GROUP BY customer_id
)
, orders_with_cohort AS (
  SELECT
    o.order_id,
    o.customer_id,
    o.order_created_at,
    f.first_order_date,
    o.total_amount_order,
    EXTRACT(YEAR FROM f.first_order_date) AS cohort_year,
    EXTRACT(MONTH FROM f.first_order_date) AS cohort_month
  FROM {{ ref('int_localbike_orders') }} o
  JOIN first_order f ON o.customer_id = f.customer_id
)
, cohort_analysis AS (
  SELECT
    cohort_year,
    cohort_month,
    DATE_DIFF(o.order_created_at, o.first_order_date, MONTH) AS month_offset,
    o.total_amount_order,
    COUNT(DISTINCT o.customer_id) AS active_customers
  FROM orders_with_cohort o
  GROUP BY cohort_year, cohort_month, month_offset, total_amount_order
)
SELECT 
    cohort_year,
    cohort_month,
    month_offset,
    total_amount_order,
    active_customers
FROM cohort_analysis