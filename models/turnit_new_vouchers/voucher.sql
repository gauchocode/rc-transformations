{{ config(materialized="table") }}

WITH source_data AS (
    SELECT 
        ''                                              as salesforce_id,
        id                                              as id,
        code                                            as code,
        type                                            as type,
        price                                           as price,
        currency                                        as currency,
        is_deleted                                      as is_deleted,
        used_amount                                     as used_amount,
        nominal_value                                   as nominal_value,
        changed_on_utc                                  as changed_on_utc,
        created_on_utc                                  as created_on_utc,
        valid_until_utc                                 as valid_until_utc,
        changed_by_user_id                              as changed_by_user_id,
        created_by_user_id                              as created_by_user_id,
        row_updated_on_utc                              as row_updated_on_utc,
        voucher_usage_type                              as voucher_usage_type,
        customer_profile_id                             as customer_profile_id,
        mass_compensation_id                            as mass_compensation_id,
        number_of_tickets_used                          as number_of_tickets_used,
        number_of_payments_used                         as number_of_payments_used,
        number_of_tickets_allowed                       as number_of_tickets_allowed,
        minimum_amount_left_to_pay                      as minimum_amount_left_to_pay,
        number_of_payments_allowed                      as number_of_payments_allowed,
        minimum_percentage_left_to_pay                  as minimum_percentage_left_to_pay
    FROM {{ source('public', 'voucher') }}
)

SELECT *
FROM source_data