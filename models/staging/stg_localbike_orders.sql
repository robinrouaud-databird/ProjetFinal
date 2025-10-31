select
	order_id AS order_id,
	customer_id AS customer_id,
	CAST(order_status AS INTEGER) AS order_status,
	CAST(order_date AS DATE) AS order_date,
	CAST(required_date AS DATE) AS required_date,
	shipped_date AS shipped_date,
	store_id AS store_id,
	staff_id AS staff_id
from {{ source('LocalBike', 'orders') }}