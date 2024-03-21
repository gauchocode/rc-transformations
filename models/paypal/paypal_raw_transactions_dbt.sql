{{ config(materialized="table" ) }}

select 
    "payer_info"              as payer,
    "transaction_id"        as transaccion
from transactions