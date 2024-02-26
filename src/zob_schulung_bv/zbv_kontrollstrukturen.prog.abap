*&---------------------------------------------------------------------*
*& Report ZBV_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBV_KONTROLLSTRUKTUREN. " Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.
" jünger 20: Schüler
" zwischen 20 und 25: Student
" Älter als 25: Mitarbeiter

WRITE p_name.

* Verzweigungen

IF p_alter >= 6 AND p_alter < 20. " Verarbeitungsblock 1.1 = If Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Kevin'.
  WRITE 'Student'.
ELSE.
  WRITE ' Mitarbeiter'.
ENDIF.

CASE p_alter.
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter íst weder 6 noch 7 noch 8'.
ENDCASE.

* Schleifen
DO 5 TIMES. " Verarbeitungsblock 1.3 = Do Schleife
*  IF lv_i > 100.
*    CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + p_alter.
ENDDO.

CHECK lv_i < 100.

*IF lv_i < 100.
*  WHILE lv_i > 50.
*    lv_i = lv_i - 1.
*  ENDWHILE.
*
*  WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
*ELSE.
*  EXIT.
*ENDIF.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.

WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
