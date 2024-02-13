*&---------------------------------------------------------------------*
*& Report zob_selectionscreen_dw
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_selectionscreen_dw.
"Hilfreicher Link:
"https://www.berater-wiki.de/Selektionsbildschirm

** "Aussehen
"Einfaches Eingabefeld
PARAMETERS p_test TYPE string.

"Checkbox
PARAMETERS p_check AS CHECKBOX.

"Radiobutton
PARAMETERS: p_r1 RADIOBUTTON GROUP g_1 DEFAULT 'X',
            p_r2 RADIOBUTTON GROUP g_1,
            p_r3 RADIOBUTTON GROUP g_1.

"Komplexe Eingabe
TABLES scarr.
SELECT-OPTIONS s_opt1 FOR scarr-carrid.

"Zeilenumbruch
SELECTION-SCREEN ULINE.

"Button
SELECTION-SCREEN PUSHBUTTON /02(17) btn_text USER-COMMAND btn.

"Elemente Gruppieren
SELECTION-SCREEN BEGIN OF BLOCK block1
  WITH FRAME TITLE title. "Titel -> muss noch gepflegt werden, Optional
  "Hier die Elemente Auflisten die Gruppiert werden sollen

  "Text
  "(10) = Zeichenanzahl die ausgegeben wird
  SELECTION-SCREEN COMMENT /1(20) c_text.

SELECTION-SCREEN END OF BLOCK block1.


** "Ausführung

AT SELECTION-SCREEN.
  "Wird ausgeführt beim Klicken auf 'Ausführen'/F8
  "Wird aufgerufen beim Klicken auf den Button
  MESSAGE 'Los gehts!' TYPE 'I'.

INITIALIZATION.
  "Wird ausgelöst beim Aufbau des Bildschirms / bevor der Endnutzer das Bild sieht.
  title = 'Ich bin ein Blocktitel'.
  c_text = 'Ich bin ein Text.'.
  btn_text = 'Drück mich'.
