{{ config(materialized="table" ) }}

select 
    "id"                                        as id,
    replace("Status", 'CHECK_IN_STATUS.', '')   as status,
    "CreateAt"                                  as create_at,
    "UpdateAt"                                  as update_at,
    "CreatedBy"                                 as created_by,
    "CheckinStopId"                             as checkin_stop_id,
    "IsSeatReleased"                            as is_seat_released,
    "CheckinDateTime"                           as checkin_datetime,
    "TransactionCode"                           as transaction_code
from public.turnit_checkin