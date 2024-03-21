{{ config(materialized="table" ) }}

select 
    "payer_info->>'account_id'" as account_id
from paypal_raw_transactions