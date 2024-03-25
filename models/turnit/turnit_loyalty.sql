{{ config(materialized="table") }}

select
    "id"                        as id,
    COALESCE("Carbon", '')      as carbon,
    "Points"                    as points,
    "Reason"                    as reason,
    "Status"                    as status,
    "Assignee"                  as assignee,
    "CreateAt"                  as create_at,
    COALESCE("Distance", 0)     as distance,
    "UpdateAt"                  as update_at,
    "ChangedOn"                 as changed_on,
    "CreatedOn"                 as created_on,
    "ValidFrom"                 as valid_from,
    "ValidUntil"                as valid_until,
    "VoucherNumber"             as voucher_number,
    "TransactionCode"           as transaction_code,
    "TravelAccountId"           as travel_account_id

from public.turnit_loyalty