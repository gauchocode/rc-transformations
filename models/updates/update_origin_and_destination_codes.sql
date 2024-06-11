{{ config(
    materialized = 'ephemeral'
) }}

-- Llamar a la macro de actualización
{% do update_stop_codes() %}
