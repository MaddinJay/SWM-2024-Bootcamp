*&---------------------------------------------------------------------*
*& Report ZST_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_kontrollstrukturen. "Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.

DATA lv_i TYPE i.

WRITE p_name.
*******************************************************************************************************************************
*Verzweigungen
*******************************************************************************************************************************
IF p_alter >= 6 AND p_alter < 20. "Verarbeitungsblock 1.1 = If Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Kevin'.
  WRITE 'Student'.
ELSE.
  WRITE  'Mitarbeiter'.
ENDIF.

CASE p_alter."Schneller als IF aber auch eingeschränkter / kann nur auf eine Variable prüfen
  WHEN 6."Nur '=' Bedingungen oder 'OR'
  WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 Or 8.
  WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6 noch 7 noch 8 Jahre'.
ENDCASE.

*******************************************************************************************************************************
*Schleifen
*******************************************************************************************************************************

DO 5 TIMES. "Verarbeitungsblock 1.3 = Do Schleife
*IF lv_i > 100.
*CONTINUE.
*ENDIF.
Check lv_i <= 100.
lv_i = lv_i + p_alter.
*EXIT. "Aktuelle Schleife wird sofort beendet. Es geht weiter mit dem Hauptprogramm
ENDDO.

CHECK lv_i < 100.
*EXIT. "Aktueller Verarbeitungsblock wird sofort beendet. Kann auch mit IF gekoppelt werden

WHILE lv_i > 50.
lv_i = lv_i - 1.
ENDWHILE.

WRITE: /, 'Ergebnis der Mulitpilkation', lv_i.
