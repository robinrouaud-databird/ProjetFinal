-- revenue by order
with revenue_by_order as (
SELECT 
    order_id,
    SUM(order_item_amount) AS total_amount_order
FROM {{ ref('stg_localbike_order_items') }}
GROUP BY order_id
)
select 
    o.order_id,
    ro.total_amount_order,
    o.customer_id,
    o.order_status,
    o.order_date as order_created_at,
    o.store_id,
    o.staff_id
from {{ ref('stg_localbike_orders') }} o
left join revenue_by_order ro
    on o.order_id = ro.order_id