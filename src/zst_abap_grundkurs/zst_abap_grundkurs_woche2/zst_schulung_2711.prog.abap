*&---------------------------------------------------------------------*
*& Report zst_schulung_2711
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_2711.

* Wiederholung Woche 1

"Datendeklaration
"Elementarer Typ deklarieren
*DATA lv_zahl TYPE i VALUE 3.

"Variable ausgeben
*WRITE lv_zahl.
*cl_demo_output=>display( lv_zahl ).

"Datenmainpulation
*lv_zahl = lv_zahl + 8 .

"Systemwerte
*WRITE sy-uname.

"Konstanten
*CONSTANTS c_wert TYPE string VALUE 'Test'.
*
*"Typdeklaration
*TYPES: ty_wert(6) TYPE c,
*       ty_wert2   TYPE c LENGTH 6.
*
*
*"Struktur deklarieren
*DATA: BEGIN OF ls_kunde,
*        id    TYPE i,
*        name  TYPE string,
*        alter TYPE i,
*      END OF ls_kunde.

*"Struktur befüllen
*ls_kunde-id = 5.
*ls_kunde-name = 'Test'.
*cl_demo_output=>display( ls_kunde ).
*ls_kunde = VALUE #( id = 7 ). "id wird geändert, alle anderen Werte, die nicht genannt werden, werden gelöscht.
*ls_kunde = VALUE #( BASE ls_kunde  name = 'Testi' ). "Durch 'Base' wird der mitgegebene Wert ergänzt bei "ls_Kunde)
*cl_demo_output=>display( ls_kunde ).

"Tabelle deklarieren
*DATA: lt_tabelle LIKE TABLE OF ls_kunde.
*"Tabelle befüllen
*APPEND ls_kunde TO lt_tabelle.
*APPEND VALUE #( id = 5 ) TO lt_tabelle.
*INSERT ls_kunde INTO lt_tabelle INDEX 1.
*lt_tabelle = VALUE #( BASE lt_tabelle
*                  ( id = 8  name = 'Name 1' alter = 12 )
*                  ( id = 12 name = 'Name 2' alter = 7 )
*                  ).
*lt_tabelle = VALUE #(
*                  ( id = 8  name = 'Name 3' alter = 12 )
*                  ).
*
*WRITE 'Test'.

"Schleife
"Loop -> Tabellen
"While Bed
"do x Times.

"Verzweigung
"if
"case
*if ls_kunde-alte = 10 AND ls_kunde-name = 'Test'.

*"Beispiel INSERT
*"Option 1
*INSERT INTO scarr VALUES @( VALUE
*        #(
*           carrid = 'XX'
*           carrname = 'X Flights'
*           currcode = 'EUR') ).
*IF sy-subrc = 0.
*  WRITE 'Insert Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 1 - Das hat nicht geklappt.'.
*ENDIF.

*"Übung: Insert
*"Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.
*DATA ls_Fluggesellschaft TYPE scarr. "Option 1
*ls_fluggesellschaft = VALUE #(       "Option 1
*DATA(ls_fluggesellschaft) = VALUE scarr( "Option 2
*                         carrid = 'XY'
*                         carrname = 'XY Flights'
*                         currcode = 'EUR' ).
*INSERT scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.

*"Beispiel UPDATE
*ls_fluggesellschaft-carrname = 'Y Flying'.
*
*"Option 1
*UPDATE scarr SET currcode = 'USD' WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Update Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Update Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
"Option 2
*SELECT SINGLE
*  FROM
*  scarr
*  FIELDS
*  *
*  WHERE carrid = 'XY'
*  INTO @DATA(ls_fluggesellschaft2).
*
*  ls_fluggesellschaft2-carrname = 'Y Flying'.
*  ls_fluggesellschaft2-url = ''.
*
*UPDATE scarr FROM ls_fluggesellschaft2.
*IF sy-subrc = 0.
*  WRITE 'Update Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Update Option 2 - Das hat nicht geklappt.'.
*ENDIF.


*"Beispiel DELETE
*
*"Option 1
*DELETE FROM scarr WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Option 2
*DATA ls_Fluggesellschaft TYPE scarr.
*ls_fluggesellschaft-carrid = 'XY'.
*DELETE scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 2 - Das hat nicht geklappt.'.
*ENDIF.

"Datenreferenz

*SELECT
*  FROM
*    scustom
*  FIELDS
*    *
*  WHERE name LIKE 'Sa%'
*  INTO TABLE @DATA(lt_customers).
*
*"Option 1
*LOOP AT lt_customers INTO DATA(ls_customer).
*  "Kopie
*  ls_customer-postbox = 'A-22'.
*  MODIFY lt_customers FROM ls_customer.
*ENDLOOP.
*
*"Option 2
*LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
*  "Datenreferenz
*  "Zeigen auf Objekte
*  "dereferenzieren ->
*  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code
*  lo_customer->postbox = 'B11'.
*ENDLOOP.
*
*"Option 3
*LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
*  "Feldsymbol (Field-Symbol):
*  "Zeiger/Pointer
*  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
*  "Schneller => nutzen bei performance-kritischen Operationen
*  <fs_customer>-postbox = 'S1'.
*ENDLOOP.


**********************************************************************

**"Übung: CSV
**"Laden Sie eine CSV Datei hoch und verarbeiten Sie die Daten.
**
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
*    filename = 'C:\thieme.sebastian\Desktop\Videos\Datenquellen_organizations.csv'
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
*    filename = 'C:\Users\thieme.sebastian\Desktop\Videos\Datenquellen_organizations_2.csv'
*  TABLES
*    data_tab = lt_csv_data.

**********************************************************************

**"Übung: JSON
**"Wandeln Sie JSON Daten in eine interne Tabelle um.
**
TYPES: BEGIN OF ts_json,
         key   TYPE string,
         value TYPE string,
       END OF ts_json.
DATA:  ls_jsondata TYPE ts_json.

*cl_demo_output=>display( ls_jsondata ).

DATA(lv_jsondata) = '{ "key": "1", "value": "One" }'.

/ui2/cl_json=>deserialize(
  EXPORTING json = CONV #( lv_jsondata )
  CHANGING data = ls_jsondata
).

cl_demo_output=>display( ls_jsondata ).
*
*EXIT.
*
*DATA(ls_jsondata2) = '{ "animals" :[{ "type": "cat", "name": "Tishka", "age": 5, "loves": "sausage", "breed": "red cat" }, { "type": "dog", "name": "Tuzik", "age": 5, "breed": "Ovcharka", "hobby": "throw a ball" } ]}'.
*
*TYPES:
*  BEGIN OF ts_animal_characteristics,
*    type  TYPE string,
*    name  TYPE string,
*    age   TYPE string,
*    loves TYPE string,
*    breed TYPE string,
*  END OF ts_animal_characteristics,
*  tt_animals TYPE STANDARD TABLE OF ts_animal_characteristics WITH EMPTY KEY.
*
*DATA: BEGIN OF ls_animals,
*        animals TYPE tt_animals,
*      END OF ls_animals.
*
*/ui2/cl_json=>deserialize(
*  EXPORTING json = CONV #( ls_jsondata2 )
*  CHANGING data = ls_animals
*).
*
*cl_demo_output=>display( ls_animals-animals ).
*WRITE ''.
