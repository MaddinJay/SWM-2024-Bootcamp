*&---------------------------------------------------------------------*
*& Report ZAW_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_kontrollstrukturen. " Das gesamte Programm ist ein Verarbeitungsblock 1 (Hauptprogramm).

**********************************************************************
* Parameter mit Typ anlegen
**********************************************************************
PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.

**********************************************************************
* Verzweigung (Bedingungen prüfen)
**********************************************************************
" zwischen 6 und 20: Schüler
" 20 - 25: Student
" älter als 25: Mitarbeiter

" Parameter ausgeben
WRITE p_name.

IF p_alter >= 6 AND p_alter < 20. " Weiterer Verarbeitungsblock 1.1
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Kevin'.
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.
ENDIF.

**********************************************************************
* Es kann nur eine Variable geprüft werden. Bedingung muss im Fall erfüllt sein.
**********************************************************************
CASE p_alter. " Weiterer Verarbeitungsblock 1.2
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6, 7 oder 8'.
ENDCASE.

**********************************************************************
* Schleifen
**********************************************************************
DO 5 TIMES. " Weiterer Verarbeitungsblock 1.3
*  IF lv_i > 100.
*  CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + p_alter.
ENDDO.

" Wenn die Bedingung wahr ist, wird das Programm normal weiterlaufen.
" Wenn die Bedingung nicht wahr ist, wird der aktuelle Verarbeitungsblock beendet!
" Da wir im Hauptprogramm sind, wird dieses sofort beendet.
CHECK lv_i < 100.
*IF NOT lv_i < 100.
*  EXIT.
*ENDIF.

" WHILE-Schleifen
WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.

WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
