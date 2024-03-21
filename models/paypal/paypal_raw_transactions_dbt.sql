{{ config(materialized="table" ) }}

select 
    "payer_id"              as payer,
    "transaction_id"        as transaccion
from transactions