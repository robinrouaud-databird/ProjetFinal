select 
    customer_id AS customer_id,
    first_name AS first_name,
    last_name AS last_name,
    phone AS phone,
    email AS email,
    street AS street,
    UPPER(city) AS city,
    UPPER(state) AS State ,
    CAST(zip_code AS INTEGER) AS zip_code
from {{ source('LocalBike', 'customers') }}