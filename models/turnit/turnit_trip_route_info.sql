{{ config(materialized="table") }}

select
    "id"                                            as id,
    "TripId"                                        as trip_id,
    "CreateAt"                                      as create_at,
    "StopCode"                                      as stop_code,
    "UpdateAt"                                      as update_at,
    "RouteOrder"                                    as route_order,
    "PlatformName"                                  as platform_name,
    "StopTimezone"                                  as stop_timezone,
    replace("StopTypeCode", 'BUS_STOP_TYPE.', '')   as stop_type_code,
    "ActualArrivalTime"                             as actual_arrival_time,
    "PlannedArrivalTime"                            as planned_arrival_time,
    "ActualDepartureTime"                           as actual_departure_time,
    "PlannedDepartureTime"                          as planned_departure_time,
    COALESCE("DistanceFromPreviousStop", 0)         as distance_from_previous_stop

from public.turnit_trip_route_info