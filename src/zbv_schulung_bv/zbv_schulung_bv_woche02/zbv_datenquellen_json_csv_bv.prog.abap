*&---------------------------------------------------------------------*
*& Report zbv_datenquellen_json_csv_bv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_datenquellen_json_csv_bv.

*"Übung: CSV
*"Laden Sie eine CSV Datei hoch und verarbeiten Sie die Daten.
*
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
*"Datei hochladen
*CALL FUNCTION 'GUI_UPLOAD'
*  EXPORTING
*    filename = 'C:\Users\VELETANLIC.BENJAMI\Desktop\Datenquellen_organizations.csv'
*  TABLES
*    data_tab = lt_csv_data.
*
*"Headerzeile speichern
*DATA(lv_headerline) = lt_csv_data[ 1 ].
*
*"Headerzeile löschen
*DELETE lt_csv_data INDEX 1.
*
**cl_demo_output=>display( lt_csv_data ).
*
*"Hochgeladen Informationen in Tabelle umwandeln
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
*"Header wieder einfügen
*INSERT lv_headerline INTO lt_csv_data INDEX 1.
*
*"Tabelle herunterladen
*CALL FUNCTION 'GUI_DOWNLOAD'
*  EXPORTING
*    filename = 'C:\Users\VELETANLIC.BENJAMI\Desktop\Datenquellen_organizations_3.csv'
*  TABLES
*    data_tab = lt_csv_data.

**
*************************************************************************
"Übung: JSON
"Wandeln Sie JSON Daten in eine interne Tabelle um.

*TYPES: BEGIN OF ts_json,
*         key1   TYPE string,
*         key2 TYPE string,
*       END OF ts_json.
*DATA:  ls_jsondata TYPE ts_json.
**
**cl_demo_output=>display( ls_jsondata ).
**
*DATA(lv_jsondata) = '{ "key1": "1", "key2": "One" }'.
***
*/ui2/cl_json=>deserialize(
*  EXPORTING json = CONV #( lv_jsondata )
*  CHANGING data = ls_jsondata
*).
**
*cl_demo_output=>display( ls_jsondata ).
**
**EXIT.
**
DATA(ls_jsondata2) = '{ "animals" :[{ "type": "cat", "name": "Tishka", "age": 5, "loves": "sausage", "breed": "red cat" }, { "type": "dog", "name": "Tuzik", "age": 5, "breed": "Ovcharka", "hobby": "throw a ball" } ]}'.
**
TYPES:
  BEGIN OF ts_animal_characteristics,
    type  TYPE string,
    name  TYPE string,
    age   TYPE string,
    loves TYPE string,
    breed TYPE string,
  END OF ts_animal_characteristics,
  tt_animals TYPE STANDARD TABLE OF ts_animal_characteristics.

DATA: BEGIN OF ls_animals,
        animals TYPE tt_animals,
      END OF ls_animals.
**
/ui2/cl_json=>deserialize(
  EXPORTING json = CONV #( ls_jsondata2 )
  CHANGING data = ls_animals
).
**
cl_demo_output=>display( ls_animals-animals ).
**WRITE ''.
