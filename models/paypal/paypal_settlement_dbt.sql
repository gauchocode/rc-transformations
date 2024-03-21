{{ config(materialized="table" ) }}

select 
    (
        select payer_info->>'account_id' as account_id
        from pp_transactions pt;
    ) as transaction_id

from paypal_raw_transaction