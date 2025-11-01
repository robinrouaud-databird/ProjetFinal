WITH kpi_entreprise AS (
SELECT 
    SUM(order_item_amount) AS total_revenue_entreprise,
    SUM(quantity) AS volume_sales
FROM {{ ref('stg_localbike_order_items') }}
) 
,
-- revenue by product
-- add model_year
-- add total discount by product
revenue_by_product AS (
SELECT 
    order_items.product_id, 
    products.model_year,
    SUM(order_item_amount) AS total_revenue_product,
    SUM(discount) AS total_discount_product
FROM {{ ref('stg_localbike_order_items') }} order_items
INNER JOIN {{ ref('stg_localbike_products') }} products 
      ON order_items.product_id = products.product_id
GROUP BY order_items.product_id, products.model_year
)
Select
    product_id,
    model_year,
    total_revenue_product,
    total_discount_product,
    total_revenue_entreprise,
    volume_sales
from revenue_by_product, kpi_entreprise