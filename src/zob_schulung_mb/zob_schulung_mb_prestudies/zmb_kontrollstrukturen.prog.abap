*&---------------------------------------------------------------------*
*& Report ZMB_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_kontrollstrukturen.

PARAMETERS: p_name  TYPE string,
            P_alter TYPE i.

"zw 6 und 20     = Schüler
"zw. 20 und 25 = Student
"Älter als 25  = Mitarbeiter

WRITE p_name.

*Verzweigungen
DATA lv_i TYPE i.
IF P_alter >= 6 AND P_alter < 20.
  WRITE 'Schüler'.
ELSEIF P_alter < 26 OR p_name ='Kevin'.
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.

ENDIF.

CASE P_alter.
 WHEN 6.
 WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
 WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
 WRITE / 'Alter ist weder 6 noch 7 noch 8'.
   ENDCASE.

*Schleifen

DO 5 TIMES.
  lv_i = lv_i + P_alter.

ENDDO.


WHILE lv_i > 50.
  lv_i = lv_i - 1.

Endwhile.

Write: /, 'Ergebnis der Multiplikation:', lv_i.
