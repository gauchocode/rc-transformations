{{ config(materialized="table" ) }}

select 
    "transaction_id"        as transaccion
from transactions