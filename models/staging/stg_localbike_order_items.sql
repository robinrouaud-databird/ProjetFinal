select 
    order_id AS order_id,
    item_id AS item_id,
    product_id AS product_id,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(list_price AS NUMERIC) AS list_price,
    CAST(discount AS NUMERIC) AS discount,
    quantity * list_price * (1 - discount) AS order_item_amount
from {{ source('LocalBike', 'order_items') }}