*&---------------------------------------------------------------------*
*& Report zhum_uebung_loop
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhum_uebung_loop.

SELECT
FROM
scarr
FIELDS *
WHERE carrid LIKE '5%' OR carrname LIKE 'L%'
INTO TABLE @DATA(lt_scarr).

LOOP AT lt_scarr INTO DATA(ls_scarr). "Kopiert die Struktur aus der Tabelle
  ls_scarr-url = 'www.legoland.de'.
  MODIFY lt_scarr FROM ls_scarr.      "Modify dient dazu die Änderung aus der Struktur in die Originaltabelle zurückzuschreiben.
ENDLOOP.
cl_demo_output=>display(
  data = lt_scarr ).

LOOP AT lt_scarr REFERENCE INTO DATA(lo_scarr). "Datenreferenz, zeigt auf Objekte
  lo_scarr->carrid = lo_scarr->url(20).         "kopiert die Änderung in der Struktur in die Originaltabelle
ENDLOOP.

LOOP AT lt_scarr ASSIGNING FIELD-SYMBOL(<fs_scarr>). "Feldsymbol, Zeiger/Pointer
  <fs_scarr>-currcode = 'FRA'.                         " kopiert die Änderung in der Struktur in die Originaltabelle
  " Kein eigener Speicher, zeigen auf die Adresse des Datenobjekts
  "schneller --> Nutzen bei performance-kritischen Operationen
ENDLOOP.
