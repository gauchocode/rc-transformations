{{ config(materialized="table" ) }}

select 
	CAST(date as DATE)				as date,
	userEngagementDuration			as user_engagement_duration,
	sessions						as sessions,
	newUsers						as new_users,
	transactions					as transactions,
	totalRevenue					as total_revenue,
	engagedSessions					as engaged_sessions

from public.ga4_pagerep_date