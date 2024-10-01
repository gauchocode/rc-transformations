{{ config(
    materialized='incremental',
    unique_key='id'
) }}

WITH source_data AS (
    SELECT 
        COALESCE(salesforce_id, '')                  as saleforce_id,
        id                                           as id,
        reference                                    as reference,
        changed_on_utc                               as changed_on_utc,
        changed_on_utc                               as created_on_utc,
        changed_by_user_id                           as changed_by_user_id,
        created_by_user_id                           as row_updated_on_utc,
        _airbyte_raw_id                              as _airbyte_raw_id,
        _airbyte_extracted_at                        as _airbyte_extracted_at,
        _airbyte_generation_id                       as _airbyte_generation_id,
        _airbyte_meta                                as _airbyte_meta
    FROM {{ source('bookings', 'booking') }}
)

SELECT *
FROM source_data

-- Lógica incremental
{% if is_incremental() %}
WHERE changed_on_utc > (SELECT MAX(changed_on_utc) FROM {{ this }})
{% endif %}
