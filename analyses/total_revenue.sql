WITH payments as (
    SELECT * FROM {{ ref('stg_stripe__payments') }}
)
, aggregated as (
    SELECT SUM(payment_amount) as total_revenue
    FROM payments
    WHERE PAYMENT_STATUS = 'success'
)
SELECT 
    * 
FROM 
    aggregated
   