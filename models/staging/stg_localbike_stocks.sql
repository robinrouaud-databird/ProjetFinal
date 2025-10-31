select
    store_id AS store_id,
    product_id as product_id,
    CAST(quantity AS INTEGER) AS quantity
from {{ source('LocalBike', 'stocks') }}