{{ config(materialized="table" ) }}

select 
    "id"                as id,
    "Status"            as status,
    "CreateAt"          as create_at,
    "UpdateAt"          as update_at,
    "CreatedBy"         as created_by,
    "CheckinStopId"     as checkin_stop_id,
    "IsSeatReleased"    as is_seat_released,
    "CheckinDateTime"   as checkin_date_time,
    "TransactionCode"   as transaction_code
from public.turnit_checkin