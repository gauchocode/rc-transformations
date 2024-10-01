{{ config(
    materialized='incremental',
    unique_key='id'
) }}

{# Verificamos si la columna salesforce_id existe #}
{% set columns_in_table = adapter.get_columns_in_relation(ref('booking')) %}

WITH source_data AS (
    SELECT 
        {% if 'salesforce_id' in columns_in_table %}
            COALESCE(salesforce_id, '') as salesforce_id,
        {% else %}
            '' as salesforce_id,
        {% endif %}
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

{% if is_incremental() %}
WHERE changed_on_utc > (SELECT MAX(changed_on_utc) FROM {{ this }})
{% endif %}
