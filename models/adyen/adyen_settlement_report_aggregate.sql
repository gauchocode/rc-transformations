{{ config(materialized="table") }}

select 
    COALESCE("company_account", '')             as company_account,
    COALESCE("merchant_account", '')            as merchant_account,
    COALESCE("country_code", '')                as country_code,
    COALESCE("store", '')                       as store,
    COALESCE("terminal_id", '')                 as terminal_id,
    COALESCE("batch_number", 0)                 as batch_number,
    COALESCE("batch_closed_date", '')           as batch_closed_date,
    CAST("batch_closed_date" as DATE)           as batch_closed_date_trunc,
    COALESCE("payment_method", '')              as payment_method,
    COALESCE("creation_date", '')               as creation_date ,
    COALESCE("timezone", '')                    as timezone,
    COALESCE("journal_type", '')                as journal_type,
    COALESCE("gross_currency", '')              as gross_currency,
    COALESCE("gross_debit_gc", 0)               as gross_debit_gc,
    COALESCE("gross_credit_gc", 0)              as gross_credit_gc,
    COALESCE("exchange_rate", 0)                as exchange_rate,
    COALESCE("net_currency", '')                as net_currency,
    COALESCE("net_debit_nc", 0)                 as net_debit_nc,
    COALESCE("net_credit_nc", 0)                as net_credit_nc,
    COALESCE("bank_card_commission_nc", 0)      as bank_card_commission_nc,
    COALESCE("dcc_markup_nc", '')               as dcc_markup_nc,
    COALESCE("num_txs", 0)                      as num_txs
from adyen_settlement_report_aggregate