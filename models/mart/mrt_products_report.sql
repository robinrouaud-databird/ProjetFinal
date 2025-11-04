SELECT 
    product_name,
    model_year,
    volume_sales_product,
    total_revenue_product,
    total_discount_product,
    total_revenue_entreprise,
    volume_sales_entreprise,
    stock_product, 
    CAST(average_stock AS INTEGER) as average_stock
FROM {{ ref('int_localbike_stocks') }}
left join {{ ref('int_localbike_products') }}
 USING (product_id)