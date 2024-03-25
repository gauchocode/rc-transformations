{{ config(materialized="table" ) }}

select
    "Id"                                            as id,
    "TripId"                                        as trip_id,
    "CompositionName"                               as composition_name,
    COALESCE("CompositionCode", '')                 as composition_code,
    "CompositionDirection"                          as composition_direction,
    "HasCompositionBeenChanged"                     as has_composition_been_changed,
    "OwnerId"                                       as owner_id,
    "IsActive"                                      as is_active,
    "OrderNumber"                                   as order_number,
    "VehicleName"                                   as vehicle_name,
    COALESCE("VehicleCode", '')                     as vehicle_code,
    "VehicleType"                                   as vehicle_type,
    "NumberingSystem"                               as numbering_system,
    "IsVehicleFlipped"                              as is_vehicle_flipped,
    "Floor"                                         as floor,
    COALESCE("MaxAllowedStandingPassenger", '')     as max_allowed_standing_passenger,
    "SeatTotal"                                     as seat_total,
    "SeatByClass"                                   as seat_by_class,
    COALESCE("BlockedSeat", '')                     as blocked_seat,
    COALESCE("ReservedSeat", '')                    as reserved_seat,
    "PlaceBySpace"                                  as place_by_space,
    "CreateAt"                                      as create_at,
    "UpdateAt"                                      as update_at
from public.turnit_composition_and_vehicle