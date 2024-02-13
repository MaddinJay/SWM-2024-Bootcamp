*&---------------------------------------------------------------------*
*& Report zbl_typdeclarationii
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_typdeclarationii.

TYPES: BEGIN OF ty_language,
         language  TYPE s_langu, "Sprachkürzel
         text      TYPE string,  "Text
       END OF ty_language.

DATA: lt_language TYPE TABLE OF ty_language,   "Tabelle
      wa_language TYPE ty_language.   "Arbeitsbereich

wa_language-language = 'EN'.
wa_language-text = 'Hello'.
APPEND wa_language TO lt_language.

wa_language-language = 'DE'.
wa_language-text = 'Hallo'.
APPEND wa_language TO lt_language.

wa_language-language = 'FR'.
wa_language-text = 'Bonjour'.
APPEND wa_language TO lt_language.

"Zur Ausgabe der Daten
LOOP AT lt_language INTO wa_language.
  WRITE: / 'Sprache:', wa_language-language, 'Text:', wa_language-text.
ENDLOOP.
