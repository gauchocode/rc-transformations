{{ config(materialized="table") }}

select

    "Id"                        as id,
    "Email"                     as email,
    COALESCE("UnitId", 0)       as unit_id,
    "Culture"                   as culture,
    "ValidTo"                   as valid_to,
    "CreateAt"                  as create_at,
    "IsActive"                  as is_active,
    "LastName"                  as last_name,
    "Timezone"                  as timezone,
    "UpdateAt"                  as update_at,
    "UserName"                  as user_name,
    COALESCE("AgentCode", '')   as agent_code,
    "CreatedBy"                 as created_by,
    "CreatedOn"                 as created_on,
    "FirstName"                 as first_name,
    "ValidFrom"                 as valid_from,
    "HasPassword"               as has_password,
    "PrimaryOrganizationId"     as primary_organization_id



from public.turnit_user