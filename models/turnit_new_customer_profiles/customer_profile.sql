{{ config(materialized="table") }}

WITH source_data AS (
    SELECT 
        ''                                              as salesforce_id,
        id                                              as id,
        code                                            as code,
        email                                           as email,
        gender                                          as gender,
        owner_id                                        as owner_id,
        city_name                                       as city_name,
        last_name                                       as last_name,
        birth_date                                      as birth_date,
        first_name                                      as first_name,
        is_deleted                                      as is_deleted,
        postal_code                                     as postal_code,
        country_name                                    as country_name,
        loyalty_tier                                    as loyalty_tier,
        phone_number                                    as phone_number,
        changed_on_utc                                  as changed_on_utc,
        created_on_utc                                  as created_on_utc,
        street_address                                  as street_address,
        changed_by_user_id                              as changed_by_user_id,
        created_by_user_id                              as created_by_user_id,
        row_updated_on_utc                              as row_updated_on_utc,
        left_loyalty_on_utc                             as left_loyalty_on_utc,
        joined_loyalty_on_utc                           as joined_loyalty_on_utc
    FROM {{ source('public', 'customer_profile') }}
)

SELECT *
FROM source_data