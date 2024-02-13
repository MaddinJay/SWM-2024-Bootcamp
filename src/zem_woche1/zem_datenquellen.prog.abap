*&---------------------------------------------------------------------*
*& Report zem_datenquellen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_datenquellen.

****  von Denise ..nachmachen

*SELECT
*  FROM
*    scustom
*  FIELDS
*    *
*  WHERE name LIKE 'Sa%'
*  INTO TABLE @DATA(lt_customers).
*
*LOOP AT lt_customers INTO DATA(ls_customer).
*  "Kopie
*  ls_customer-postbox = 'A-22'.
*  MODIFY lt_customers FROM ls_customer.
*ENDLOOP.
*
*LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
*  "Datenreferenz
*  "Zeigen auf Objekte
*  "dereferenzieren ->
*  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code
*
*  lo_customer->webuser = lo_customer->name(10).
*ENDLOOP.
*
*LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
*  "Feldsymbol (Field-Symbol):
*  "Zeiger/Pointer
*  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
*  "Schneller => nutzen bei performance-kritischen Operationen
*
*  <fs_customer>-telephone = 012324234.
*ENDLOOP.


*Select
*from scustom
*Fields *ata
*Where name like 'SAP%'
*Into Table @Data(lt_custom).
*
*Loop at lt_custom Into Data(ls_custom).
*ls_custom-country = 'LA'.
*Modify lt_custom from ls_custom.
*Endloop.
*
*cl_demo_output=>display( lt_custom ).

**********************************************************************
*Excel hochladen und infos in Tabelle

Data lt_csv_data type truxs_t_text_data.

Data: begin of ls_1,
        index               TYPE i,
        organization_Id     TYPE string,
        name                TYPE string,
        website             TYPE string,
        country             TYPE string,
        description         TYPE string,
        founded             TYPE gjahr,
        industry            TYPE string,
        number_of_employees TYPE i,
        End of ls_1,
        lt_1 like table of ls_1.

Call FUNCTION 'GUI_UPLOAD'
  EXPORTING
   filename = 'C:\Users\eisenreich.michael\Desktop\Zwischenablage\Datenquellen_organizations.csv'
  TABLES
  data_tab = lt_csv_data.


DELETE lt_csv_data INDEX 1.

cl_demo_output=>display( lt_csv_data ).

CALL FUNCTION 'TEXT_CONVERT_CSV_TO_SAP'
  EXPORTING
    i_tab_raw_data       = lt_csv_data
  TABLES
    i_tab_converted_data = lt_1.
*
cl_demo_output=>display( lt_1 ).
*
*"Übung: Download
*"Laden Sie eine veränderte Version der CSV Datei herunter.
*
LOOP AT lt_1 ASSIGNING FIELD-SYMBOL(<line>) WHERE founded >= 2000.
  DELETE lt_1.
ENDLOOP.
*
*cl_demo_output=>display( lt_organizations ).
*
CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'
  EXPORTING
    i_field_seperator    = ';'
  TABLES
    i_tab_sap_data       = lt_1
  CHANGING
    i_tab_converted_data = lt_csv_data
  EXCEPTIONS
    conversion_failed    = 1
    OTHERS               = 2.


IF sy-subrc = 0.
Write 'yes'.
Else. Write 'No'.
Endif.


*INSERT lv_headerline INTO lt_csv_data INDEX 1.
*
CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
    filename = 'C:\Users\eisenreich.michael\Desktop\Zwischenablage\Datenquellen_organizations_2.csv'
  TABLES
    data_tab = lt_csv_data.



cl_demo_output=>display( lt_csv_data ).
