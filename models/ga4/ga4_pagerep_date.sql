{{ config(materialized="table" ) }}

select 
    CAST("date"                         as DATE)    as date,
    SUM(CAST("userEngagementDuration"   as INT))    as user_engagement_duration,
    SUM(CAST("conversions"              as INT))    as transactions,
    SUM(CAST("newUsers"                 as INT))    as new_users,
    SUM(CAST("totalRevenue"             as INT))    as total_revenue
from 
    social.ga4_pages_path_report
group by
    "date"