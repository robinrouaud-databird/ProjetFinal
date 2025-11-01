-- revenue by brand
SELECT 
    products.brand_id, 
    SUM(order_item_amount) AS total_revenue_brand
FROM {{ ref('stg_localbike_order_items') }} order_items
INNER JOIN {{ ref('stg_localbike_products') }} products 
      ON order_items.product_id = products.product_id
INNER JOIN {{ ref('stg_localbike_brands') }} brands 
      ON products.brand_id = brands.brand_id
GROUP BY products.brand_id