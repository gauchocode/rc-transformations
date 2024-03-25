{{ config(materialized="table") }}

select
    "Id"                                        as id,
    "Name"                                      as name,
    "Type"                                      as type,
    "Reason"                                    as reason,
    "TripId"                                    as trip_id,
    "Comment"                                   as comment,
    "OwnerId"                                   as owner_id,
    "CreateAt"                                  as create_at,
    "Currency"                                  as currency,
    COALESCE("ToStopId", 0)                     as to_stop_id,
    "UpdateAt"                                  as update_at,
    "CreatedBy"                                 as created_by,
    "CreatedOn"                                 as created_on,
    COALESCE("FromStopId", 0)                   as from_stop_id,
    COALESCE("FixedSumValue", 0)                as fixed_sum_value,
    "NotificationSentOn"                        as notification_sent_on,
    COALESCE("PassengerNameFilter", '')         as passenger_name_filter,
    COALESCE("PassengerEmailFilter", '')        as passenger_email_filter,
    COALESCE("PassengerPhoneFilter", '')        as passenger_phone_filter,
    COALESCE("TicketPriceAdditionValue", '')    as ticket_price_addition_value,
    "IsNotificationToSmsAllowed"                as is_notification_to_sms_allowed,
    "TicketPricePercentageValue"                as ticket_price_percentage_value,
    "AreLegLevelAddonsCompensated"              as are_leg_level_addons_compensated,
    "IsNotificationToEmailAllowed"              as is_notification_to_rmail_allowed,
    "AreTravelPassTicketsCompensated"           as are_travel_pass_tickets_compensated,
    "IsSendingNotificationToSmsPreferred"       as is_sending_notification_to_sms_preferred,
    "IsProblematicTransactionMarkedSolved"      as is_problematic_transaction_marked_solved,
    "IsSendingNotificationToEmailPreferred"     as is_sending_notification_to_email_preferredb

from  public.turnit_mass_compensation