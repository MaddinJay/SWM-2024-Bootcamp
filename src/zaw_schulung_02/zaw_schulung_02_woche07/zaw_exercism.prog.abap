*&---------------------------------------------------------------------*
*& Report zaw_exercism
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_exercism.

parameters p_year type i.

DATA: lv_result TYPE abap_bool,
      lv_year type i.

DATA lo_leap TYPE REF TO zaw_gc_exercism.  " Referenzobjekt zur Klasse erzeugen
lo_leap = NEW #( ).                        " Create Object (mit Referenzobjekt die Instanz erzeugen)

lv_year = p_year.                             " lokaler Variablen einen Wert zuweisen
lv_result = lo_leap->leap( lv_year ).       " Methode aus der Klasse aufrufen mit lokaler Variable, die exportiert wird



IF lv_result = abap_true.
  WRITE: / |Das Jahr { lv_year } ist ein Schaltjahr.|.
ELSE.
  WRITE: / |Das Jahr { lv_year } ist KEIN Schaltjahr.|.
ENDIF.
