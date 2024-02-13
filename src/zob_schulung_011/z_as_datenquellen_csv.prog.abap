*&---------------------------------------------------------------------*
*& Report z_as_datenquellen_csv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_datenquellen_csv.

DATA lt_csv_data TYPE truxs_t_text_data.
DATA: BEGIN OF ls_organization,
        index             TYPE i,
        organization_Id   TYPE string,
        name              TYPE string,
        website           TYPE string,
        country           TYPE string,
        description       TYPE string,
        founded           TYPE string,
        industry          TYPE string,
        numberofemployees TYPE i,
      END OF ls_organization,
      lt_organization LIKE TABLE OF ls_organization.

CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    filename = 'C:\Users\SEVLI.AHMET\Desktop\SAP ABAP BOOTCAMP\Datenquellen_organizations.csv'
  TABLES
    data_tab = lt_csv_data.

DATA(lv_headerline) = lt_csv_data[ 1 ].
DELETE lt_csv_data INDEX 1.



CALL FUNCTION 'TEXT_CONVERT_CSV_TO_SAP'
  EXPORTING
    i_tab_raw_data       = lt_csv_data
  TABLES
    i_tab_converted_data = lt_organization.

*cl_demo_output=>display( lt_organization ).

LOOP AT lt_organization ASSIGNING FIELD-SYMBOL(<line>) WHERE founded >= 2000.
  DELETE lt_organization.
ENDLOOP.

cl_demo_output=>display( lt_organization ).

CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'
  EXPORTING
    i_field_seperator    = ';'
  TABLES
    i_tab_sap_data       = lt_organization
  CHANGING
    i_tab_converted_data = lt_csv_data
  EXCEPTIONS
    conversion_failed    = 1
    OTHERS               = 2.

INSERT lv_headerline INTO lt_csv_data INDEX 1.

CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
    filename = 'C:\Users\SEVLI.AHMET\Desktop\SAP ABAP BOOTCAMP\Datenquellen_organizations_2.csv'
  TABLES
    data_tab = lt_csv_data.
