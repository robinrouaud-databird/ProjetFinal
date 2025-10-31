select 
    order_id AS order_id,
    item_id AS item_id,
    product_id AS product_id,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(list_price AS NUMERIC) AS list_price,
    CAST(discount AS NUMERIC) AS discount
from {{ source('LocalBike', 'order_items') }}