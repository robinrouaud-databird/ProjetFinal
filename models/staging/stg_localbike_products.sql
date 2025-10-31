select
	product_id AS product_id,
	product_name AS product_name, 
	brand_id AS brand_id,
	category_id AS category_id,
	CAST(model_year AS INTEGER) AS model_year,
	CAST(list_price AS NUMERIC) AS list_price
from {{ source('LocalBike', 'products') }}