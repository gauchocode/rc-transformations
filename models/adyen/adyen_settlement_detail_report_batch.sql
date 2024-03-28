{{ config(materialized="table") }}

select 


        COALESCE("company_account", '')                             as company_account,
        COALESCE("merchant_account", '')                            as merchant_account, 
        COALESCE("psp_reference", '')                               as psp_reference,
        COALESCE("merchant_reference", '')                          as merchant_reference,
        COALESCE("payment_method", '')                              as payment_method,
        to_timestamp("creation_date", 'YYYY-MM-DD"T"HH24:MI:SS')    as creation_date,
        CAST("creation_date_trunc" as DATE)                         as creation_date_trunc,
        COALESCE("timezone", '')                                    as timezone,
        COALESCE("type", '')                                        as type,
        COALESCE("modification_reference", '')                      as modification_reference,
        COALESCE("gross_currency", '')                              as gross_currency,
        COALESCE("gross_debit_gc", 0)                               as gross_debit_gc,
        COALESCE("gross_credit_gc", 0)                              as gross_credit_gc,
        COALESCE("exchange_rate", 0)                                as exchange_rate,
        COALESCE("net_currency", '')                                as net_currency,
        COALESCE("net_debit_nc", 0)                                 as net_debit_nc,
        COALESCE("net_credit_nc", 0)                                as net_credit_nc,
        COALESCE("commission_nc", 0)                                as commission_nc,
        COALESCE("markup_nc", 0)                                    as markup_nc,
        COALESCE("scheme_fees_nc", 0)                               as scheme_fees_nc,
        COALESCE("interchange_nc", 0)                               as interchange_nc,  
        COALESCE("payment_method_variant", '')                      as payment_method_variant,
        COALESCE("modification_merchant_reference", '')             as modification_merchant_reference,
        COALESCE("batch_number", 0)                                 as batch_number,
        COALESCE("reserved4", '')                                   as reserved4,
        COALESCE("reserved5", '')                                   as reserved5,
        COALESCE("reserved6", '')                                   as reserved6,
        COALESCE("reserved7", '')                                   as reserved7,
        COALESCE("reserved8", '')                                   as reserved8,
        COALESCE("reserved9", '')                                   as reserved9,
        COALESCE("reserved10", '')                                  as reserved10,
        COALESCE("payment_fees_nc", 0)                              as payment_fees_nc,
        COALESCE("issuer_country", '')                              as issuer_country

from public.adyen_settlement_detail_report_batch