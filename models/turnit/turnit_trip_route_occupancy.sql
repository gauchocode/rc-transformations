{{ config(materialized="table") }}

select
    "id"            as id,
    "TripId"        as trip_id,
    "Leaving"       as leaving,
    "CreateAt"      as create_at
    "Entering"      as entering,
    "StopCode"      as stop_code,
    "StopName"      as stop_name,
    "UpdateAt"      as update_at,
    "Occupancy"     as occupancy,
    "VehicleId"     as vehicle_id,
    "RouteOrder"    as route_order

from public.turnit_trip_route_occupancy