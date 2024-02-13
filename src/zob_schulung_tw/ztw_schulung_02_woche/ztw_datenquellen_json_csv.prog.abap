*&---------------------------------------------------------------------*
*& Report ztw_datenquellen_json_csv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_datenquellen_json_csv.

**
***"Übung: CSV
***"Laden Sie eine CSV Datei hoch und verarbeiten Sie die Daten.
***
*DATA lt_csv_data TYPE truxs_t_text_data.
*DATA: BEGIN OF ls_organization,
*        index               TYPE i,
*        organization_Id     TYPE string,
*        name                TYPE string,
*        website             TYPE string,
*        country             TYPE string,
*        description         TYPE string,
*        founded             TYPE gjahr,
*        industry            TYPE string,
*        number_of_employees TYPE i,
*      END OF ls_organization,
*      lt_organizations LIKE TABLE OF ls_organization.
*
*
*CALL FUNCTION 'GUI_UPLOAD'
*  EXPORTING
*    filename = 'C:\Users\waldhauser.thea\Desktop\Neuer Ordner\Datenquellen_organizations.csv'
*  TABLES
*    data_tab = lt_csv_data.
**
**
**DATA(lv_headerline) = lt_csv_data[ 1 ].
**
*DELETE lt_csv_data INDEX 1.
*
**cl_demo_output=>display( lt_csv_data ).
*
*CALL FUNCTION 'TEXT_CONVERT_CSV_TO_SAP'
*  EXPORTING
*    i_tab_raw_data       = lt_csv_data
*  TABLES
*    i_tab_converted_data = lt_organizations.
**
**cl_demo_output=>display( lt_organizations ).
**
**"Übung: Download
**"Laden Sie eine veränderte Version der CSV Datei herunter.
**
*LOOP AT lt_organizations ASSIGNING FIELD-SYMBOL(<line>) WHERE founded >= 2000.
*  DELETE lt_organizations.
*ENDLOOP.
**
**cl_demo_output=>display( lt_organizations ).
**
*CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'
*  EXPORTING
*    i_field_seperator    = ';'
*  TABLES
*    i_tab_sap_data       = lt_organizations
*  CHANGING
*    i_tab_converted_data = lt_csv_data
*  EXCEPTIONS
*    conversion_failed    = 1
*    OTHERS               = 2.
*
*IF sy-subrc <> 0 .
*  WRITE 'Oh no'.
*  EXIT.
*ENDIF.
**
**cl_demo_output=>display( lt_csv_data ).
*
**INSERT lv_headerline INTO lt_csv_data INDEX 1.
**
*CALL FUNCTION 'GUI_DOWNLOAD'
*  EXPORTING
*    filename = 'C:\Users\waldhauser.thea\Desktop\Neuer Ordner\Datenquellen_organizations_2.csv'
*  TABLES
*    data_tab = lt_csv_data.
*










SELECT SINGLE
FROM
scarr
FIELDS *
INTO @DATA(ls_1).
cl_demo_output=>display( ls_1 ).

SELECT
FROM scarr
FIELDS *
INTO TABLE @DATA(lt_2).
cl_demo_output=>display( lt_2 ).
