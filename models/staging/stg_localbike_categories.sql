select 
    category_id AS category_id,
    category_name AS category_name
from {{ source('LocalBike', 'categories') }}