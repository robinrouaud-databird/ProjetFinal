--Revenue per staff and insights
--
with revenue_by_staff as (
SELECT 
    staffs.staff_id,
    SUM(order_item_amount) AS total_revenue_staff,
    SUM(order_items.quantity) AS volume_sales_by_staff
FROM {{ ref('stg_localbike_staffs') }} staffs 
LEFT JOIN {{ ref('int_localbike_orders') }} orders 
      ON staffs.staff_id = orders.staff_id
LEFT JOIN {{ ref('stg_localbike_order_items') }} order_items
      ON order_items.order_id = orders.order_id
GROUP BY staffs.staff_id
)
select 
    staffs.staff_id,
    staffs.first_name,
    staffs.last_name,
    staffs.store_id,
    staffs.manager_id,
    rs.total_revenue_staff,
    rs.volume_sales_by_staff
from {{ ref('stg_localbike_staffs') }} staffs
left join revenue_by_staff rs 
on rs.staff_id = staffs.staff_id