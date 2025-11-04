WITH kpi_entreprise AS (
SELECT 
    SUM(order_item_amount) AS total_revenue_entreprise,
    SUM(quantity) AS volume_sales_entreprise
FROM {{ ref('stg_localbike_order_items') }}
) 
,
-- revenue by product
-- add model_year
-- add total discount by product
revenue_by_product AS (
SELECT 
    products.product_id, 
    products.product_name,
    products.model_year,
    SUM(order_item_amount) AS total_revenue_product,
    SUM(quantity) AS volume_sales_product,
    SUM(discount) AS total_discount_product
FROM {{ ref('stg_localbike_products') }} products 
LEFT JOIN {{ ref('stg_localbike_order_items') }} order_items
      ON order_items.product_id = products.product_id
GROUP BY products.product_id, products.model_year, products.product_name
)
Select
    product_id,
    product_name,
    model_year,
    volume_sales_product,
    total_revenue_product,
    total_discount_product,
    total_revenue_entreprise,
    volume_sales_entreprise
from revenue_by_product, kpi_entreprise