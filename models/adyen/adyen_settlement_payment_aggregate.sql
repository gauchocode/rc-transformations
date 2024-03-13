{{ config(materialized="table") }}

select 
    "company_accout" as company_accout,
    "merchant_account" as merchant_account,
    "country_code" as country_code,
    "store" as store,
    "terminal_id" as terminal_id,
    "batch_number" as long,
    "batch_closed_date" as batch_closed_date,
    "batch_closed_date_trunc" as batch_closed_date_trunc,
    "payment_method" as payment_method,
    "creation_date" as creation_date ,
    "timezone" as timezone,
    "journal_type" as journal_type,
    "gross_currency" as gross_currency,
    "gross_debit_gc" as gross_debit_gc,
    "gross_credit_gc" as gross_credit_gc,
    "exchange_rate" as exchange_rate,
    "net_currency" as net_currency,
    "net_debit_nc" as net_debit_nc,
    "net_credit_nc" as net_credit_nc,
    "bank_card_commission_nc" as bank_card_commission_nc,
    "dcc_markup_nc" as dcc_markup_nc,
    "num_txs" as "num_txs"
from adyen_settlement_report_aggregate