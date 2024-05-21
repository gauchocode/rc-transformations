{{ config(materialized="table" ) }}

with pav_fee_pc as (
	select related_product_code, sum(price) as price 
	from public.turnit_product_activity_view 
	where type='FEE' and operation_group=1 and related_product_code<>''
	group by related_product_code) ,
	
	pav_fee_bc as (
	select basket_code, sum(price) as price 
	from public.turnit_product_activity_view 
	where type='FEE' and operation_group=1 and related_product_code<>''
	group by basket_code) ,
	
	pav_bus_pc as (
	select product_code, count(*) as cant_nivel_tk
	from public.turnit_product_activity_view 
	where type='BUS_TICKET' and operation_group=1 
	group by product_code) ,
	
	pav_bus_bc as (
	select basket_code, count(*) as cant_nivel_bk
	from public.turnit_product_activity_view 
	where type='BUS_TICKET' and operation_group=1 
	group by basket_code) ,

	pv_voucher as (
	select basket_code, payment_group, sum(payment_value) as pv_voucher
	from public.turnit_payment_view 
	where payment_method='VOUCHER' 
	group by basket_code, payment_group) ,

	pv_dinero as (
	select basket_code, payment_group, sum(payment_value) as pv_dinero
	from public.turnit_payment_view 
	where payment_method<>'VOUCHER' 
	group by basket_code, payment_group) ,

	pv_affiliate as (
	select basket_code, payment_group, max(affiliate) as affiliate
	from public.turnit_payment_view 
	group by basket_code, payment_group) ,
	
	pv_reference as (
	select basket_code, payment_group, max(payment_reference) as reference
	from public.turnit_payment_view 
	group by basket_code, payment_group) ,
	
	voucher as (
	select pv.basket_code, pv.payment_group, MAX(v.type) as tipo
	from public.turnit_payment_view pv
	left join public.turnit_voucher v on pv.voucher_number = v.number
	where pv.payment_method='VOUCHER'
	group by pv.basket_code, pv.payment_group) 	
	
SELECT p.id, p.trip_id, p.operation_datetime as operation_datetime, p.basket_code, p.operation_group, p.product_code, 
p.transaction_code, p.related_product_code, p.transaction_status,
p.type, p.code, p.operation, p.pax_category, p.pax_first_name, p.pax_last_name, p.pax_email, 
p.operation_user, p.operation_sales_point_type, p.price, t.company, p.departure_datetime, 
p.travel_account_id, p.base_price, p.basic_price,

coalesce(o.name, '') as journey_origin_stop_code,
coalesce(d.name, '') as journey_destination_stop_code,
coalesce(pav_fee_pc.price, 0) as fee_nivel_tk,
coalesce(pav_fee_bc.price, 0) as fee_nivel_bk,
coalesce(pav_bus_pc.cant_nivel_tk, 0) as cant_nivel_tk,
coalesce(pav_bus_bc.cant_nivel_bk, 0) as cant_nivel_bk,
coalesce(pv_voucher.pv_voucher, 0) as pv_voucher,
coalesce(pv_dinero.pv_dinero, 0) as pv_dinero,
coalesce(voucher.tipo, '') as tipo_voucher,
coalesce(pv_affiliate.affiliate, '') as affiliate,
coalesce(pv_reference.reference, '') as payment_reference

,CASE operation_user
	WHEN 'redcoach.webstore' THEN 'Web'
	WHEN 'busbud.webstore' THEN 'Busbud'
	WHEN 'wanderu.webstore' THEN 'Wanderu'
	WHEN '888' THEN 'Migrados'
	ELSE
		CASE
			WHEN operation_sales_point_name = 'Call center' THEN 'Call Center'
		        ELSE 'Driver'
		        END
	END AS _canal_venta

,coalesce(r.company, '') as company_sc
,CONCAT(p.journey_origin_stop_code,' - ', p.journey_destination_stop_code) as od,
p.journey_origin_stop_code as origen, p.journey_destination_stop_code as destino,
r.ruta_nivel_1, coalesce(tra.tramo, 'Sin Tramo') as tramo

FROM public.turnit_product_activity_view p
left join public.turnit_trip t on p.trip_id = t.trip_id
left join pav_fee_pc on pav_fee_pc.related_product_code = p.product_code
left join pav_fee_bc on pav_fee_bc.basket_code = p.basket_code
left join pav_bus_pc on pav_bus_pc.product_code = p.product_code
left join pav_bus_bc on pav_bus_bc.basket_code = p.basket_code
left join pv_voucher on pv_voucher.basket_code = p.basket_code and pv_voucher.payment_group = p.operation_group
left join pv_dinero on pv_dinero.basket_code = p.basket_code and pv_dinero.payment_group = p.operation_group
left join pv_affiliate on pv_affiliate.basket_code = p.basket_code and pv_affiliate.payment_group = p.operation_group
left join pv_reference on pv_reference.basket_code = p.basket_code and pv_reference.payment_group = p.operation_group
left join voucher on voucher.basket_code = p.basket_code and voucher.payment_group = p.operation_group
left join public.maestros_ma_rutas r on cast(r.service_code as int) = cast(t.trip_service_code as int)
left join public.turnit_bus_stop o on o.code = p.journey_origin_stop_code
left join public.turnit_bus_stop d on d.code = p.journey_destination_stop_code
left join public.maestros_ma_tramos tra on tra.od = CONCAT(p.journey_origin_stop_code,' - ', p.journey_destination_stop_code)

where p.type = 'BUS_TICKET' and p.operation_group = 1 and p.operation_user <> '888' 