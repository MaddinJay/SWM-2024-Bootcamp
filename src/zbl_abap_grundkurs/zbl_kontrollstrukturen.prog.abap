*&---------------------------------------------------------------------*
*& Report ZBL_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_kontrollstrukturen.

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.

*"jünger 20: Schüler
"zw. 20 u. 25: Student
"Älter als 25: Mitarbeiter
* ***************************************************


WRITE p_name.

*Verweigungen
IF p_alter >= 6 AND p_alter < 20.
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Mahn'.
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.
ENDIF.

CASE p_alter .
  WHEN 6.
    WRITE 'Alter ist 6 Jahre.'.
  WHEN 7 OR 8.
    WRITE 'Alter ist 7 oder 8 Jahre.'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6 noch 7 noch 8.'.
ENDCASE.

* Schleifen
DO 5 TIMES.
  IF lv_i > 100.
    CONTINUE.
  ENDIF.

  lv_i = lv_i + p_alter.
ENDDO.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.

WRITE: / 'Ergebnis der Multiplikation:  ', lv_i.
