{{ config(materialized="table" ) }}

select 
    'SB'                                                                            as ch,
    transaction_id                                                                  as transaction_id,
    COALESCE(transaction_info->>'invoice_id', '')                                   as invoice_id,
    COALESCE(transaction_info->>'paypal_reference_id', '')                          as paypal_reference_id,
    COALESCE(transaction_info->>'paypal_reference_id_type', '')                     as paypal_reference_id_type,
    transaction_info->'transaction_event_code'                                      as transaction_event_code,
    transaction_info->'transaction_initiation_date'                                 as transaction_initiation_date,
    transaction_info->'transaction_updated_date'                                    as transaction_completion_date,
    COALESCE(ABS(CAST(transaction_info->'transaction_amount'->>'value' as FLOAT), 0))    as gross_transaction_amount,
    COALESCE(transaction_info->'transaction_amount'->>'currency_code', '')          as gross_transaction_currency,
    ABS(CAST(transaction_info->'fee_amount'->>'value' as FLOAT))                        as fee_amount,
    COALESCE(transaction_info->'fee_amount'->>'currency_code', '')                  as fee_currency,
    COALESCE(TRIM(BOTH '"' FROM transaction_info->>'custom_field'), '')             as custom_field,
    COALESCE(TRIM(BOTH '"' FROM transaction_info->>'paypal_account_id'), '')        as customer_id,
    COALESCE(TRIM(BOTH '"' FROM transaction_info->>'bank_reference_id'), '')        as bank_reference_id
from pp_transactions