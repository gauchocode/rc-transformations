{{ config(materialized="table" ) }}

select
    "Id"                as id,
    "Zip"               as zip,
    "Code"              as code,
    "Name"              as name,
    "CityName"          as city_name,
    "CreatedAt"         as created_at,
    "Latitude"          as latitude,
    "Timezone"          as timezone,
    "UpdateAt"          as update_at,
    "Longitude"         as longitude,
    "CountryCode"       as country_code,
    "CountryName"       as country_name,
    "HasPriority"       as has_priotity,
    "PlatformName"      as platform_name,
    "IsMultiLegHub"     as is_multi_leg_hub,
    "StreetAddress"     as street_address,
    "PlatformLatitude"  as platform_latitude,
    "MarketingCityName" as marketing_city_name,
    "PlatformLongitude" as platform_longitude
from turnit_bus_stop

