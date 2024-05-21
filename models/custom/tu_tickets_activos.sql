{{ config(materialized="table" ) }}

with 
	ticket_activos as (
		SELECT transaction_code
		FROM public.turnit_product_activity_view
	    WHERE type = 'BUS_TICKET'            
	    GROUP BY transaction_code
	    HAVING COUNT(transaction_code) = 1) ,

    fee_activos as (
	    SELECT transaction_code
	    FROM public.turnit_product_activity_view
	    WHERE type = 'FEE' and (code = 'SALES_FEE' or code = 'CHANGE_FEE')          
	    GROUP BY transaction_code
	    HAVING COUNT(transaction_code) = 1) ,

    transaction_update as (
	    SELECT distinct *
		FROM public.turnit_transaction_update) ,		                

    pav_fee_pc as (
		select related_product_code, sum(price) as price 
		from public.turnit_product_activity_view 
		where transaction_code in (select transaction_code from fee_activos) and related_product_code<>'' 
		group by related_product_code) ,

	pav_fee_bc as (
		select basket_code, sum(price) as price 
		from public.turnit_product_activity_view 
		where transaction_code in (select transaction_code from fee_activos) and related_product_code=''
		group by basket_code) ,
	
	pav_bus_pc as (
		select product_code, count(*) as cant_nivel_tk
		from public.turnit_product_activity_view 
		where transaction_code in (select transaction_code from ticket_activos) 
		group by product_code) ,
	
	pav_bus_bc as (
		select basket_code, count(*) as cant_nivel_bk
		from public.turnit_product_activity_view 
		where transaction_code in (select transaction_code from ticket_activos)  
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
		group by basket_code, payment_group),

	checkin as (
		select transaction_code, checkin_stop_id
		from public.turnit_checkin)		

SELECT p.id, p.operation_datetime, p.basket_code, p.operation_group, 
p.product_code, p.transaction_code, p.related_product_code, p.transaction_status, p.type, p.code, p.operation, 
p.pax_category, p.pax_first_name, p.pax_last_name, 

coalesce(o.name, '') as journey_origin_stop_code,
coalesce(d.name, '') as journey_destination_stop_code,

p.operation_user, p.operation_sales_point_type,
p.price, p.distance, t.company, p.departure_datetime,

coalesce(pav_fee_pc.price, 0) as fee_nivel_tk,
coalesce(pav_fee_bc.price, 0) as fee_nivel_bk,
coalesce(pav_bus_pc.cant_nivel_tk, 0) as cant_nivel_tk,
coalesce(pav_bus_bc.cant_nivel_bk, 0) as cant_nivel_bk,
coalesce(pv_voucher.pv_voucher, 0) as pv_voucher,
coalesce(pv_dinero.pv_dinero, 0) as pv_dinero,

coalesce(tu.new_trip_id, p.trip_id) as trip_id,

p.trip_id as trip_id_orig,

pax_email, travel_account_id,

coalesce(checkin.checkin_stop_id, 0) as checkin_stop
--,COALESCE((select checkin_stop_id from public.turnit_checkin 
--where transaction_code = p.transaction_code ), 0) as checkin_stop

,CASE p.operation_user
	WHEN 'redcoach.webstore' THEN 'Web'
	WHEN 'busbud.webstore' THEN 'Busbud'
	WHEN 'wanderu.webstore' THEN 'Wanderu'
	WHEN '888' THEN 'Migrados'
	ELSE
		CASE
			WHEN p.operation_sales_point_name = 'Call center' THEN 'Call Center'
		        ELSE 'Driver'
		        END
	END AS _canal_venta, p.primary_seat

, CONCAT(p.journey_origin_stop_code,' - ', p.journey_destination_stop_code) as od,

p.journey_origin_stop_code as origen, p.journey_destination_stop_code as destino

,coalesce(r.company, '') as company_sc,

r.ruta_nivel_1, coalesce(tra.tramo, 'Sin Tramo') as tramo

FROM public.turnit_product_activity_view p
left join public.turnit_trip t on p.trip_id = t.trip_id
left join pav_fee_pc on pav_fee_pc.related_product_code = p.product_code
left join pav_fee_bc on pav_fee_bc.basket_code = p.basket_code
left join pav_bus_pc on pav_bus_pc.product_code = p.product_code
left join pav_bus_bc on pav_bus_bc.basket_code = p.basket_code
left join pv_voucher on pv_voucher.basket_code = p.basket_code and pv_voucher.payment_group = p.operation_group
left join pv_dinero on pv_dinero.basket_code = p.basket_code and pv_dinero.payment_group = p.operation_group
left join transaction_update tu on tu.transaction_code = p.transaction_code 
left join public.maestros_ma_rutas r on cast(r.service_code as int) = cast(t.trip_service_code as int)
left join public.turnit_bus_stop o on o.code = p.journey_origin_stop_code
left join public.turnit_bus_stop d on d.code = p.journey_destination_stop_code
left join checkin on checkin.transaction_code = p.transaction_code 
left join maestros_ma_tramos tra on tra.od = CONCAT(p.journey_origin_stop_code,' - ', p.journey_destination_stop_code)

where p.type = 'BUS_TICKET' and p.transaction_code in (select transaction_code from ticket_activos)