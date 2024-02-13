*&---------------------------------------------------------------------*
*& Report zem_selfstudyclass
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_selfstudyclass.

**********************************************************************
* Eingabe der Lebensmittel-Mengen in verschiedenen Einheiten
**********************************************************************

SELECTION-SCREEN BEGIN OF BLOCK Eingabe WITH FRAME TITLE TEXT-001.

PARAMETERS: p_rind TYPE p DECIMALS 2,
            p_zwie TYPE p DECIMALS 2,
            p_kart TYPE p DECIMALS 2.

Selection-Screen End of block Eingabe.


**********************************************************************
* Aufruf Klassen - die jeweilige Klasse liest den Nährwert (Protein und Kohlenhydrate)
*                  aus der Datenbank ZEM_DB_NW_ZUTAT
*                  und multipliziert ihn entsprechend mit der eingegebenen Menge
**************************************************************************************

Call Method: ZEM_class_zwiebelrostbraten=>rindfleisch( iv_anzahl_rind = p_rind ),   "Rind
ZEM_class_zwiebelrostbraten=>zwiebel( iv_anzahl_zwiebel = p_zwie ),    " Zwiebel
ZEM_class_zwiebelrostbraten=>kartoffel( iv_anzahl_kartoffel = p_kart ), ".Kartoffel
*
ZEM_class_zwiebelrostbraten=>ergebnis.

*START-OF-SELECTION.
*
*  DATA: lv_ergebnis2 TYPE REF TO ZEM_class_Zwiebelrostbraten.
*
*  CREATE OBJECT lv_ergebnis2.
*
*  CALL METHOD:  ZEM_class_zwiebelrostbraten=>rindfleisch( iv_anzahl_rind = p_rind ),   "Rind
*                ZEM_class_zwiebelrostbraten=>zwiebel( iv_anzahl_zwiebel = p_zwie ),    " Zwiebel
*                ZEM_class_zwiebelrostbraten=>kartoffel( iv_anzahl_kartoffel = p_kart ), ".Kartoffel
*
*                ZEM_class_zwiebelrostbraten=>ergebnis.                                 "Zählt die Nährwertangaben zusammen
*
*END-OF-SELECTION.
