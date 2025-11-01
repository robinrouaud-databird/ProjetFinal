--Revenue by store and volume of products sold
--
with revenue_by_store as (
SELECT 
    stores.store_id,
    count(distinct staffs.staff_id) AS nb_staff_by_store,
    SUM(order_item_amount) AS total_revenue_store,
    SUM(order_items.quantity) AS volume_sales_by_store,
    SUM(order_item_amount)
    / (SELECT count(distinct staff_id)
        FROM {{ ref('stg_localbike_staffs') }}
      ) AS revenue_store_by_nb_staff
FROM {{ ref('stg_localbike_order_items') }} order_items
LEFT JOIN {{ ref('stg_localbike_orders') }} orders 
      ON order_items.order_id = orders.order_id
LEFT JOIN {{ ref('stg_localbike_stores') }} stores 
      ON stores.store_id = orders.store_id
LEFT JOIN {{ ref('stg_localbike_staffs') }} staffs 
      ON staffs.store_id = stores.store_id
GROUP BY stores.store_id
)
select
    stores.store_id,
    stores.store_name,
    stores.city,
    stores.state,
    stores.zip_code,
    rs.nb_staff_by_store,
    rs.total_revenue_store,
    rs.volume_sales_by_store,
    rs.revenue_store_by_nb_staff
from {{ ref('stg_localbike_stores') }} stores
inner join revenue_by_store rs 
    on rs.store_id = stores.store_id