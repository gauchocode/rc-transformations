{{ config(materialized="table" ) }}

select
    "Id"                                as id,
    "Code"                              as code,
    "Name"                              as name,
    "Type"                              as type,
    COALESCE("Email", '')               as email,
    "OwnerId"                           as owner_id,
    "CreateAt"                          as create_at,
    "Decision"                          as decision,
    "UpdateAt"                          as update_at,
    "ChangedBy"                         as changed_by,
    "ChangedOn"                         as changed_on,
    "CreatedBy"                         as created_by,
    "CreatedOn"                         as created_on,
    "ValidFrom"                         as valid_from,
    "ValidUntil"                        as valid_until,
    COALESCE("PhoneNumber", '')         as phone_number,
    COALESCE("PhoneAreaCode", '')       as phone_area_code,
    COALESCE("TravelAccountId", '')     as travel_account_id,
from public.turnit_consent