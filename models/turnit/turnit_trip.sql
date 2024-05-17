{{ config(materialized="table") }}

select
    "id"                            as id,
    "LineId"                        as line_id,
    "TripId"                        as trip_id,
    "Company"                       as company,
    "CreateAt"                      as create_at,
    "Distance"                      as distance,
    "IsActive"                      as is_active,
    "LineType"                      as line_type,
    "TripName"                      as trip_name,
    "UpdateAt"                      as update_at,
    "CompanyId"                     as company_id,
    COALESCE("Direction", '')       as direction,
    "LineBrand"                     as line_brand,
    "LineNumber"                    as linenumber,
    "TripStatus"                    as trip_status,
    COALESCE("Subcontractor", '')   as subcontractor,
    "TransportType"                 as transport_type,
    "TripShortName"                 as trip_short_name,
    "LineTemplateId"                as line_template_id,
    "TripServiceCode"               as trip_service_code,
    "ClassWithNumberedSeat"         as class_with_numbered_seat,
    "TripDepartureDateTime"         as trip_departure_datetime,
    "PlannedArrivalDateTime"        as planned_arrival_datetime,
    "PlannedArrivalDateTimezone"    as planned_arrival_date_timezone,
    "TripDepartureDateTimeTimezone" as trip_departure_datetime_timezone

from public.turnit_trip