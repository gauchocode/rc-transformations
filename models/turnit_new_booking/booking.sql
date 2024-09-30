{{ config(materialized="table" ) }}

SELECT 
    ''                                                                          as saleforce_id,
    id                                                                          as id,
    reference                                                                   as reference,
    changed_on_utc                                                              as changed_on_utc,
    changed_on_utc                                                              as created_on_utc,
    changed_by_user_id                                                          as changed_by_user_id,
    created_by_user_id                                                          as row_updated_on_utc

FROM booking
