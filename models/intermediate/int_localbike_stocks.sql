-- total stock by product
--
with total_stock_product AS (
select 
    product_id, 
    SUM(quantity) AS stock_product
from {{ ref('stg_localbike_stocks') }}
group by product_id
)
,
--
-- Average stock for all products
--
avg_stock_products AS (
select AVG(stock_product) AS average_stock from total_stock_product
)

select 
    products.product_id, 
    products.total_revenue_product, 
    stock_product, 
    average_stock
from {{ ref('stg_localbike_stocks') }} stocks, avg_stock_products
left join {{ ref('int_localbike_products') }} products
  ON stocks.product_id = products.product_id
left join total_stock_product tp on tp.product_id = products.product_id
group by products.product_id, products.total_revenue_product, stock_product, average_stock