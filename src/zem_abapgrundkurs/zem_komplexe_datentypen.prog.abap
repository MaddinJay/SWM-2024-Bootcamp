*&---------------------------------------------------------------------*
*& Report ZEM_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_komplexe_datentypen.

PARAMETERS p_input TYPE string."Eingabe wird immer in Großbuchstaben uebernommen

*INCLUDE ZEM_MODULARISIERUNG_INCLUDE.


*DATA: gv_1 TYPE string VALUE 'Hallo',
*gv_11 TYPE STRING VALUE 'tschüss',
*gv_1_erg type string,
*gv_2 Type i VALUE 22,
*gv_22 TYPE i Value  3,
*gv_2_erg type i.

IF p_input = 'Hallo'. "Großbuchstaben könnten in Debugger geändert werden
 WRITE 'griasdi'.
  ELSEIF p_input = 'Tschüss'.
  WRITE 'Pfiadi'.
 Else. WRITE  'Hä?'.
ENDIF.

*CASE p_input.
*  WHEN 'HALLO'. "So wird es gefunden, mit kleinen Buchstaben ueber Debugger
*    WRITE 'griasdi'.
* WHEN 'TSCHÜSS'. "So wird es gefunden, mit kleinen Buchstaben ueber Debugger
*   WRITE 'aber nicht in die Hose'.
* WHEN OTHERS.
*    WRITE 'Was hast g´sagt?'.
*ENDCASE.

TYPES: BEGIN OF ls_struktur,
         name  TYPE string,
         alter TYPE string,
       END OF ls_struktur.

TYPES lsy_tabelle TYPE SORTED TABLE OF ls_struktur WITH UNIQUE KEY name.

DATA gt_tabelle TYPE ls_struktur.
DATA gt_tabelle2 TYPE lsy_tabelle.

DATA gt_tabelle3 TYPE string.

gt_tabelle-name = 'Michele'.
gt_tabelle-alter = 43.
APPEND gt_tabelle TO gt_tabelle2.

CONCATENATE gt_tabelle-name gt_tabelle-alter INTO gt_tabelle3.

DO 5 TIMES.
  WRITE: gt_tabelle-name, gt_tabelle-alter.
  ULINE.
ENDDO.
