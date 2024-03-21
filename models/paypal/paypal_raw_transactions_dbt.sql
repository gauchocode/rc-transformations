{{ config(materialized="table" ) }}

with payer_info_json as (
    select 
        payer_info->>'account_id' as account_id
    from pp_transactions
)

select 
    (
        select * from payer_info_json
    ),
    transaction_id            as transaccion
from pp_transactions;