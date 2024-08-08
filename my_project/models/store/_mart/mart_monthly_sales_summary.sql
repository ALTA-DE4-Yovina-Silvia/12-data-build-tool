select
    date_trunc('month', order_at) as month,
    brand_id,
    brand_name,
    product_name,  -- Menambahkan product_name
    SUM(order_qty) as total_order_qty,
    sum(unit_sales) as total_unit_sales,
    sum(unit_sales * order_qty) as total_amount
from {{ ref('fct_order_details') }}
group by 1, 2, 3, 4
order by 1, 2, 3
