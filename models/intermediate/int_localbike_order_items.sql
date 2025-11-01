-- revenue by order

SELECT 
    order_id,
    SUM(order_item_amount) AS total_amount_order
FROM {{ ref('stg_localbike_order_items') }}
GROUP BY order_id
