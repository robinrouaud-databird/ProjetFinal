{% docs int_localbike_products %}

This model provides a summary of products KPIs, focusing on key questions as :

    - Which products are the most sold (in volume and revenue) ?
    - Which categories and brands of products have the highest revenues ?
    - Recent models have highest performances ?
    - Which products have highest performances and high discount ?
    - Which products have highest out of stock rates ?

The metrics are :

    - total_revenue_product : sum of all order items revenues for each order
    - total_discount_product : sum of all discounts for each order
    - total_revenue_entreprise : total sum of all order items revenues for all orders
    - volume_sales : sum of all order items quantities for all orders

It provides a comprehensive view of each product, allowing for easy analysis of product performance.    

{% enddocs %}