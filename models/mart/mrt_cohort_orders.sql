WITH cohort_base AS (
    SELECT 
        cohort_year,
        cohort_month,
        month_offset,
        revenue,
        active_customers
    FROM {{ ref('int_localbike_orders_with_cohort') }}
),
--
-- Récupération du nombre de clients de la cohorte initiale (mois 0)
first_month_customers AS (
    SELECT
        cohort_year,
        cohort_month,
        active_customers AS first_month_customers
    FROM cohort_base
    WHERE month_offset = 0
)
--
-- Jointure pour calculer le taux de rétention
SELECT
    b.cohort_year,
    b.cohort_month,
    CONCAT(b.cohort_year, '-', LPAD(CAST(b.cohort_month AS STRING), 2, '0')) AS cohort_label,
    b.month_offset,
    CAST(b.month_offset AS STRING) AS month_offset_label,
    CAST(b.revenue AS NUMERIC) AS revenue,
    CAST(b.active_customers AS INTEGER) AS active_customers,
    f.first_month_customers,
    CAST(SAFE_DIVIDE(b.active_customers, f.first_month_customers) AS NUMERIC) AS retention_rate
FROM cohort_base b
LEFT JOIN first_month_customers f
  ON b.cohort_year = f.cohort_year
 AND b.cohort_month = f.cohort_month
ORDER BY b.cohort_year, b.cohort_month, b.month_offset