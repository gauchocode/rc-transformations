{{ config(materialized="table" ) }}

select 
    COALESCE("company_account", '')                 as company_account,
    COALESCE("merchant_account", '')                as merchant_account,
    COALESCE("psp_reference", '')                   as psp_reference,
    COALESCE("merchant_reference", '')              as merchant_reference,
    COALESCE("payment_method", '')                  as payment_method,
    COALESCE("booking_date", '')                    as booking_date,
    CAST("booking_date" as DATE)                    as booking_date_trunc,
    COALESCE("timezone", '')                        as timezone,
    COALESCE("main_currency", '')                   as main_currency ,
    COALESCE("main_amount", 0)                      as main_amount,
<<<<<<< HEAD
    replace('record_type', 'record_type', '')       as record_type,
=======
    COALESCE("record_type", '')                     as record_type,
>>>>>>> 003de55 (Modificaciones lionel abril 17)
    COALESCE("payment_currency", '')                as payment_currency,
    COALESCE("received_pc", 0)                      as received_pc,
    COALESCE("authorised_pc", 0)                    as authorised_pc,
    COALESCE("captured_pc", 0)                      as captured_pc,
    COALESCE("settlement_currency", '')             as settlement_currency,
    COALESCE("payable_sc", 0)                       as payable_sc,
    COALESCE("commission_sc", 0)                    as commission_sc,
    COALESCE("markup_sc", 0)                        as markup_sc,
    COALESCE("scheme_fees_sc", 0)                   as scheme_fees_sc,
    COALESCE("interchange_sc", 0)                   as interchange_sc,
    COALESCE("processing_fee_currency", '')         as processing_fee_currency,
    COALESCE("processing_fee_fc", 0)                as processing_fee_fc,
    COALESCE("user_name", '')                       as user_name,
    COALESCE("payment_method_variant", '')          as payment_method_variant,
    COALESCE("modification_merchant_reference", '') as modification_merchant_reference,
    COALESCE("reserved3", '')                       as reserved3,
    COALESCE("reserved4", '')                       as reserved4,
    COALESCE("reserved5", '')                       as reserved5,
    COALESCE("reserved6", '')                       as reserved6,
    COALESCE("reserved7", '')                       as reserved7,
    COALESCE("reserved8", '')                       as reserved8,
    COALESCE("reserved9", '')                       as reserved9,
    COALESCE("reserved10", '')                      as reserved10
from adyen_payments_accounting_report