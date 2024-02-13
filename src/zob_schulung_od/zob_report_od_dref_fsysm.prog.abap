*&---------------------------------------------------------------------*
*& Report zob_report_od_dref_fsysm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_dref_fsysm.

"Datenreferenz

SELECT
  FROM
    STRAVELAG
  FIELDS
    *
  WHERE name LIKE 'E%'
  INTO TABLE @DATA(lt_STRAVELAG).

if sy-subrc = 0.
WRITE 'Suche OK'.
ELSE.
EXIT.
ENDIF.

LOOP AT lt_STRAVELAG INTO DATA(ls_STRAVELAG).
  "Kopie
  ls_STRAVELAG-postbox = '81927'.
  MODIFY lt_STRAVELAG FROM ls_STRAVELAG.
ENDLOOP.


*LOOP AT lt_STRAVELAG REFERENCE INTO DATA(lo_STRAVELAG).
*  "Datenreferenz
*  "Zeigen auf Objekte
*  "dereferenzieren ->
*  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code
*
*  lo_STRAVELAG->URL = lo_STRAVELAG->name(10).
*ENDLOOP.
*
*LOOP AT lt_STRAVELAG ASSIGNING FIELD-SYMBOL(<fs_STRAVELAG>).
*  "Feldsymbol (Field-Symbol):
*  "Zeiger/Pointer
*  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
*  "Schneller => nutzen bei performance-kritischen Operationen
*
*  <fs_STRAVELAG>-telephone = 0899295555.
*ENDLOOP.
