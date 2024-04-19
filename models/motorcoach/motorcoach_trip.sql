{{ config(materialized="table") }}

SELECT 100000000 + ROW_NUMBER() OVER (ORDER BY cast(TO_DATE(e.travel_date, '%d/%m/%Y') as date), e.time_travel, e.travel_id) AS trip_id, 

e.departure || ' - ' || e.arrival AS trip_name,

cast(TO_DATE(e.travel_date, '%d/%m/%Y') as date) as trip_departure_date_time, '' as line_number, 

e.travel_id as trip_service_code,

coalesce((select SPLIT_PART(max(service_type), ' ', 1)  from public.motorcoach_income_by_route 
where e.travel_id = travel_id and e.travel_date = travel_date and e.time_travel = time_travel), 'Sin') as line_brand,

e.state as company, 
'' as trip_status, 

e.miles as distance, 

e.seats_occupied as _Occ_Max, 

e.total_seats as _Seat_Total,

'True' as is_active, 

e.time_travel as _Hora_Salida,    

e.departure as _Origen, 

e.arrival as _Destino,

coalesce((select SUM(cast(pax as int)) from public.motorcoach_income_by_route 
where e.travel_id = travel_id and e.travel_date = travel_date and e.time_travel = time_travel), 0) as entering,

revenue_plus_original_tkt as revenue

FROM public.motorcoach_sales_travel e