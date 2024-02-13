*&---------------------------------------------------------------------*
*& Report zbv_schulung_modify_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_modify_uebung.

SELECT
  FROM
  SCARR
  FIELDS
  *
  WHERE CARRID = 'LH'
  INTO TABLE @DATA(lt_test). "<-- kopiert die Tabelle aus der Datenbank (SQL) in eine interne Tabelle

LOOP AT lt_test into DATA(ls_test). "<-- Loopt durch die interne Tabelle und kopiert in eine Struktur
ls_test-CURRCODE = 'BAM'. "<-- Wert in der Struktur ändern
MODIFY lt_test FROM ls_test. "<-- interne Tabelle durch die Struktur modifien (ändern)
ENDLOOP.

LOOP AT lt_test REFERENCE INTO DATA(lo_test). "<-- Loopt druch die Tabelle und zeigt die Egebnisse im Objekt an (kopiert nicht)
lo_test->currcode = 'USD'. "<-- Ändert Werte in Tabelle und Objekt (weil Objekt ist Fenster zu Tabelle)
ENDLOOP.

LOOP AT lt_Test ASSIGNING FIELD-SYMBOL(<fs_test>). "<-- Loopt druch die Tabelle und zeigt die Egebnisse im Objekt an (kopiert nicht)
  <fs_test>-currcode = 'MKD'. "<-- Ändert Werte in Tabelle und Objekt (weil Objekt ist Fenster zu Tabelle)
ENDLOOP.
