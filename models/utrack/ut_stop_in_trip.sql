{{ config(materialized="table" ) }}

select 
    "id"                        as id,
    "StopId"                    as stop_id,
    "TripId"                    as trip_id,
    "CreateAt"                  as create_at,
    "UpdateAt"                  as update_at,
    "RouteOrder"                as route_order,
    "ArrivalStatus"             as arrival_status,
    "DepartureStatus"           as Departure_Status
    "ActualArrivalTime"         as actual_arrival_time,
    "ActualDepartureTime"       as actual_departure_time,
    "ScheduledArrivalTime"      as scheduled_arrival_time,
    "ArrivalTimeDifference"     as arrival_time_difference,
    "ScheduledDepartureTime"    as scheduled_departure_time,
    "DepartureTimeDifference"   as departure_time_difference

from public.ut_stop_in_trip