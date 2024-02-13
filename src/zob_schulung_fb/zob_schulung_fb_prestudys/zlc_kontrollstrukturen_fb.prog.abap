*&---------------------------------------------------------------------*
*& Report ZLC_KONTROLLSTRUKTUREN_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_kontrollstrukturen_fb.               "Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.

"zwischen 6 und 20: Schüler
"zwischen 20 und 25: Student
"Älter als 25, aber nicht älter als 65: Mitarbeiter

"Verzweigungen

IF p_alter >= 6 AND p_alter < 20.               "Verarbeitungsblock 1.1 = IF Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR p_name = 'Harry'.
  WRITE 'Student'.
ELSE.
  WRITE: 'Mitarbeiter', /.
ENDIF.

*WRITE: /, p_name, /, p_alter.

CASE p_alter.
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE 'Alter ist weder 6 noch 7 noch 8 Jahre'.
ENDCASE.

"Schleifen
DO 5 TIMES.                                     "Verarbeitungsblock 1.3 = DO Schleife
*  IF lv_i > 100.
*    CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + p_alter.
*  EXIT.
ENDDO.

CHECK lv_i < 100.
*IF NOT lv_i < 100.
*  EXIT.
*ENDIF.

*IF lv_i < 100.
*  WHILE lv_i > 50.
*  lv_i = lv_i - 1.
*ENDWHILE.
*
*  WRITE: /, 'Ergebnis der Multiplikation:', lv_i.
*ELSE.
*  EXIT.
*ENDIF.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.

WRITE: /, 'Ergebnis der Multiplikation:', lv_i.
