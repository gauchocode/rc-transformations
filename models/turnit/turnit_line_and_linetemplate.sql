{{ config(materialized="table" ) }}

select
    "id"                                        as id,
    "Brand"                                     as brand,
    "LineId"                                    as line_id,
    "CreateAt"                                  as create_at,
    COALESCE("LineCode", '')                    as line_code,
    "LineName"                                  as line_name,
    "LineType"                                  as line_type,
    "UpdateAt"                                  as update_at,
    COALESCE("DelayTime", 0)                    as delay_time,
    COALESCE("Direction", '')                   as direction,
    "BusCompany"                                as bus_company,
    "LineNumber"                                as linenumber,
    "LineEndDate"                               as line_end_date,
    "LineStartDate"                             as line_start_date,
    COALESCE("BusCompanyUnit", '')              as bus_company_unit,
    "LineTemplateId"                            as line_template_id,
    "LineTemplateName"                          as line_template_name,
    COALESCE("LineSubContractor", '')           as line_sub_contractor,
    "DoNotApplySalesFee"                        as do_not_apply_sales_fee,
    COALESCE("DynamicPricingRule", '')          as dynamic_pricing_rule,
    "TransportationType"                        as transportation_type,
    "IsOpenReturnAllowed"                       as is_open_return_allowed,
    "LineTemplateEndDate"                       as line_Template_end_date,
    "SalesRestrictionRule"                      as sales_restriction_rule,
    "LineTemplateStartDate"                     as line_template_start_date,
    "SendDelayNotification"                     as send_delay_notification,
    COALESCE("LineTemplateSubContractor", '')   as line_template_sub_contractor,
    "IsDynamicSalesRestrictionAllowed"          as is_dynamic_sales_restriction_allowed,
    "IsReleasingSalesRestrictionAllowed"        as is_releasing_sales_restriction_allowed

from public.turnit_line_and_linetemplate