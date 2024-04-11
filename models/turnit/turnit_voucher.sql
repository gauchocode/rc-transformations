{{ config(materialized="table") }}

select 
    "id"                                    as id,
    "Code"                                  as code,
    "Name"                                  as name,
    replace("Type", 'VOUCHER_TYPE.', '')    as type,
    "Price"                                 as price,
    "HasPin"                                as has_pin,
    "Number"                                as number,
    "OwnerId"                               as owner_id,
    "CreateAt"                              as created_at,
    "Currency"                              as currency,
    "UpdateAt"                              as update_at,
    "CreatedBy"                             as created_by,
    "CreatedOn"                             as created_on,
    "UsageType"                             as usage_type,
    "UsedAmount"                            as user_amount,
    "ValidUntil"                            as valid_until,
    "CancelledBy"                           as cancelled_by,
    "CancelledOn"                           as cancelled_on,
    "NominalValue"                          as nominal_value,
    "MinimumAmount"                         as minimum_amount,
    "CompensationId"                        as compensation_id,
    "TravelAccountId"                       as travel_account_id,
    "MinimumPercentage"                     as minimum_percentage,
    "RelatedBasketCode"                     as related_basket_code,
    "RelatedProductCode"                    as related_product_code,
    "MaxNumberOfPayments"                   as max_number_of_payments,
    "MaxNumberOfProducts"                   as max_number_of_Products,
    "NumberOfPaymentsUsed"                  as number_of_payments_used,
    "NumberOfProductsUsed"                  as number_of_products_used

from public.turnit_voucher