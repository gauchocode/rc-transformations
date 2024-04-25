{{ config(materialized="table" ) }}

select 
    "TripId"                as trip_id,
    "RouteOrder"            as route_order,
    "ActualArrival"         as actual_arrival,
    "ActualDeparture"       as actual_departure,
    "DepartureArrival"      as departure_arrival,
    "ETAUtrackArrival"      as eta_utrack_arrival,
    "DepartureDiference"    as departure_diference,
    "ETAUtrackDeparture"    as eta_utrack_departure

from ut_utrack_vs_actual