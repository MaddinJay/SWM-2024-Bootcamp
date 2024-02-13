*&---------------------------------------------------------------------*
*& Report ZFD_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_kontrollstrukturen. " Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.

" jünger als 20 Schüler
" zwischen 20 und 25 Student
" Älter als 25 Mitarbeiter

**********************************************************************
*Verzweigungen
**********************************************************************
IF p_alter < 20 AND p_alter >= 6. " Verarbeitungsblock 1.1 = If Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Kevin'.  " OR NOT
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.
ENDIF.

WRITE p_name.

CASE p_alter.
  WHEN 6. " Nur , = ,  OR   möglich ! Auf Gleichheit prüfen mit OR !
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6, 7, 8 Jahre'.
ENDCASE.

**********************************************************************
*Schleifen
**********************************************************************
DO 5 TIMES. " Verarbeitungsblock 1.3 = Do Schleife
*  IF lv_i > 100.
*    CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + p_alter.
  EXIT.
ENDDO.

CHECK lv_i <= 100.
*
*IF lv_i < 100.
*  WHILE lv_i > 50.
*    lv_i = lv_i - 1.
*  ENDWHILE.
*
*  WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
*ELSE.
*  Exit.
*ENDIF.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.

WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
