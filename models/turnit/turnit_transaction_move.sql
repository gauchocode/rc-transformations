{{ config(materialized="table") }}

select
    "id"                as id,
    "CreateAt"          as create_at,
    "UpdateAt"          as update_at,
    "CreatedBy"         as created_by,
    "CreatedOn"         as created_on,
    "NewTrip_bus_ID"    as new_trip_bus_id


from public.turnit_transaction_move