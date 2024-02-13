*&---------------------------------------------------------------------*
*& Report zaw_uebung_csv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_csv.


*** Laden Sie eine CSV Datei hoch und verarbeiten Sie die Daten.

DATA lt_csv_data TYPE truxs_t_text_data.

DATA: BEGIN OF ls_organization,           "Struktur für interne Tabelle aufbauen
        index               TYPE i,
        organization_Id     TYPE string,
        name                TYPE string,
        website             TYPE string,
        country             TYPE string,
        description         TYPE string,
        founded             TYPE gjahr,
        industry            TYPE string,
        number_of_employees TYPE i,
      END OF ls_organization,
      lt_organizations LIKE TABLE OF ls_organization.

CALL FUNCTION 'GUI_UPLOAD'  "Funktionsbaustein zum Hochladen der Datei temporär
  EXPORTING
    filename = 'C:\Users\weiland.antje\Desktop\SAP Boot Camp\Datenquellen_organizations.csv' "Link zur CSV-Datei
  TABLES
    data_tab = lt_csv_data.

DATA(lv_headerline) = lt_csv_data[ 1 ]. "Erste Zeile der CSV-Datei für später speichern.
DELETE lt_csv_data INDEX 1.             "Erste Zeile der CSV-Datei kann bei Bedarf gelöscht werden.

CALL FUNCTION 'TEXT_CONVERT_CSV_TO_SAP'     "Funktionsbaustein zum Konvertieren (oben definierte Struktur auf die CSV-Datei anwenden)
  EXPORTING
    i_tab_raw_data       = lt_csv_data
  TABLES
    i_tab_converted_data = lt_organizations.

cl_demo_output=>display( lt_organizations ).

LOOP AT lt_organizations ASSIGNING FIELD-SYMBOL(<line>) WHERE founded >= 2000.  "Organisationen, die ab dem Jahr 2000 gegründet wurden, werden gelöscht
  DELETE lt_organizations.
ENDLOOP.

CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'    "Funktionsbaustein zum Konvertieren zurück zur CSV-Datei
  EXPORTING
    i_field_seperator    = ';'
  TABLES
    i_tab_sap_data       = lt_organizations
  CHANGING
    i_tab_converted_data = lt_csv_data
  EXCEPTIONS
    conversion_failed    = 1
    OTHERS               = 2.

IF sy-subrc <> 0.
  WRITE 'Oh nein!'.
  EXIT.
ENDIF.

INSERT lv_headerline INTO lt_csv_data INDEX 1.  "Erste Zeile vor dem Runterladen wieder einfügen.

CALL FUNCTION 'GUI_DOWNLOAD'    "Funktionsbaustein zum Runterladen der Datei -> Namen zur eindeutigen Identifikation ändern
  EXPORTING
    filename = 'C:\Users\weiland.antje\Desktop\SAP Boot Camp\Datenquellen_organizations_bearbeitet.csv'
  TABLES
    data_tab = lt_csv_data.
