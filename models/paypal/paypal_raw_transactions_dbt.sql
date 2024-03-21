{{ config(materialized="table" ) }}

select 
    "transaction_id"        as transaccion_id
from paypal_raw_transactions