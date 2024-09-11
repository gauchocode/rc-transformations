{{ config(materialized="table" ) }}

select 
    TO_DATE("Dia", 'DD-Mon-YY')                                                         as dia,
    "ORIDES"                                                                            as ORIDES,
    "TktsNew"                                                                           as TktsNew,
    CAST(REPLACE(REPLACE("Avg_Tkt_Fee", '$', ''), ',', '') as DECIMAL(10, 2))           as Avg_Tkt_Fee,
    CAST(REPLACE(REPLACE("Ingreso_Real", '$', ''), ',', '') as DECIMAL(10, 2))          as Ingreso_Real,
    CAST(REPLACE(REPLACE("Ingreso_Tkt_Fee", '$', ''), ',', '') as DECIMAL(10, 2))       as Ingreso_Tkt_Fee
from public.business_case