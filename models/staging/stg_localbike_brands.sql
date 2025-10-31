select
    brand_id AS brand_id,
    brand_name AS brand_name
from {{ source('LocalBike', 'brands') }}