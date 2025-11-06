SELECT 
    product_name,
    model_year,
    coalesce(volume_sales_product, 0) AS volume_sales_product,
    coalesce(total_revenue_product, 0) AS total_revenue_product,
    coalesce(total_discount_product, 0) AS total_discount_product,
    total_revenue_entreprise AS total_revenue_entreprise,
    volume_sales_entreprise,
    stock_product, 
    CAST(average_stock AS INTEGER) as average_stock
FROM {{ ref('int_localbike_products') }} 
left join {{ ref('int_localbike_stocks') }}
 USING (product_id)