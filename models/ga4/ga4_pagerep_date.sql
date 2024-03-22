{{ config(materialized="table" ) }}

select 
    CAST("date" as DATE)                        as date,
    SUM(CAST("newUsers" as INT))                as new_users,
    SUM(CAST("totalRevenue" as INT))            as total_revenue,
    SUM(CAST("userEngagementDuration" as INT))  as user_engagement_duration
from 
    social.ga4_pages_path_report
group by
    "date"