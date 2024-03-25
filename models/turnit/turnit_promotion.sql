{{ config(materialized="table") }}

select
    "id"                as id,
    "Code"              as code,
    "Name"              as name,
    "ValidTo"           as valid_to,
    "CreateAt"          as create_at,
    "TimeZone"          as time_zone,
    "UpdateAt"          as update_at,
    "CreatedBy"         as created_by,
    "CreatedOn"         as created_on,
    "ValidFrom"         as valid_from,
    "CampaignId"        as campaign_id,
    "BusCompanyIds"     as bus_company_ids,
    "PromotionType"     as promotion_type,
    "MarketingChannel"  as marketing_channel

from public.turnit_promotion