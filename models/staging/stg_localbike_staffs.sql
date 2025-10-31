select
	staff_id AS staff_id,
	first_name AS first_name,
	last_name AS last_name,
	email AS email,
	phone AS phone,
	CAST(active AS INTEGER) AS active,
	store_id AS store_id,
	manager_id AS manager_id
from {{ source('LocalBike', 'staffs') }}