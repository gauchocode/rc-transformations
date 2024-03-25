{{ config(materialized="table") }}

select 
    "Id"                                as id,
    COALESCE("Comment", '')             as comment,
    "CreateAt"                          as create_at,
    "Language"                          as language,
    COALESCE("PayerZip", '')            as payer_zip,
    "UpdateAt"                          as update_at,
    COALESCE("Affiliate", '')           as affiliate,
    COALESCE("PayerCity", '')           as payer_city,
    "BasketCode"                        as basket_code,
    "PayerEmail"                        as payer_email,
    "PayerPhone"                        as payer_phone,
    COALESCE("PayerGender", '')         as payer_gender,
    COALESCE("PayerStreet", '')         as payer_street,
    "PaymentUser"                       as payment_user,
    COALESCE("PayerCompany", '')        as payer_company,
    COALESCE("PayerCountry", '')        as payer_country,
    COALESCE("PaymentCE_ID", 0)         as payment_ce_id,
    "PaymentGroup"                      as payment_group,
    "PaymentValue"                      as payment_value,
    "PayerLastName"                     as payer_last_name,
    "PaymentMethod"                     as payment_method,
    COALESCE("PaymentUnitID", 0)        as payment_unit_id,
    COALESCE("PaymentGroup", 0)         as payment_group,
    "PaymentValue"                      as payment_value,
    "PayerLastName"                     as payer_last_name,
    "PaymentMethod"                     as payment_method,
    "VoucherNumber"                     as voucher_number,
    "PayerFirstName"                    as payer_first_name,
    "IsGroupEmployee"                   as is_group_employee,
    "PaymentBankInfo"                   as payment_bank_info,
    "PaymentCurrency"                   as payment_currency,
    "PaymentDateTime"                   as payment_date_time,
    COALESCE("PaymentProvider", '')     as payment_provider,
    "PaymentContactId"                  as payment_contact_id,
    "PaymentCreatedBy"                  as payment_created_by,
    "PaymentReference"                  as payment_reference,
    "SalesReportNumber"                 as sales_report_number,
    COALESCE("CorporateAccountId", 0)   as corporate_account_id,
    COALESCE("PaymentDynamicInfo" , '') as payment_dynamic_info,
    COALESCE("CorporateContractId", 0)  as corporate_contract_id,
    "PaymentSalesPointName"             as payment_sales_point_name,
    "PaymentSalesPointType"             as payment_sales_point_type,
    "BasketCreationDateTime"            as basket_creation_date_time

from public.turnit_payment