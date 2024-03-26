{{ config(materialized="table" ) }}

select
    CAST(date as DATE)              as date,
    sessionCampaignName             as session_campaign_name,
    country                         as country,
    region                          as region,
    city                            as city,
    sessionDefaultChannelGroup      as session_default_channel_grouping,
    newUsers                        as new_users,
    sessions                        as sessions,
    userEngagementDuration          as user_engagement_duration,
    screenPageViews                 as screen_page_views,
    transactions                    as transactions,
    totalRevenue                    as total_revenue,
    engagedSessions                 as engaged_sessions    

from public.ga4_campcostrep_date_counlatlongchann