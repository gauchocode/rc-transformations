{{ config(materialized="table" ) }}

select 
    "id"                                as id,
    COALESCE("Type", '')                as type,
    "UnitId"                            as unit_id,
    COALESCE("UnitZIP", '')             as unit_zip,
    "CreateAt"                          as create_at,
    COALESCE("UnitCity", '')            as unit_city,
    "UnitCode"                          as unit_code,
    "UnitName"                          as unit_name,
    "UpdateAt"                          as update_at,
    "ContactId"                         as contact_id,
    COALESCE("UnitEmail", '')           as unit_email,
    COALESCE("UnitPhone", '')           as unit_phone,
    COALESCE("ContactZIP", '')          as contact_zip,
    COALESCE("UnitCounty", '')          as unit_county,
    "UnitStreet"                        as unit_street,
    COALESCE("VAT_number", '')          as vat_number,
    COALESCE("AccountCode", '')         as account_code,
    COALESCE("ContactCity", '')         as contact_city,
    "ContactName"                       as contact_name,
    "UnitCountry"                       as unit_country,
    "ContactEmail"                      as contact_email,
    "ContactPhone"                      as contact_phone,
    COALESCE("ContactCounty", '')       as contact_county,
    "ContactStreet"                     as contact_street,
    COALESCE("AnalyticalCode", '')      as analytical_code,
    "ContactCountry"                    as contact_country,
    COALESCE("RegitrationCode", '')     as regitration_code,
    COALESCE("CommercialEntity", 0)     as commercial_entity
from public.turnit_contact_unit