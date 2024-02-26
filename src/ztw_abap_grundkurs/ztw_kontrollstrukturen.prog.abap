*&---------------------------------------------------------------------*
*& Report ZTW_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_kontrollstrukturen. "Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.

WRITE p_name.

*Verzweigungen
IF p_alter >= 6 AND p_alter < 20. "Verarbeitungsblock 1.1 = If Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 25 OR p_name = 'KEVIN'.
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.

ENDIF.

CASE p_alter.
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6 noch 7 noch 8'.
ENDCASE.

*Schleifen
DO 5 TIMES."Verarbeitungsblock 1.3 = Do Schleife
*  IF lv_i > 100.
*CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + p_alter.
*  EXIT.
ENDDO.

CHECK lv_i < 100.
*IF NOT lv_i < 100.
*EXIT.
*ENDIF

*IF lv_i < 100.
*  WHILE lv_i > 50.
*    lv_i = lv_i - 1.
*    ENDWHILE.
*
*    WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
*    ELSE.
*      EXIT.
*      ENDIF.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.

WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
