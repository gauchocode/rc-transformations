{{ config(materialized="table") }}

WITH source_data AS (
    SELECT 
        ''                                              as salesforce_id,
        id                                              as id,
        currency                                        as currency,
        booking_id                                      as booking_id,
        voucher_id                                      as voucher_id,
        paid_amount                                     as paid_amount,
        payment_type                                    as payment_type,
        changed_on_utc                                  as changed_on_utc,
        created_on_utc                                  as created_on_utc,
        booking_cost_id                                 as booking_cost_id,
        reference_number                                as reference_number,
        changed_by_user_id                              as changed_by_user_id,
        created_by_user_id                              as created_by_user_id,
        point_of_sales_name                             as point_of_sales_name,
        point_of_sales_type                             as point_of_sales_type,
        is_partial_ticketing                            as is_partial_ticketing,
        payment_service_provider                        as payment_service_provider,
        business_customer_contract_id                   as business_customer_contract_id,
        payment_service_provider_response               as payment_service_provider_response,
        business_customer_contract_employee_account_id  as business_customer_contract_employee_account_id

    FROM {{ source('public', 'payment') }}
)

SELECT *
FROM source_data