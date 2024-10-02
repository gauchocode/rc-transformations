{{ config(materialized="table") }}

WITH source_data AS (
    SELECT 
        ''                                              as salesforce_id,
        id                                              as id,
        type                                            as type,
        subtype                                         as subtype,
        currency                                        as currency,
        offer_id                                        as offer_id,
        tariff_id                                       as tariff_id,
        booking_id                                      as booking_id,
        product_id                                      as product_id,
        unit_price                                      as unit_price,
        final_price                                     as final_price,
        campaign_code                                   as campaign_code,
        campaign_name                                   as campaign_name
        changed_on_utc                                  as changed_on_utc,
        created_on_utc                                  as created_on_utc,
        tax_percentage                                  as tax_percentage,
        travel_pass_id                                  as travel_pass_id,
        model_bucket_id                                 as model_bucket_id,
        applied_fare_type                               as applied_fare_type,
        changed_by_user_id                              as changed_by_user_id,
        created_by_user_id                              as created_by_user_id,
        fare_category_name                              as fare_category_name,
        inventory_class_name                            as inventory_class_name,
        parent_offer_part_id                            as parent_offer_part_id,
        applied_passenger_type                          as applied_passenger_type,
        final_price_without_tax                         as final_price_without_tax,
        fulfillment_security_code                       as fulfillment_security_code,
        promotional_discount_name                       as promotional_discount_name,
        passenger_type_discount_name                    as passenger_type_discount_name,
        admission_booked_with_travel_pass_id            as admission_booked_with_travel_pass_id,
        unit_price_with_passenger_type_discount         as unit_price_with_passenger_type_discount,
    FROM {{ source('public', 'offer_part') }}
)

SELECT *
FROM source_data