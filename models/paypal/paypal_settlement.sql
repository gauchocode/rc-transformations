{{ config(materialized="table" ) }}

select 
    "CH"                                                                                            as ch,
    "Transaction_ID"                                                                                as transaction_id,
    COALESCE("Invoice_ID", '')                                                                      as invoice_id,
    COALESCE("PayPal_Reference_ID", '')                                                             as paypal_reference_id,
    COALESCE("PayPal_Reference_ID_Type", '')                                                        as paypal_reference_id_type,
    COALESCE("Transaction_Event_Code", '')                                                          as transaction_event_code,
    "Transaction_Initiation_Date"                                                                   as transaction_initiation_date,
    CAST("Transaction_Initiation_Date" AS DATE)                                                     as transaction_initiation_date_utc,
    "Transaction_Completion_Date"                                                                   as transaction_completion_date,
    CAST("Transaction_Completion_Date" AS DATE)                                                     as transaction_completion_date_utc,
    COALESCE("Transaction_Debit_or_Credit", '')                                                     as transaction_debit_or_credit,
    COALESCE(CAST("Gross_Transaction_Amount"  as double precision), 0)                              as gross_transaction_amount,
    "Gross_Transaction_Currency"                                                                    as gross_transaction_currency,
    "Fee_Debit_or_Credit"                                                                           as fee_debit_or_credit,
    COALESCE(CAST("Fee_Amount" as double precision), 0)                                             as fee_amount,
    COALESCE("Fee_Currency", '')                                                                    as fee_currency,
    COALESCE("Custom_Field", '')                                                                    as custom_field,
    COALESCE("Consumer_ID", '')                                                                     as custumer_id,
    COALESCE("Payment_Tracking_ID", '')                                                             as payment_tracking_id,
    COALESCE("Store_ID", '')                                                                        as store_id,
    COALESCE(CAST("Bank_Reference_ID" as double precision), 0)                                      as bank_reference_id,
    COALESCE("Credit_Transactional_Fee", '')                                                        as credit_transactional_fee,
    COALESCE("Credit_Promotional_Fee", '')                                                          as credit_promotional_fee,
    COALESCE("Credit_Term", '')                                                                     as credit_term
from paypal_settlement