{{ config(materialized="table" ) }}

select
    "id"                    as id,
    "TripId"                as trip_id,
    "CreateAt"              as create_at,
    "UpdateAt"              as update_at,
    "FarAccuracyMinutes"    as far_accuracy_minutes,
    "FarAccuracySeconds"    as far_accuracy_seconds,
    "MidAccuracyMinutes"    as mid_accuracy_minutes,
    "MidAccuracySeconds"    as mid_accurac_seconds,
    "NearAccuracyMinutes"   as near_accuracy_minutes,
    "NearAccuracySeconds"   as near_accuracy_seconds

from public.trip_prediction_accuracy