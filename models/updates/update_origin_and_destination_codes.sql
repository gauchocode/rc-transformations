UPDATE turnit_product_activity_view
SET
    journey_origin_stop_code = CASE 
        WHEN journey_origin_stop_code = 'UCL' THEN 'UCF'
        WHEN journey_origin_stop_code = 'FMP' THEN 'FM'
        ELSE journey_origin_stop_code
    END,
    journey_destination_stop_code = CASE 
        WHEN journey_destination_stop_code = 'UCL' THEN 'UCF'
        WHEN journey_destination_stop_code = 'FMP' THEN 'FM'
        ELSE journey_destination_stop_code
    END,
    origin_stop_code = CASE 
        WHEN origin_stop_code = 'UCL' THEN 'UCF'
        WHEN origin_stop_code = 'FMP' THEN 'FM'
        ELSE origin_stop_code
    END,
    destination_stop_code = CASE 
        WHEN destination_stop_code = 'UCL' THEN 'UCF'
        WHEN destination_stop_code = 'FMP' THEN 'FM'
        ELSE destination_stop_code
    END;
UPDATE turnit_product_activity_view
SET
    journey_origin_stop_code = CASE 
        WHEN journey_origin_stop_code = 'UCL' THEN 'UCF'
        WHEN journey_origin_stop_code = 'FMP' THEN 'FM'
        ELSE journey_origin_stop_code
    END,
    journey_destination_stop_code = CASE 
        WHEN journey_destination_stop_code = 'UCL' THEN 'UCF'
        WHEN journey_destination_stop_code = 'FMP' THEN 'FM'
        ELSE journey_destination_stop_code
    END,
    origin_stop_code = CASE 
        WHEN origin_stop_code = 'UCL' THEN 'UCF'
        WHEN origin_stop_code = 'FMP' THEN 'FM'
        ELSE origin_stop_code
    END,
    destination_stop_code = CASE 
        WHEN destination_stop_code = 'UCL' THEN 'UCF'
        WHEN destination_stop_code = 'FMP' THEN 'FM'
        ELSE destination_stop_code
    END;
