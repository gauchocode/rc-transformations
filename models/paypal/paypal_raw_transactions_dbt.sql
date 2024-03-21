{{ config(materialized="table" ) }}

select 
    pt.transaction_id            							as transaction_id,
    pt.transaction_info->>'invoice_id'						as invoice_id,
    pt.transaction_info->>'paypal_reference_id' 			as paypal_reference_id,
    pt.transaction_info->>'paypal_reference_id_type' 		as paypal_reference_id_type,
    pt.transaction_info->>'transaction_event_code'			as transaction_event_code,
    pt.transaction_info->>'transaction_initiation_date'		as transaction_initiation_date,
    pt.transaction_info->>'transaction_updated_date'		as transaction_completion_date,
    pt.transaction_info->'transaction_amount'->>'value'		as gross_transaction_amount,
    pt.transaction_info->'transaction_amount'->>'currency_code'		as gross_transaction_currency,
    pt.transaction_info->'fee_amount'->>'value'				as fee_amount,
    pt.transaction_info->'fee_amount'->>'currency_code'		as fee_currency,
    pt.transaction_info->'custom_field'						as custom_field,
    pt.transaction_info->'paypal_account_id'				as customer_id    transaction_info->>'invoice_id'             as invoice_id,
    transaction_id                              as transaction_id,
    pt.transaction_info->>'paypal_reference_id' as paypal_reference_id
from pp_transactions;