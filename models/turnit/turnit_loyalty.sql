{{ config(materialized="table") }}

select
    "id"                        as id,
    "CreateAt"                  as create_at,
    "Distance"                  as distance,
    "UpdateAt"                  as update_at,
    "OriginStopId"              as origin_stop_id,
    "LineTemplateId"            as line_template_id,
    "DestinationStopId"         as destination_stop_id,
    "OriginOrderNumber"         as origin_order_number,
    "DestinationOrderNumber"    as destination_order_number

from public.turnit_loyalty