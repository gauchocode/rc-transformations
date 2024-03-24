{{ config(materialized="table" ) }}

with data_t1 as (
	select 
		t1."date",
		SUM(t1."userEngagementDuration") as user_engagement_duration,
		SUM(t1."newUsers") as new_users,
		SUM(t1."conversions") as transactions,
		SUM(t1."totalRevenue") as total_revenue
	from social.ga4_user_acquisition_first_user_campaign_report t1
	group by t1."date"
),
data_t2 as (
	select
		t2."date",
		SUM(t2."sessions") as sessions,
		SUM(t2."engagedSessions") as engaged_sessions
	from social.ga4_traffic_acquisition_session_source_report t2
	group by t2."date"
)
select 
	cast(coalesce(t1."date", t2."date") as date) as date,
	t1.user_engagement_duration,
	t2.sessions,
	t1.new_users,
	t1.transactions,
	t1.total_revenue,
	t2.engaged_sessions
from data_t1 as t1
full outer join data_t2 t2 on t1."date" = t2."date";