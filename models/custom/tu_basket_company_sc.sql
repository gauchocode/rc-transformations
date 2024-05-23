{{ config(materialized="table") }}

with
       transbordo as (
       select distinct product_code
       from public.turnit_product_activity_view
       where leg_order = 2 --type = 'BUS_TICKET' and operation_group = 1 and operation_user <> '888' and
       )

SELECT p.basket_code,
max(case
       when transbordo.product_code is not null then 'Atlanta'
       else coalesce(r.company, 'Others')
end) as company_sc
   

FROM public.turnit_product_activity_view p

left join public.turnit_trip t on p.trip_id = t.trip_id
left join public.maestros_ma_rutas r on cast(r.service_code as int) = cast(t.trip_service_code as int)
left join transbordo on transbordo.product_code = p.product_code

 --where p.type = 'BUS_TICKET' and p.operation_group = 1 and p.operation_user <> '888'  and

 group by basket_code order by company_sc