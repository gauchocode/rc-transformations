{{ config(materialized="table" ) }}

select 
    "payer_info->>account_id"   as account_id,
    "transaction_id"            as transaccion
from transactions