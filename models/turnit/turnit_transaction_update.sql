{{ config(materialized="table") }}

select
    "id"                as id,
    "CreateAt"          as create_at,
    "UpdateAt"          as update_at,
    "CreatedOn"         as created_on,
    "NewTrip_ID"        as new_trip_id,
    "OldTrip_ID"        as old_trip_id,
    "TransactionId"     as Transaction_id,
    "NewTrip_bus_ID"    as new_trip_bus_id



from public.turnit_transaction_update