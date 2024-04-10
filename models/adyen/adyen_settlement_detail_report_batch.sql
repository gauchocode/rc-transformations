{{ config(materialized="table") }}

select 


        COALESCE("company_account", '')                             as company_account,
        COALESCE("merchant_account", '')                            as merchant_account, 
        COALESCE("psp_reference", '')                               as psp_reference,
        COALESCE("merchant_reference", '')                           as merchant_reference,
        COALESCE("payment_method", '')                              as payment_method,
        to_timestamp("creation_date", 'YYYY-MM-DD"T"HH24:MI:SS')    as creation_date,
        CAST("creation_date" as DATE)                               as creation_date_trunc,
        COALESCE("timezone", '')                                    as timezone,
        COALESCE("type", '')                                        as type,
        COALESCE("modification_reference", '')                      as modification_reference,
        COALESCE("gross_currency", '')                              as gross_currency,
        CAST("gross_debit_gc" as double precision)                  as gross_debit_gc,
        CAST("gross_credit_gc" as double precision)                 as gross_credit_gc,
        CAST("exchange_rate" as double precision)                   as exchange_rate,
        COALESCE("net_currency", '')                                as net_currency,
        CAST("net_debit_nc" as double precision)                    as net_debit_nc,
        CAST("net_credit_nc" as double precision)                   as net_credit_nc,
        CAST("commission_nc" as double precision)                   as commission_nc,
        CAST("markup_nc" as double precision)                       as markup_nc,
        CAST("scheme_fees_nc" as double precision)                  as scheme_fees_nc,
        CAST("interchange_nc" as double precision)                  as interchange_nc,  
        COALESCE("payment_method_variant", '')                      as payment_method_variant,
        COALESCE("modification_merchant_reference", '')             as modification_merchant_reference,
        CAST("batch_number" as bigint)                                as batch_number,
        COALESCE("reserved4", '')                                   as reserved4,
        COALESCE("reserved5", '')                                   as reserved5,
        COALESCE("reserved6", '')                                   as reserved6,
        COALESCE("reserved7", '')                                   as reserved7,
        COALESCE("reserved8", '')                                   as reserved8,
        COALESCE("reserved9", '')                                   as reserved9,
        COALESCE("reserved10", '')                                  as reserved10

from public.adyen_settlement_detail_report_batch