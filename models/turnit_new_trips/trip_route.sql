{{ config(materialized="table") }}

WITH source_data AS (
    SELECT 
        ''                                              as salesforce_id,
        id                                              as id,
        stop_id                                         as stop_id,
        trip_id                                         as trip_id,
        stop_type                                       as stop_type,
        time_zone                                       as time_zone,
        is_deleted                                      as is_deleted,
        order_number                                    as order_number,
        changed_on_utc                                  as changed_on_utc,
        created_on_utc                                  as created_on_utc,
        stop_platform_id                                as stop_platform_id,
        changed_by_user_id                              as changed_by_user_id,
        created_by_user_id                              as created_by_user_id,
        row_updated_on_utc                              as row_updated_on_utc,
        actual_arrival_time                             as actual_arrival_time,
        planned_arrival_time                            as planned_arrival_time,
        actual_departure_time                           as actual_departure_time,
        distance_from_previous                          as distance_from_previous,
        planned_departure_time                          as planned_departure_time
    FROM {{ source('public', 'trip') }}
)

SELECT *
FROM source_data