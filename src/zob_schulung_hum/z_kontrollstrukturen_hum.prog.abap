*&---------------------------------------------------------------------*
*& Report Z_KONTROLLSTRUKTUREN_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_kontrollstrukturen_hum. "Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.
DATA: lv_i Type i.

"zw. 6 und 20 Jahre: Schüler
" zw. 20 und 25: Student
"Älter als 25, aber nicht älter als 65: Mitarbeiter

WRITE p_name.
**********************************************************************
*Verzweigungen
**********************************************************************

IF p_alter >= 6 AND p_alter < 20. " Verarbeitungsblock 1.1 = IF-Verzweigung
  WRITE 'Schüler'.
ELSEIF p_alter < 26 OR NOT p_name = 'Pascale'.
  WRITE 'Student'.
ELSE.
  WRITE 'Mitarbeiter'.
ENDIF.

CASE p_alter. " Verarbeitungsblock 1.2 = Case
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'ALter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Älter als 8'.
ENDCASE.

**********************************************************************
*Schleifen und Continue
**********************************************************************

DO 5 TIMES. " Verarbeitungsblock 1.3 = Do-Schleife
*  IF  lv_i > 100.
*CONTINUE. " kann nur in Schleifen verwendet werden
*  ENDIF.
  CHECK lv_i <= 100. " Continue kann weggelassen werden und durch CHeck ersetzt werden, innerhalb von Schleifen
lv_i = lv_i + p_alter.
ENDDO.

CHECK lv_i < 100. "Außerhalb einer Schleife, wenn die Bedingung wahr fortführung wie in einer Schleife, wenn falsch Beendigung des aktuellen Verarbeitungsblocks

WHILE lv_i > 50.
lv_i = lv_i - 1.
ENDWHILE.

*EXIT. "aktuelle Schleige wird sofort beendet und der aktuelle Verarbeitungsblock wird beendet muss mit IF verknüpft werden
*IF NOT lv_i < 100.
*EXIT.
*ENDIF

WRITE: / 'Ergebnis der Addition:', lv_i.
