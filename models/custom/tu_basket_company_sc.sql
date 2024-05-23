{{ config(materialized="table") }}

with
       transbordo as (
       select distinct basket_code
       from public.turnit_product_activity_view
       where leg_order = 2
       )

select p.basket_code,
case
       when max(transbordo.basket_code) is not null then 'Atlanta'
       else coalesce(max(r.company), 'Others')
end as company_sc
 
FROM public.turnit_product_activity_view p
left join public.turnit_trip t on p.trip_id = t.trip_id
left join public.maestros_ma_rutas r on cast(r.service_code as int) = cast(t.trip_service_code as int)
left join transbordo on transbordo.basket_code = p.basket_code

group by p.basket_code