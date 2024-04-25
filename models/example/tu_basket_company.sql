{{ config(materialized="table" ) }}

with basket as (SELECT turnit_product_activity_view.BasketCode, max(trip_id) as trip_id
    from public.turnit_product_activity_view
    group by BasketCode)

 
select b.BasketCode as basket_code, COALESCE(substr(t.company, 10, 8), 'Others') as company

 from basket b

left join turnit_trip t on b.trip_id = t.trip_id