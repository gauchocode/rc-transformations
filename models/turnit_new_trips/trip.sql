{{ config(materialized="table") }}

WITH source_data AS (
    SELECT 
        ''                                              as salesforce_id,
        id                                              as id,
        name                                            as name,
        status                                          as status,
        line_type                                       as line_type,
        is_deleted                                      as is_deleted,
        short_name                                      as short_name,
        external_id                                     as external_id,
        line_number                                     as line_number,
        service_code                                    as service_code,
        changed_on_utc                                  as changed_on_utc,
        created_on_utc                                  as created_on_utc,
        changed_by_user_id                              as changed_by_user_id,
        created_by_user_id                              as created_by_user_id,
        departure_datetime                              as departure_datetime,
        row_updated_on_utc                              as row_updated_on_utc,
        cancellation_reason                             as cancellation_reason,
        transportation_type                             as transportation_type,
        departure_datetime_timezone                     as departure_datetime_timezone
    FROM {{ source('public', 'trip') }}
)

SELECT *
FROM source_data