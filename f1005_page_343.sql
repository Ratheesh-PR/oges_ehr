prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the owner (parsing schema)
-- of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>5293545047831238
,p_default_application_id=>1005
,p_default_id_offset=>32480478948762640
,p_default_owner=>'E_HR'
);
end;
/
 
prompt APPLICATION 1005 - E_HR Pack
--
-- Application Export:
--   Application:     1005
--   Name:            E_HR Pack
--   Date and Time:   09:28 Thursday February 5, 2026
--   Exported By:     RATHEESH
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 343
--   Manifest End
--   Version:         22.2.0
--   Instance ID:     706437207728239
--

begin
null;
end;
/
prompt --application/pages/delete_00343
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>343);
end;
/
prompt --application/pages/page_00343
begin
wwv_flow_imp_page.create_page(
 p_id=>343
,p_name=>'Payroll Setup'
,p_alias=>'PAYROLL-SETUP'
,p_step_title=>'Payroll Setup'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RATHEESH'
,p_last_upd_yyyymmddhh24miss=>'20260205092846'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(926302646259936446)
,p_plug_name=>'Payroll Setup'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86488574336429743)
,p_plug_display_sequence=>45
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1025824089123180739)
,p_plug_name=>'Employee paylsip '
,p_region_name=>'payslip'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(86488047389429743)
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT PS_M_ID||''_''||PS_C_ID||''_''||PS_NO as EMP_ID,',
'PS_NO||''-''||PS_M_ID AS EMP_CODE,',
'(SELECT M_NAME FROM E_HR.MEMBER_HEAD WHERE M_C_ID=PS_C_ID AND M_NO=PS_NO AND M_ID=PS_M_ID) AS EMP_NAME,',
'(SELECT M_BRANCH FROM E_HR.MEMBER_HEAD WHERE M_C_ID=PS_C_ID AND M_NO=PS_NO AND M_ID=PS_M_ID) AS EMP_BRANCH, ',
'(SELECT M_LOCATION FROM E_HR.MEMBER_HEAD WHERE M_C_ID=PS_C_ID AND M_NO=PS_NO AND M_ID=PS_M_ID) AS EMP_LOCATION,',
'(SELECT M_SECTION FROM E_HR.MEMBER_HEAD WHERE M_C_ID=PS_C_ID AND M_NO=PS_NO AND M_ID=PS_M_ID) AS EMP_SECTION,',
'(SELECT M_OCCUPATION FROM E_HR.MEMBER_HEAD WHERE M_C_ID=PS_C_ID AND M_NO=PS_NO AND M_ID=PS_M_ID) AS EMP_DESIGNATION,',
'(SELECT M_CONTRACT_TYPE FROM E_HR.MEMBER_HEAD WHERE M_C_ID=PS_C_ID AND M_NO=PS_NO AND M_ID=PS_M_ID) AS EMP_CONTRACT, Ps_Last_Update, PS_PAYROLL_STATUS',
'',
'FROM E_HR.PAYSLIP1',
'    inner join E_HR.MEMBER_HEAD on M_c_ID = PS_C_ID AND M_NO = PS_NO AND M_ID = PS_M_ID and (M_SECTION= :P343_SECTION OR :P343_SECTION is null)',
'      AND (M_PAYROLL_CYCLE=:P343_CYCLE OR :P343_CYCLE is null)',
'      AND (M_SP_ID=:P343_SPONSOR OR :P343_SPONSOR is null)',
'                                                    ',
'',
'    WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'',
'and PS_C_ID= :comp ',
'',
' ORDER BY 2'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P343_SECTION,P343_CYCLE,P343_FINANCIAL_YEAR,P343_FISCAL_PERIOD,P343_SPONSOR,P343_MEMBER_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P343_FISCAL_PERIOD'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Employee paylsip '
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(923123429258183433)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'DELJI'
,p_internal_uid=>923123429258183433
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923123505162183434)
,p_db_column_name=>'EMP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923123662055183435)
,p_db_column_name=>'EMP_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Emp Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923123765698183436)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Emp Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923123862891183437)
,p_db_column_name=>'EMP_BRANCH'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Emp Branch'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923123943032183438)
,p_db_column_name=>'EMP_LOCATION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Emp Location'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923124012625183439)
,p_db_column_name=>'EMP_SECTION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Emp Section'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923124144029183440)
,p_db_column_name=>'EMP_DESIGNATION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Emp Designation'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923124240087183441)
,p_db_column_name=>'EMP_CONTRACT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Emp Contract'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923124367685183442)
,p_db_column_name=>'PS_LAST_UPDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Last Update'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(923124471268183443)
,p_db_column_name=>'PS_PAYROLL_STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Payroll Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(942539439759327968)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9425395'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'EMP_CODE:EMP_NAME:EMP_DESIGNATION:PS_LAST_UPDATE:PS_PAYROLL_STATUS:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(926302740499936447)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_button_name=>'Finalize'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86509358518429770)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalize Payroll'
,p_button_condition=>':P343_X = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(926302883963936448)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_button_name=>'Unlock'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86509358518429770)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unlock Payroll'
,p_button_condition=>':P343_X = 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(923122384853183422)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_button_name=>'ViewEmployee'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(86509358518429770)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Employees with  Payslip '
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(926303088079936450)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_button_name=>'PostPayroll'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86509358518429770)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post Payroll'
,p_button_condition=>':P343_X = 2'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(926302948406936449)
,p_name=>'P343_X'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942154081120311680)
,p_name=>'P343_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&COMP.'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'COMPANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select C_NAME as display_value, C_ID as return_value ',
'  from E_HR.COMPANY WHERE C_ID = :COMP;'))
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942154383192308500)
,p_name=>'P343_FINANCIAL_YEAR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_prompt=>'Fin. Year'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CONCAT(CONCAT(FY_FROM,'' to ''),FY_TO) as display_value, FY_ID as return_value ',
'  from E_HR.FINANCIAL_YEAR WHERE FY_C_ID=v(''COMP'') and FY_STATUS=''O'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Financial Year'
,p_cHeight=>1
,p_colspan=>2
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(86509201732429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942154978104302372)
,p_name=>'P343_MEMBER_LIST'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Employee'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT M_NO||''-''||M_ID||'' ''||M_NAME AS EMP_NAME,M_NO||''_''||M_ID AS EMP_ID FROM E_HR.MEMBER_HEAD WHERE M_C_ID=v(''COMP'')',
'AND  (M_SECTION= :P343_SECTION OR :P343_SECTION is null)',
'      AND (M_PAYROLL_CYCLE=:P343_CYCLE OR :P343_CYCLE is null)',
'      AND (M_SP_ID=:P343_SPONSOR OR :P343_SPONSOR is null)',
'  ORDER BY M_ID'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Employees'
,p_lov_cascade_parent_items=>'P343_COMPANY,P343_SECTION,P343_SPONSOR,P343_CYCLE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>60
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>3
,p_display_when=>':P343_X <> 2'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942172353508069992)
,p_name=>'P343_FISCAL_PERIOD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_prompt=>'Month'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  CONCAT(CONCAT(FP_FROM,'' to ''),FP_TO) as display_value, ',
'  FP_ID as return_value ',
'from FISCAL_PERIOD ',
'WHERE FP_FY_ID =:P343_FINANCIAL_YEAR AND FP_FY_C_ID=:COMP order by To_CHAR(FP_FROM,''MM/YYYY'');'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Fiscal Period'
,p_lov_cascade_parent_items=>'P343_FINANCIAL_YEAR'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(86509201732429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942501743668528706)
,p_name=>'P343_SPONSOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_prompt=>'Sponsor'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SPONSORS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SP_NAME as display_value, SP_ID as return_value ',
'  from E_HR.SPONSORS',
'  where SP_C_ID = :COMP;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Sponsor'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942502093406526829)
,p_name=>'P343_SECTION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_prompt=>'Section'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SECTION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SN_NAME as display_value, SN_ID as return_value ',
'  from SECTION WHERE SN_C_ID = :COMP;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Sections'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(942502374723524887)
,p_name=>'P343_CYCLE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_prompt=>'Payroll Cycle'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT PRC_NAME AS D,PRC_ID AS R FROM E_HR.PAYROLL_CYCLE WHERE PRC_C_ID=:COMP oRDER BY 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Payroll Cycle'
,p_cHeight=>1
,p_colspan=>2
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1043164451718235135)
,p_name=>'P343_MEMBER_LIST_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Employee'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT M_NO||''-''||M_ID||'' ''||M_NAME AS EMP_NAME,M_NO||''-''||M_ID AS EMP_ID FROM E_HR.MEMBER_HEAD WHERE M_C_ID=v(''COMP'')',
'AND  (M_SECTION= :P343_SECTION OR :P343_SECTION is null)',
'      AND (M_PAYROLL_CYCLE=:P343_CYCLE OR :P343_CYCLE is null)',
'      AND (M_SP_ID=:P343_SPONSOR OR :P343_SPONSOR is null)',
'  ORDER BY M_ID'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Employees'
,p_lov_cascade_parent_items=>'P343_COMPANY,P343_SECTION,P343_SPONSOR,P343_CYCLE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>60
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>3
,p_display_when=>':P343_X = 2'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1066939363504855717)
,p_name=>'P343_PROJECT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(926302646259936446)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PR_NAME as display_value, PR_ID as return_value ',
'  from PROJECTS ',
'  --where ( (PR_C_ID= :COMP AND PR_C_ID>127) OR ( PR_C_ID=127 AND PR_STATUS=''A''))',
'  where pr_c_id = :comp and pr_status = ''A''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P343_X'
,p_display_when2=>'2'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86508999414429768)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(942167471080174288)
,p_validation_name=>'Check F Process Staff'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'vcnt number;',
'begin',
'if :P343_FINANCIAL_YEAR is null or :P343_FISCAL_PERIOD is null then',
'return ''Please choose the Payroll Period'';',
'end if;',
'',
'',
'if :P343_MEMBER_LIST is not null then',
'select count(*) into vcnt from  E_HR.PAYSLIP1 ',
'where PS_C_ID = :P237_COMPANY',
'  and PS_FY_YEAR = :P237_FINANCIAL_YEAR and PS_FP_ID = :P237_FISCAL_PERIOD --and nvl(PS_PAYROLL_STATUS,''D'' )= ''F''',
'  and PS_NO||''-''||PS_M_ID like :P237_MEMBER_LIST||''%'';',
'if vcnt = 0 then',
'return ''Payroll not processed for this staff....'';',
'End if;',
'end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(926302740499936447)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(942180743964873701)
,p_validation_name=>'Check P Process Staff'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'vcnt number;',
'begin',
'if :P343_MEMBER_LIST is not null then',
'select count(*) into vcnt from  E_HR.PAYSLIP1 ',
'where PS_C_ID = :P237_COMPANY',
'  and PS_FY_YEAR = :P237_FINANCIAL_YEAR and PS_FP_ID = :P237_FISCAL_PERIOD and nvl(PS_PAYROLL_STATUS,''D'' )= ''F''',
'  and PS_NO||''-''||PS_M_ID like :P237_MEMBER_LIST||''%'';',
'if vcnt = 0 AND :P343_X <> 2 then',
'return ''Please Process/FInalise the Payroll for this staff Before posting'';',
'End if;',
'end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(926303088079936450)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(942167770785172457)
,p_validation_name=>'unlock'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'vcnt number;',
'begin',
'if :P343_FINANCIAL_YEAR is null or :P343_FISCAL_PERIOD is null then',
'return ''Please choose the Payroll Period'';',
'end if;',
'If :P343_MEMBER_LIST is null then',
'return ''Please select the  staff to unlock '';',
'end if;',
'if :P343_MEMBER_LIST is not null then',
'select count(*) into vcnt from  E_HR.PAYSLIP1 ',
'where PS_C_ID = :P237_COMPANY',
'  and PS_FY_YEAR = :P237_FINANCIAL_YEAR and PS_FP_ID = :P237_FISCAL_PERIOD and nvl(PS_PAYROLL_STATUS,''D'' )= ''P''',
'  and PS_NO||''-''||PS_M_ID like :P237_MEMBER_LIST||''%'';',
'if vcnt <> 0 then',
'return ''Payroll for this staff is already posted . Unlock not Allowed...'';',
'End if;',
'end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(926302883963936448)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(942174587735988256)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalize Payroll'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P343_MEMBER_LIST is not null then ',
'update E_HR.PAYSLIP1 ',
'set PS_PAYROLL_STATUS = ''F'' ',
'where PS_C_ID = :comp ',
'  and PS_FY_YEAR = :P343_FINANCIAL_YEAR and PS_FP_ID = :P343_FISCAL_PERIOD ',
'  and nvl(PS_PAYROLL_STATUS,''D'') = ''D'' ',
'  and PS_NO||''-''||PS_M_ID like  :P343_MEMBER_LIST||''%'' ;',
'  --and PS_NO||''-''||PS_M_ID in (select C001 FROM APEX_COLLECTIONS where collection_name =''EMPLOYEES'');',
'ElsIf :P343_MEMBER_LIST is null then   ',
'update E_HR.PAYSLIP1 ',
'set PS_PAYROLL_STATUS = ''F'' ',
'where PS_C_ID = :comp ',
'  and PS_FY_YEAR = :P343_FINANCIAL_YEAR and PS_FP_ID = :P343_FISCAL_PERIOD ',
'  and nvl(PS_PAYROLL_STATUS,''D'') = ''D'' ;',
'End if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(926302740499936447)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(942180805304873702)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post Payroll'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P343_MEMBER_LIST is not null then ',
'update E_HR.PAYSLIP1 ',
'set PS_PAYROLL_STATUS = ''P'' ',
'where PS_C_ID = :comp ',
'  and PS_FY_YEAR = :P343_FINANCIAL_YEAR and PS_FP_ID = :P343_FISCAL_PERIOD ',
'  and nvl(PS_PAYROLL_STATUS,''D'') = ''F'' ',
'  and PS_NO||''-''||PS_M_ID like  :P343_MEMBER_LIST||''%'' ;',
'  --and PS_NO||''-''||PS_M_ID in (select C001 FROM APEX_COLLECTIONS where collection_name =''EMPLOYEES'');',
'ElsIf :P343_MEMBER_LIST is null then   ',
'update E_HR.PAYSLIP1 ',
'set PS_PAYROLL_STATUS = ''P'' ',
'where PS_C_ID = :comp ',
'  and PS_FY_YEAR = :P343_FINANCIAL_YEAR and PS_FP_ID = :P343_FISCAL_PERIOD ',
'  and nvl(PS_PAYROLL_STATUS,''D'') = ''F'' ;',
'End if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(926303088079936450)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(942174862840985982)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unlock Payroll'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P343_MEMBER_LIST is not null then ',
'update E_HR.PAYSLIP1 ',
'set PS_PAYROLL_STATUS = ''D'' ',
'where PS_C_ID = :comp ',
'  and PS_FY_YEAR = :P343_FINANCIAL_YEAR and PS_FP_ID = :P343_FISCAL_PERIOD ',
'  and nvl(PS_PAYROLL_STATUS,''D'') = ''F'' ',
'  and PS_NO||''-''||PS_M_ID like :P237_MEMBER_LIST||''%'' ;',
'End if;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(926302883963936448)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1039674107647321634)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PAYROLL GA POSTING'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'GA_VNO1 VARCHAR2(100);',
'VN_DT VARCHAR2(40);',
'PK_ID NUMBER;',
'MEMB VARCHAR2(400);',
'AC_CR_ID NUMBER;',
'AC_CD_ID NUMBER;',
'JV_CNT NUMBER:=0;',
'JV_PK NUMBER;',
'JV_TYP NUMBER;',
'FISC_TO_DT DATE;',
'BEGIN ',
'    IF :P343_FISCAL_PERIOD IS NOT NULL AND :P343_FINANCIAL_YEAR IS NOT NULL AND :COMP IN (127,242) THEN',
'        BEGIN',
'            SELECT ',
'                TO_CHAR(FP_FROM, ''MON/YYYY'') INTO VN_DT',
'            FROM E_HR.FISCAL_PERIOD WHERE FP_FY_C_ID=:COMP AND FP_ID=:P343_FISCAL_PERIOD;',
'            SELECT ',
'                FP_TO INTO FISC_TO_DT',
'            FROM E_HR.FISCAL_PERIOD WHERE FP_FY_C_ID=:COMP AND FP_ID=:P343_FISCAL_PERIOD;',
'        EXCEPTION WHEN OTHERS THEN',
'                NULL;',
'        END;',
'        GA_VNO1:=''PAY/''||VN_DT;',
'        SELECT COUNT(*) INTO JV_CNT FROM ERP_GL.JV WHERE JV_C_ID=:COMP AND JV_VNO=GA_VNO1;',
'',
'        select SEQ_ID INTO JV_TYP from ERP_GL.SEQ where SEQ_C_ID=:COMP and TR_SEQ_ID IN (5);',
'        IF JV_CNT = 0 THEN',
'            SELECT MAX(JV_ID)+1 INTO JV_PK FROM ERP_GL.JV;',
'            INSERT INTO ERP_GL.JV (',
'                JV_C_ID,',
'                JV_ID,',
'                JV_VNO,',
'                JV_MDATE,',
'                JV_DES,',
'                JV_CR_ID,',
'                JV_CURRATE,',
'                JV_SN_ID,',
'                JV_ISDUM,',
'                JV_CREATE_BY,',
'                JV_CREATE_DATE,',
'                JV_TYPE,',
'                JV_BRANCH,',
'                JV_REFERENCE',
'            )',
'            VALUES (',
'                :COMP,',
'                JV_PK,',
'                GA_VNO1,',
'                FISC_TO_DT,',
'                ''-'',',
'                NULL,',
'                NULL,',
'                NULL,',
'                0,',
'                :USER_ROLE_NAME,',
'                SYSDATE,',
'                JV_TYP,',
'                NULL,',
'                ''-''',
'            );',
'        ELSE',
'            SELECT JV_ID INTO JV_PK FROM ERP_GL.JV WHERE JV_C_ID=:COMP AND JV_VNO=GA_VNO1;',
'        END IF ;',
'',
'        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127 P343_MEMBER_LIST:''||:P343_MEMBER_LIST_1);',
'        IF :P343_MEMBER_LIST_1 IS NOT NULL THEN ',
'            DELETE FROM ERP_GL.GA WHERE GA_C_ID=:COMP AND GA_VNO =GA_VNO1 AND GA_REF_COPY=''PAYROLL_POST'' AND GA_STAFF=:P343_MEMBER_LIST_1;',
'            INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127 P343_MEMBER_LIST_1 INSIDE:''||:P343_MEMBER_LIST_1);',
'        ELSIF :P343_SECTION IS NOT NULL THEN ',
'            DELETE FROM ERP_GL.GA WHERE GA_C_ID=:COMP AND GA_VNO =GA_VNO1 AND GA_REF_COPY=''PAYROLL_POST'' AND GA_STAFF IN (SELECT GA_STAFF FROM ERP_GL.GA ',
'                LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=GA_C_ID AND M_NO||''-''||M_ID=GA_STAFF',
'                WHERE GA_C_ID=:COMP ',
'                AND GA_VNO =GA_VNO1 ',
'                AND GA_REF_COPY=''PAYROLL_POST''',
'                AND M_SECTION=:P343_SECTION);',
'        --     -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127 P343_MEMBER_LIST_1 INSIDE:''||:P343_MEMBER_LIST_1);',
'        ELSE',
'            DELETE FROM ERP_GL.GA WHERE GA_C_ID=:COMP AND GA_VNO =GA_VNO1 AND GA_REF_COPY=''PAYROLL_POST'';',
'        END IF;',
'        -- CREDIT POSTING ADDITION',
'        FOR I IN (SELECT  AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AH_AMOUNT) AS CR_AMT,AH_NAME',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        -- and PS_NO=''AD'' AND PS_M_ID=1016',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND PS_AH_TYPE =''A''',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        GROUP BY AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,AH_NAME)',
'                    LOOP',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                I.AH_CR_AC_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Basic Salary-(Addition: ''||I.AH_NAME||'')''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'        END LOOP;',
'',
'        -- DEBIT POSTING ADDITION',
'        FOR I IN (SELECT  AH_DR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,PS_AH_AMOUNT AS CR_AMT,AH_CR_AC_ID,AH_NAME',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND PS_AH_TYPE =''A''',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        -- GROUP BY AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                I.AH_DR_AC_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Basic Salary-(Addition: ''||I.AH_NAME||'')''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'        END LOOP;',
'',
'        -- CREDIT POSTING ADDITION',
'        FOR I IN (SELECT  AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AH_AMOUNT) AS CR_AMT,AH_NAME',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        -- and PS_NO=''AD'' AND PS_M_ID=1016',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND PS_AH_TYPE =''D''',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        GROUP BY AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,AH_NAME)',
'                    LOOP',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                I.AH_CR_AC_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Basic Salary-(Deducion: ''||I.AH_NAME||'')''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'        END LOOP;',
'',
'        -- DEBIT POSTING ADDITION',
'        FOR I IN (SELECT  AH_DR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,PS_AH_AMOUNT AS CR_AMT,AH_CR_AC_ID,AH_NAME',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND PS_AH_TYPE =''D''',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        -- GROUP BY AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                I.AH_DR_AC_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Basic Salary-(Deduction: ''||I.AH_NAME||'')''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'        END LOOP;',
'',
'        -- CREDIT POSTING OT',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_OT_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID)',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_CR_AC_ID INTO AC_CR_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''A'' AND AH_NAME=''OT'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        ',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                AC_CR_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''OT-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'                    END IF;',
'                END LOOP;',
'',
'        -- DEBIT POSTING OT',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_OT_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_DR_AC_ID INTO AC_CD_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''A'' AND AH_NAME=''OT'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                AC_CD_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''OT-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'                    END IF;',
'        END LOOP;',
'',
'        -- CREDIT POSTING LEAVE DEDUCTION',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_CR_AC_ID INTO AC_CR_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''D'' AND AH_NAME=''Leave Deduction'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                AC_CR_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Leave Deduction-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'                    END IF;            ',
'        END LOOP;',
'',
'        -- DEBIT POSTING LEAVE DEDUCTION',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR.MEMBER_HEAD ON M_C_ID=PS_C_ID AND M_NO||''-''||M_ID=PS_NO||''-''||PS_M_ID',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND PS_NO NOT IN (''OGES'')',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        AND (M_SECTION =:P343_SECTION OR :P343_SECTION IS NULL)',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        ',
'                        )',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_DR_AC_ID INTO AC_CD_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''D'' AND AH_NAME=''Leave Deduction'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(FISC_TO_DT,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                AC_CD_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Leave Deduction-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'                    END IF;',
'        END LOOP;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(926303088079936450)
,p_process_when=>':COMP IN (127,242)'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Success.'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1054298426188445133)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PAYROLL GA POSTING_225'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'GA_VNO1 VARCHAR2(100);',
'VN_DT VARCHAR2(40);',
'PK_ID NUMBER;',
'MEMB VARCHAR2(400);',
'AC_CR_ID NUMBER;',
'AC_CD_ID NUMBER;',
'JV_CNT NUMBER:=0;',
'JV_PK NUMBER;',
'JV_TYP NUMBER;',
'BEGIN ',
'    IF :P343_FISCAL_PERIOD IS NOT NULL AND :P343_FINANCIAL_YEAR IS NOT NULL AND :COMP IN (127,242) THEN',
'        BEGIN',
'            SELECT ',
'                TO_CHAR(FP_FROM, ''MON/YYYY'') INTO VN_DT',
'            FROM E_HR.FISCAL_PERIOD WHERE FP_FY_C_ID=:COMP AND FP_ID=:P343_FISCAL_PERIOD;',
'        EXCEPTION WHEN OTHERS THEN',
'                NULL;',
'        END;',
'        GA_VNO1:=''PAY/''||VN_DT;',
'        SELECT COUNT(*) INTO JV_CNT FROM ERP_GL.JV WHERE JV_C_ID=:COMP AND JV_VNO=GA_VNO1;',
'',
'        select SEQ_ID INTO JV_TYP from ERP_GL.SEQ where SEQ_C_ID=:COMP and TR_SEQ_ID IN (5);',
'        IF JV_CNT = 0 THEN',
'            SELECT MAX(JV_ID)+1 INTO JV_PK FROM ERP_GL.JV;',
'            INSERT INTO ERP_GL.JV (',
'                JV_C_ID,',
'                JV_ID,',
'                JV_VNO,',
'                JV_MDATE,',
'                JV_DES,',
'                JV_CR_ID,',
'                JV_CURRATE,',
'                JV_SN_ID,',
'                JV_ISDUM,',
'                JV_CREATE_BY,',
'                JV_CREATE_DATE,',
'                JV_TYPE,',
'                JV_BRANCH,',
'                JV_REFERENCE',
'            )',
'            VALUES (',
'                :COMP,',
'                JV_PK,',
'                GA_VNO1,',
'                SYSDATE,',
'                ''-'',',
'                NULL,',
'                NULL,',
'                NULL,',
'                0,',
'                :USER_ROLE_NAME,',
'                SYSDATE,',
'                JV_TYP,',
'                NULL,',
'                ''-''',
'            );',
'        ELSE',
'            SELECT JV_ID INTO JV_PK FROM ERP_GL.JV WHERE JV_C_ID=:COMP AND JV_VNO=GA_VNO1;',
'        END IF ;',
'',
'        INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127 P343_MEMBER_LIST:''||:P343_MEMBER_LIST_1);',
'        IF :P343_MEMBER_LIST_1 IS NOT NULL THEN ',
'            DELETE FROM ERP_GL.GA WHERE GA_C_ID=:COMP AND GA_VNO =GA_VNO1 AND GA_REF_COPY=''PAYROLL_POST'' AND GA_STAFF=:P343_MEMBER_LIST_1;',
'            INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127 P343_MEMBER_LIST_1 INSIDE:''||:P343_MEMBER_LIST_1);',
'        ELSE',
'            DELETE FROM ERP_GL.GA WHERE GA_C_ID=:COMP AND GA_VNO =GA_VNO1 AND GA_REF_COPY=''PAYROLL_POST'';',
'        END IF;',
'        -- CREDIT POSTING ADDITION',
'        FOR I IN (SELECT  AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AH_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        -- and PS_NO=''AD'' AND PS_M_ID=1016',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        GROUP BY AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID)',
'                    LOOP',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(I.PS_LAST_UPDATE,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                I.AH_CR_AC_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Basic Salary-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'        END LOOP;',
'',
'        -- DEBIT POSTING ADDITION',
'        FOR I IN (SELECT  AH_DR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,PS_AH_AMOUNT AS CR_AMT,AH_CR_AC_ID',
'                    FROM E_HR.PAYSLIP1',
'                    LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        -- GROUP BY AH_CR_AC_ID,PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(I.PS_LAST_UPDATE,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                I.AH_DR_AC_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Basic Salary-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'        END LOOP;',
'',
'        -- CREDIT POSTING OT',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_OT_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID)',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_CR_AC_ID INTO AC_CR_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''A'' AND AH_NAME=''OT'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        ',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(I.PS_LAST_UPDATE,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                AC_CR_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''OT-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'                    END IF;',
'                END LOOP;',
'',
'        -- DEBIT POSTING OT',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_OT_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_DR_AC_ID INTO AC_CD_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''A'' AND AH_NAME=''OT'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(I.PS_LAST_UPDATE,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                AC_CD_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''OT-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'                    END IF;',
'        END LOOP;',
'',
'        -- CREDIT POSTING DEDUCTION',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        )',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_CR_AC_ID INTO AC_CR_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''D'' AND AH_NAME=''Leave Deduction'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(I.PS_LAST_UPDATE,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                NULL,',
'                                JV_PK,',
'                                0,',
'                                0,',
'                                AC_CR_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Leave Deduction-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'');',
'                    END IF;            ',
'        END LOOP;',
'',
'        -- DEBIT POSTING DEDUCTION',
'        FOR I IN (SELECT  PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID,SUM(PS_AMOUNT) AS CR_AMT',
'                    FROM E_HR.PAYSLIP1',
'                    -- LEFT JOIN E_HR."AC_HEADS" ON PS_C_ID=AH_C_ID AND PS_AH_ID=AH_ID',
'                        WHERE PS_FY_YEAR = :P343_FINANCIAL_YEAR AND PS_FP_ID = :P343_FISCAL_PERIOD',
'                        -- WHERE PS_FY_YEAR = 44 AND PS_FP_ID = 209',
'                        AND (PS_NO||''-''||PS_M_ID=:P343_MEMBER_LIST_1 OR :P343_MEMBER_LIST_1 IS NULL)',
'                        AND PS_C_ID= :COMP ',
'                        GROUP BY PS_LAST_UPDATE,PS_FP_ID,PS_FY_YEAR,PS_NO,PS_M_ID',
'                        ',
'                        )',
'                    LOOP',
'                    IF I.CR_AMT > 0 THEN',
'                        SELECT NVL(MAX(GA_ID)+1,1) INTO PK_ID FROM ERP_GL.GA;',
'                        -- INSERT INTO ERP_GL.ERROR_LOG_L VALUES(''TEST 127:''||GA_VNO1);',
'                        BEGIN',
'                            SELECT M_NO||''-''||M_ID||'' ''||M_NAME INTO MEMB FROM E_HR.MEMBER_HEAD WHERE M_C_ID=:COMP AND M_NO||''-''||M_ID=I.PS_NO||''-''||I.PS_M_ID;',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                        BEGIN',
'                            SELECT AH_DR_AC_ID INTO AC_CD_ID FROM E_HR."AC_HEADS" WHERE AH_C_ID=:COMP AND AH_TYPE=''D'' AND AH_NAME=''Leave Deduction'';',
'                            EXCEPTION WHEN OTHERS THEN',
'                                NULL;',
'                        END;',
'                            INSERT INTO ERP_GL.GA(',
'                                GA_ID,',
'                                GA_VNO,',
'                                GA_C_ID,',
'                                GA_MDATE,',
'                                GA_SEQ_ID,',
'                                GA_CR_CURAMOUNT,',
'                                GA_CR_AMOUNT,',
'                                GA_SN_ID,',
'                                GA_TR_ID,',
'                                GA_AMOUNT,',
'                                GA_CURAMOUNT,',
'                                GA_AC_ID,',
'                                GA_ISDUM,',
'                                GA_REF,',
'                                GA_TR_SEQ_ID,',
'                                GA_DES,',
'                                GA_STAFF,',
'                                GA_REF_COPY,',
'                                GA_TAG) ',
'                                values',
'                                (PK_ID,',
'                                GA_VNO1,',
'                                :COMP,',
'                                TO_DATE(I.PS_LAST_UPDATE,''DD/MM/YYYY''),',
'                                JV_TYP,',
'                                0,',
'                                0,',
'                                NULL,',
'                                JV_PK,',
'                                I.CR_AMT,',
'                                I.CR_AMT,',
'                                AC_CD_ID,',
'                                0,',
'                                '''',',
'                                5,',
'                                ''Leave Deduction-''||VN_DT||'', ''||MEMB,',
'                                I.PS_NO||''-''||I.PS_M_ID,',
'                                ''PAYROLL_POST'',',
'                                8);',
'                    END IF;',
'        END LOOP;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(926303088079936450)
,p_process_when=>':COMP IN (127) AND 1=2'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Success.'
);
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
