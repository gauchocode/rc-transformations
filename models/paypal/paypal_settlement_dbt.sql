{{ config(materialized="table" ) }}

select 
    (
        select payer_info->>'account_id' as account_id
        from paypal_raw_transactions
    ) as transaction_id

from paypal_raw_transactions