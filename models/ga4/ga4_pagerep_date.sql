{{ config(materialized="table" ) }}

select 
    "date"                                      as date,
    SUM(CAST("newUsers" as INT))                as new_users,
    SUM(CAST("userEngagementDuration" as INT))  as user_engagement_duration
from 
    social.ga4_pages_path_report
group by
    "date"