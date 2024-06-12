{% macro update_stop_codes() %}
-- Actualiza columnas en la tabla turnit_product_activity_view
UPDATE public.turnit_product_activity_view
SET
    public.journey_origin_stop_code = CASE 
        WHEN public.journey_origin_stop_code = 'UCL' THEN 'UFL'
        WHEN public.journey_origin_stop_code = 'FMP' THEN 'FM'
        ELSE public.journey_origin_stop_code
    END,
    public.journey_destination_stop_code = CASE 
        WHEN public.journey_destination_stop_code = 'UCL' THEN 'UFL'
        WHEN public.journey_destination_stop_code = 'FMP' THEN 'FM'
        ELSE public.journey_destination_stop_code
    END,
    public.origin_stop_code = CASE 
        WHEN public.origin_stop_code = 'UCL' THEN 'UFL'
        WHEN public.origin_stop_code = 'FMP' THEN 'FM'
        ELSE public.origin_stop_code
    END,
    public.destination_stop_code = CASE 
        WHEN public.destination_stop_code = 'UCL' THEN 'UFL'
        WHEN public.destination_stop_code = 'FMP' THEN 'FM'
        ELSE public.destination_stop_code
    END;
{% endmacro %}
