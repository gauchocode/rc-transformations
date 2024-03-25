{{ config(materialized="table" ) }}

select
	"firstUserCampaignName"     as session_campaign_name,
	"newUsers"                  as new_users,
	"userEngagementDuration"    as user_engagement_duration, 
	"conversions"               as transactions,
	"totalRevenue"              as total_revenue,
	"engagedSessions"           as engaged_sessions
from social.ga4_user_acquisition_first_user_campaign_report 