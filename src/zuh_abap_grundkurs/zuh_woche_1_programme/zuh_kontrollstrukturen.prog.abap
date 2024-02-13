*&---------------------------------------------------------------------*
*& Report ZUH_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_kontrollstrukturen. " Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA: lv_i TYPE i.

*zwischen 6 und 20: Schüler
*zwischen 20 und 25: Student
*alter als 25, aber nicht älter als 65: Mitarbeiter

WRITE: p_name, p_alter.
ULINE.
**********************************************************************
*Verzweigungen
**********************************************************************

IF p_alter => 6 AND p_alter < 20. "Verarbeitungsblock 1.1 = IF Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Kevin'.
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
    WRITE / 'Alter ist nicht 6, 7 oder 8'.
ENDCASE.

**********************************************************************
*Schleifen
**********************************************************************

DO 5 TIMES. " Verarbeitungblock 1.3 = do schleife
*  IF lv_i > 100.
*    CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.   "Wenn nicht der fall ist, beendet wird die aktuelle Schleife hier beendet.
  lv_i = lv_i + p_alter.
*  EXIT.                 " Die Schleife wird sofort abgebrochen
ENDDO.

CHECK lv_i < 100.   "Wenn nicht der fall ist, beendet den aktuellen Verarbeitungsblock
*EXIT                "Der Hauptverarbeitungsblock wird sofort beendet
WHILE lv_i > 50.
  lv_i = lv_i - 1.

ENDWHILE.


WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.
