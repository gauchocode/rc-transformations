{{ config(materialized="table") }}

select
    "id"                                                                as id,
    COALESCE("Code", '')                                                as code,
    "Name"                                                              as name,
    "Type"                                                              as type,
    COALESCE("Level", '')                                               as level,
    COALESCE("Price", 0)                                                as price,
    "OwnerId"                                                           as owner_id,
    "CreateAt"                                                          as create_at,
    COALESCE("Currency", '')                                            as currency,
    "UpdateAt"                                                          as update_at,
    "CreatedBy"                                                         as created_by,
    "CreatedOn"                                                         as created_on,
    "ServiceId"                                                         as service_id,
    COALESCE("SpaceType", '')                                           as space_type,
    COALESCE("AddonGroup", '')                                          as addon_group,
    "IsExternal"                                                        as is_external,
    COALESCE("Description", '')                                         as description,
    COALESCE("VoucherType", '')                                         as voucher_type,
    COALESCE("PricePercent", 0)                                         as price_percent,
    COALESCE("VoucherValue", 0)                                         as voucher_value,
    "AddonSubGroup"                                                     as addon_sub_group,
    COALESCE("PricingOption", '')                                       as pricing_option,
    "VAT_percentage"                                                    as vat_percentage,
    "VoucherValidTo"                                                    as voucher_valid_to,
    "IsPriceSetInSale"                                                  as is_price_set_in_sale,
    "PriceSaleEndDate"                                                  as price_sale_end_date,
    COALESCE("VoucherMaxTicket", 0)                                     as voucher_max_ticket,
    "VoucherValidFrom"                                                  as voucher_valid_from,
    COALESCE("VoucherMaxPayment", 0)                                    as voucher_max_payment,
    "PriceSaleStartDate"                                                as price_sale_start_date,
    COALESCE("RefundingCondition", '')                                  as refunding_condition,
    COALESCE("InsuranceMinimumPrice", '')                               as insurance_minimum_price,
    "PriceDepartureEndDate"                                             as price_departure_end_date,
    COALESCE("VoucherValidityPeriod", '')                               as voucher_validity_period,
    "PriceDepartureStartDate"                                           as price_departure_start_date,
    COALESCE("DiscountRateAfterFirstLeg", 0)                            as discount_rate_after_first_leg,
    "IsForInternationalJourney"                                         as is_for_international_journey,
    COALESCE("VoucherValidityPeriodUnit", '')                           as voucher_validity_ṕeriod_unit,
    "VoucherCanSetValueOnCreation"                                      as voucher_can_set_value_on_creation
    COALESCE("InsuranceMinimumPriceCurrency", '')                       as insurance_minimum_price_currency,
    "IsRefundAmountSetOnCancellation"                                   as is_refund_amount_set_on_cancellation,
    COALESCE("InsurancePercentageOfProductPrice", 0)                    as insurance_percentage_of_product_price,
    COALESCE("InsurancePercentageOfProductPriceForTravelAccount", 0)    as insurance_percentage_of_product_price_for_travel_account

from public.turnit_service