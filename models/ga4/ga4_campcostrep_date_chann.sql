{{ config(materialized="table" ) }}

select
	CAST(date as DATE)			as date,
	sessionCampaignName			as session_campaign_name,
	sessionDefaultChannelGroup	as session_default_channel_grouping,
	newUsers					as new_users,
	sessions					as sessions,
	userEngagementDuration		as user_engagement_duration,
	screenPageViews				as screen_page_views,
	advertiserAdImpressions		as advertiser_ad_impressions,
	advertiserAdClicks			as advertiser_ad_clicks,
	advertiserAdCost			as advertiser_ad_cost,
	transactions				as transactions,
	totalRevenue				as totalRevenue,
	engagedSessions				as engaged_sessions

from social.ga4_campcostrep_date_chann