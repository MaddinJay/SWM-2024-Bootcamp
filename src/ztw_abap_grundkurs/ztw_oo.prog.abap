
*& Report ZTW_OO
*&---------------------------------------------------------------------*
REPORT ztw_oo.

*Klasse DEFINIEREN
CLASS lcl_vehicle DEFINITION. "lcl = 'Lokale KLasse'
  PUBLIC SECTION.

    DATA mv_make TYPE string. "mv = Member Variable
    DATA mv_model TYPE string.

*   DATA mv_model LIKE mv_make. "Weitere Schreibweise, bezieht sich mit "like" auf vorherige Deklaration


ENDCLASS.
**********************************************************************
*CLASS lcl_vehicle IMPLEMENTATION
**********************************************************************
*IMPLEMENTATION
CLASS lcl_vehicle IMPLEMENTATION.
ENDCLASS.

DATA: gr_ref TYPE REF TO lcl_vehicle. "Datenreferenz
CREATE OBJECT gr_ref. "Instanz erstellen
gr_ref->mv_make = 'Mercedes'.
gr_ref->mv_model = 'S-Klasse'.


DATA: gr_ref2 TYPE REF TO lcl_vehicle. "gr = Globale Referenz
CREATE OBJECT gr_ref2.
gr_ref2->mv_make = 'Audi'.
gr_ref2->mv_model = 'A3'.


DATA: gr_ref3 TYPE REF TO lcl_vehicle.
gr_ref3 = gr_ref2.
gr_ref3->mv_model = 'Q4'.


*Daten in eine Tabelle deklarieren
DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle. "grt = Globale Referenz Tabelle
APPEND gr_ref TO grt_ref.
APPEND gr_ref2 TO grt_ref.
APPEND gr_ref3 TO grt_ref.

*Auslesen der Tabelle auf einen ausgewählten Schlüssel
READ TABLE grt_ref INTO gr_ref
WITH KEY table_line->mv_make = 'Mercedes'.

*Schleifendurchlauf in 'gr_ref'
LOOP AT grt_ref INTO gr_ref.
  WRITE: gr_ref->mv_make, gr_ref->mv_model,/.
ENDLOOP.

Break-point.
