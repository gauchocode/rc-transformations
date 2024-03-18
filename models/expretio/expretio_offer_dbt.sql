{{ config(materialized="table" ) }}

select
    "MARKET"                    as market,
    "SITE"                      as site,
    "CXR"                       as cxr,
    "DDATE"                     as ddate,
    "DTIME"                     as dtime,
    "ATIME"                     as atime,
    "DDURATION"                 as dduration,
    "DSTP"                      as dstp,
    "DFLIGHT"                   as dflight,
    "CABIN"                     as cabin,
    "TYPE"                      as type,
    "BASE"                      as base,
    COALESCE("TAXES", "")       as taxes,
    "FARE"                      as fare,
    "FEE"                       as fee,
    "CURRENCY"                  as currency,
    COALESCE("REFERENCE", "")   as reference,
    "NBR_PAX"                   as nbx_pax,
    "RQTDATE"                   as rqtdate,
    "STATION"                   as station
from expretio_offer