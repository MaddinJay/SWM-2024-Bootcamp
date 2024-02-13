*&---------------------------------------------------------------------*
*& Report z_gruppe_mikroprojekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_gruppe_mikroprojekt.

*** Aussehen
SELECTION-SCREEN BEGIN OF BLOCK Suche WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_name(25) TYPE c LOWER CASE OBLIGATORY.
SELECTION-SCREEN END OF BLOCK Suche.

SELECTION-SCREEN BEGIN OF BLOCK Neuanlage WITH FRAME TITLE TEXT-002.
  PARAMETERS:p_name_n(25) TYPE c LOWER CASE,
             p_form_n(15) TYPE c LOWER CASE,
             p_stre_n(30) TYPE c LOWER CASE,
             p_code_n(10) TYPE c,
             p_city_n(25) TYPE c LOWER CASE,
             p_tel_n(30)  TYPE c.
SELECTION-SCREEN END OF BLOCK Neuanlage.

*** Funktionalität

INITIALIZATION.
  "Geschieht vor der Ausgabe des Bildschirms
*  LOOP AT SCREEN.
*    IF screen-name = 'P_NAME_N'.
*      Screen-active = 0.
*      MODIFY SCREEN.
*    ENDIF.
*  ENDLOOP.

START-OF-SELECTION.
  SELECT
   FROM scustom
   FIELDS *
   WHERE name = @p_name
    INTO TABLE @DATA(lt_kunde).

  LOOP AT lt_kunde INTO DATA(ls_kunde).
  ENDLOOP.
*Write .
  IF  p_name = ls_kunde-name.
    cl_demo_output=>display( ls_kunde ).

  ELSEIF p_name <> ls_kunde-name.
    MESSAGE 'Kunde wurde nicht gefunden' TYPE 'I'.
      ENDIF.


START-OF-SELECTION.
  "Geschieht nachdem der Nutzer Ausführen klickt
