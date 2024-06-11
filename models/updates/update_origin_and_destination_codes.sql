{{ config(
    materialized = 'ephemeral'
) }}

-- Llamar a la macro de actualización
{% do update_origin_and_destination_codes() %}
