{{ config(materialized="table") }}

select 
    "Id"                                                                        as id,
    regexp_replace("Code", '[\w]+\.', '', 'g')                                  as code,
    replace(replace("Type", 'TRANSACTION_TYPE.', '') , 'SERVICE_GROUP.', '')    as type,
    "Price"                                                                     as price,
    "PaxDoB"                                                                    as pax_do_b,
    COALESCE("Trip_ID", 0)                                                      as trip_id,
    "CreateAt"                                                                  as create_at,
    "Currency"                                                                  as currency,
    COALESCE("Distance", 0)                                                     as distance,
    COALESCE("LegOrder", 0)                                                     as leg_order,
    "PaxEmail"                                                                  as pax_email,
    "PaxPhone"                                                                  as pax_phone,
    "Quantity"                                                                  as quantity,
    COALESCE("SeatRank", '')                                                    as seat_rank,
    "UpdateAt"                                                                  as update_at,
    "BasePrice"                                                                 as base_price,
    COALESCE("GroupGuid", '')                                                   as group_guid,
    COALESCE("ObtNumber", '')                                                   as obt_number,
    "OpenUntil"                                                                 as open_until,
    replace("Operation", 'ACTIVITY_TYPE.', '')                                  as operation,
    COALESCE("PaxGender", '')                                                   as pax_gender,
    COALESCE("PriceList", '')                                                   as price_list,
    COALESCE(replace("SeatClass", 'COMFORT_LEVEL.', ''), '')                    as seat_class,
    COALESCE("ServiceId", 0)                                                    as service_id,
    COALESCE("SpaceType", '')                                                   as space_type,
    "Attributes"                                                                as attributes,
    "BasicPrice"                                                                as basic_price,
    "BasketCode"                                                                as basket_code,
    COALESCE("CampaignId", 0)                                                   as campaign_id,
    COALESCE("Commission", 0)                                                   as commission,
    COALESCE(regexp_replace("PaxCategory", '[\w]+\.', '', 'g'), '')             as pax_category,
    "PaxLastName"                                                               as pax_last_name,
    "PrimarySeat"                                                               as primary_seat,
    "ProductCode"                                                               as product_code,
    COALESCE("Trip_bus_ID", 0)                                                  as trip_bus_id,
    COALESCE("CampaignCode", '')                                                as campaign_code,
    COALESCE("LoyaltyPoint", 0)                                                 as loyalty_point,
    COALESCE("NbLegInbound", 0)                                                 as nb_leg_inbound,
    "PaxFirstName"                                                              as pax_first_name,
    COALESCE("RefundReason" , '')                                               as refund_reason,
    COALESCE("VehicleOrder" , 0)                                                as vehicle_order,
    COALESCE("BasicDiscount", '')                                               as basic_discount,
    "CreatedByUser"                                                             as created_by_user,
    COALESCE("NbLegOutbound", 0)                                                as nb_leg_outbound,
    "OperationUser"                                                             as operation_user,
    COALESCE("SecondarySeat", '')                                               as secondary_seat,
    COALESCE("ExternalNumber", '')                                              as external_number,
    COALESCE("ManualDiscount", '')                                              as manual_discount,
    COALESCE("OperationCE_ID", 0)                                               as operation_ce_id,
    COALESCE("OperationGroup", 0)                                               as operation_group,
    COALESCE(
        regexp_replace(
            regexp_replace("OriginStopCode", 'UCL', 'UCF'),
            'FMP', 'FM'
        ),
        ''
    )                                                                           as origin_stop_code,
    COALESCE("PaxNationality", '')                                              as pax_nationality,
    COALESCE("RefundCurrency", '')                                              as refund_currency,
    COALESCE("RefundedAmount", 0)                                               as refunded_amount,
    COALESCE("StopBreakPoint", '')                                              as stop_break_point,
    "VAT_percentage"                                                            as vat_percentage,
    "ArrivalDateTime"                                                           as arrival_datetime,
    "IsInternational"                                                           as is_international,
    COALESCE("OperationUnitID", 0)                                              as operation_unit_id,
    COALESCE("SpecialDiscount", '')                                             as special_discount,
    "TransactionCode"                                                           as transaction_code,
    COALESCE("TravelAccountId" , 0)                                             as travel_account_id,
    COALESCE("TravelPassNumber", '')                                            as travel_pass_number,
    "DepartureDateTime"                                                         as departure_datetime,
    "OperationDateTime" AT TIME ZONE 'UTC'AT TIME ZONE 'America/New_York'       as operation_datetime,
    "OperationDateTime"                                                         as operation_datetime_orig,

    "Price_without_VAT"                                                         as price_without_vat,
    "SalesReportNumber"                                                         as sales_report_number,
    replace("TransactionStatus", 'TRANSACTION_STATUS.', '')                     as transaction_status,
    "OperationContactId"                                                        as operation_contact_id,
    COALESCE("RelatedProductCode", '')                                          as related_product_code,
    COALESCE(
        regexp_replace(
            regexp_replace("DestinationStopCode", 'UCL', 'UCF'),
            'FMP', 'FM'
        ),
        ''
    )                                                                           as destination_stop_code,
    "IsInboundJourneyWay"                                                       as is_inbound_journey_way,
    COALESCE(
        regexp_replace(
            regexp_replace("JourneyOriginStopCode", 'UCL', 'UCF'),
            'FMP', 'FM'
        ),
        ''
    )                                                                           as journey_origin_stop_code,
    COALESCE("DiscountDynamicInfoPax", '')                                      as discount_dynamic_info_pax,
    COALESCE("DiscountVoucherNumbers", '')                                      as discount_voucher_numbers,
    "OperationSalesPointName"                                                   as operation_sales_point_name,
    replace("OperationSalesPointType", 'SALES_POINT_TYPE.', '')                 as operation_sales_point_type,
    COALESCE("RelatedTravelPassNumber", '')                                     as related_travel_pass_number,
    COALESCE(
        regexp_replace(
            regexp_replace("JourneyDestinationStopCode", 'UCL', 'UCF'),
            'FMP', 'FM'
        ),
        ''
    )                                                                           as journey_destination_stop_code,
    COALESCE("AmountDiscountedWithVoucher", 0)                                  as amount_discounted_with_voucher
    
from public.turnit_product_activity_view
