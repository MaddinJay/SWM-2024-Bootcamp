*&---------------------------------------------------------------------*
*& Report ZOD_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_kontrollstrukturen. "Verarbeitungsblock 1 = Hauptprogramm
PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.
DATA: lv_i TYPE i.
"jünger 20 Schüler
"zwischen 20 und 25: Student
"Älter als 25, aber nicht älter als 65: Mitarbeiter

"zw 6 und 20 Schüler
"zwischen 10 und 25: Student
"Älter als 25: Mitarbeiter

WRITE p_name.
**********************************************************************
*Verzweigung
**********************************************************************
IF p_alter >= 6 AND p_alter < 20. "Verarbeitungsblock 1.1 = if Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Kevin' .
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.
ENDIF.

CASE p_alter.
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6 noch 7 noch 8'.
ENDCASE.
**********************************************************************
* Schleifen
**********************************************************************
DO 5 TIMES. "Verarbeitungsblock 1.3 = DO Schleife
*  IF lv_i > 100.
*    CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + p_alter.
ENDDO.

CHECK lv_i < 100.
*IF NOT lv_i < 100. "mach das gleiche wie check
*EXIT.
*ENDIF.

WRITE: /, 'Ergebnis der Multiplikation', lv_i.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.
