-- models/my_model.sql
WITH source AS (
    SELECT
        *,
        md5(concat(column1, column2, column3)) AS id
    FROM {{ ref('bookings') }}
)

SELECT 
    md5(concat(reference,changed_on_utc,changed_on_utc,changed_by_user_id,))    as id,
    reference                                                                   as reference,
    changed_on_utc                                                              as changed_on_utc,
    changed_on_utc                                                              as created_on_utc,
    changed_by_user_id                                                          as changed_by_user_id,
    created_by_user_id                                                          as row_updated_on_utc

FROM source;
