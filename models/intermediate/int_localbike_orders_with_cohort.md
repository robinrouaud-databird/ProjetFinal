{% docs int_localbike_orders_with_cohort %}

This model provides the informations for the creation of cohort report on orders
and the retention of customers with time

The main metrics are :

    - cohort year and cohort month : group clients by their first order
    - month_offset : delay between the first order of the client and his second
    - revenue : total of the order amounts passed by customers of a cohort

{% enddocs %}