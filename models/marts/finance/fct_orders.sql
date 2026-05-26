WITH payment as (
    SELECT 
        order_id
        , amount 
    FROM 
        {{ ref('stg_stripe__payments') }}
),

orders as (
    SELECT 
        order_id
        , customer_id
    FROM 
        {{ ref('stg_jaffle_shop__orders') }}
)

SELECT 
    order_id
    , customer_id
    , amount    
FROM
    payment 
INNER JOIN 
    orders using (order_id)