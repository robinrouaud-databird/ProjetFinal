select
    store_id AS store_id,
    store_name AS store_name,
    phone AS phone,
    email AS email,
    street AS street,
    UPPER(city) AS city,
    UPPER(state) AS state,
    CAST(zip_code AS INTEGER) AS zip_code
from {{ source('LocalBike', 'stores') }}