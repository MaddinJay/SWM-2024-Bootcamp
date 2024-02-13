*&---------------------------------------------------------------------*
*& Report zaw_uebung_datenreferenz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_datenreferenz.


SELECT *
FROM
scarr
WHERE carrid LIKE 'S%' OR carrname LIKE 'L%'
INTO TABLE @DATA(lt_scarr).

LOOP AT lt_scarr INTO DATA(ls_scarr).                 "Erstellt eine Kopie von einer Datenbanktabelle, die in eine Struktur kopiert wird.
  ls_scarr-currcode = 'CFA'.
  MODIFY lt_scarr FROM ls_scarr.
ENDLOOP.

LOOP AT lt_scarr REFERENCE INTO DATA(lr_scarr).       "Zeigt auf Objekte - bevorzugt, wenn Daten in der Tabelle geändert werden sollen.
  lr_scarr->currcode = 'CFA'.
ENDLOOP.
*
LOOP AT lt_scarr ASSIGNING FIELD-SYMBOL(<fs_scarr>).   "Zeigt direkt auf die Adresse des Datenobjekts - bevorzugt bei zeitkritischen Operationen.
  <fs_scarr>-currcode = 'CFA'.
ENDLOOP.
