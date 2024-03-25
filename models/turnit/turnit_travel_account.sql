{{ config(materialized="table") }}

select
    "Id"                    as id,
    "City"                  as city,
    "Code"                  as code,
    COALESCE("Tier", '')    as tier,
    "Email"                 as email,
    COALESCE("Gender", '')  as gender,
    COALESCE("Groups", [])  as groups,
    "Country"               as country,
    "OwnerId"               as owner_id,
    "ZipCode"               as zip_code,
    "CreateAt"              as create_at,
    "LastName"              as last_name,
    "UpdateAt"              as update_at,
    "BirthDate"             as birth_date,
    "ChangedOn"             as changed_on,
    "CreatedOn"             as created_on,
    "FirstName"             as first_name,
    "PhoneNumber"           as phone_number,
    "PhoneAreaCode"         as phone_area_code,
    "StreetAddress"         as street_address,
    "IsLoyaltyMember"       as is_loyalty_member,
    "LeftLoyaltyDate"       as left_loyalty_date,
    "JoinedLoyaltyDate"     as joined_loyalty_date

from public.turnit_travel_account