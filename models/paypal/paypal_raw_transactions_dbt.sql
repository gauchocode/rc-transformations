{{ config(materialized="table" ) }}

select 
    (
        select payer_info->'account_id'
        from transaccion
    ) as account_id
    "transaction_id"            as transaccion
from transactions