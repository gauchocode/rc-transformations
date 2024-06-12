{{ config(
    materialized = 'table'  -- O 'ephemeral' o cualquier materialización adecuada
) }}

-- Llamar a la macro de actualización
{% do update_stop_codes() %}