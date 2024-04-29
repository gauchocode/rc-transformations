{{ config(materialized="table") }}

select 


        COALESCE("company_account", '')                                                                 as company_account,
        COALESCE("merchant_account", '')                                                                as merchant_account, 
        COALESCE("psp_reference", '')                                                                   as psp_reference,
        COALESCE(CAST("merchant_reference" as VARCHAR), '')                                             as merchant_reference,
        COALESCE("payment_method", '')                                                                  as payment_method,
        to_timestamp("creation_date", 'YYYY-MM-DD"T"HH24:MI:SS')                                        as creation_date,
        CAST("creation_date" AS DATE)                                                                   as creation_date_trunc,
        COALESCE("timezone", '')                                                                        as timezone,
        COALESCE("type", '')                                                                            as type,
        COALESCE("modification_reference", '')                                                          as modification_reference,
        COALESCE("gross_currency", '')                                                                  as gross_currency,
        COALESCE(CAST("gross_debit_gc" as double precision), 0)                                         as gross_debit_gc,
        COALESCE(CAST("gross_credit_gc" as double precision), 0)                                        as gross_credit_gc,
        COALESCE(CAST("exchange_rate" as double precision), 0)                                          as exchange_rate,
        COALESCE("net_currency", '')                                                                    as net_currency,
        COALESCE(CAST("net_debit_nc" as double precision), 0)                                           as net_debit_nc,
        COALESCE(CAST("net_credit_nc" as double precision), 0)                                          as net_credit_nc,
        COALESCE(CAST("commission_nc" as double precision), 0)                                          as commission_nc,
        COALESCE(CAST("markup_nc" as double precision), 0)                                              as markup_nc,
        COALESCE(CAST("scheme_fees_nc" as double precision), 0)                                         as scheme_fees_nc,
        COALESCE(CAST("interchange_nc" as double precision), 0)                                         as interchange_nc,  
        COALESCE("payment_method_variant", '')                                                          as payment_method_variant,
        COALESCE("modification_merchant_reference", '')                                                 as modification_merchant_reference,
        COALESCE(CAST("batch_number" as bigint), 0)                                                     as batch_number,
        COALESCE("reserved4", '')                                                                       as reserved4,
        COALESCE("reserved5", '')                                                                       as reserved5,
        COALESCE("reserved6", '')                                                                       as reserved6,
        COALESCE("reserved7", '')                                                                       as reserved7,
        COALESCE("reserved8", '')                                                                       as reserved8,
        COALESCE("reserved9", '')                                                                       as reserved9,
        COALESCE("reserved10", '')                                                                      as reserved10,
        0                                                                                               as payment_fees_nc,
        ''                                                                                              as issuer_country

from public.adyen_settlement_detail_report_batch