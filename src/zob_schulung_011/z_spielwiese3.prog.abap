*&---------------------------------------------------------------------*
*& Report z_spielwiese3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_spielwiese3.


**********************************************************************
*Parameter für Suche der Fluggesellschaft im Block
**********************************************************************
SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.
  PARAMETERS p_gesell TYPE string OBLIGATORY LOWER CASE MODIF ID sc1.
SELECTION-SCREEN END OF BLOCK a.


**********************************************************************
*Parameter Checkbox zum anhaken im Block
**********************************************************************
SELECTION-SCREEN BEGIN OF BLOCK c WITH FRAME.
  PARAMETERS p_check AS CHECKBOX USER-COMMAND test.
SELECTION-SCREEN END OF BLOCK c.


**********************************************************************
*Parameter für das Einfügen bzw. Ändern von Daten im Block
**********************************************************************
SELECTION-SCREEN BEGIN OF BLOCK b WITH FRAME.
  PARAMETERS p_neu TYPE c LENGTH 2 OBLIGATORY MODIF ID sc2.
  PARAMETERS p_neu2 TYPE string LOWER CASE OBLIGATORY MODIF ID sc2.
  PARAMETERS p_neu3 TYPE c LENGTH 3 OBLIGATORY MODIF ID sc2.
  PARAMETERS p_neu4 TYPE string LOWER CASE OBLIGATORY MODIF ID sc2.
SELECTION-SCREEN END OF BLOCK b.


**********************************************************************
*Initialization damit der Block b nicht angezeigt wird
**********************************************************************
INITIALIZATION.
  LOOP AT SCREEN.
    IF screen-group1 = 'SC2'.
      screen-active = 0.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.


**********************************************************************
*At Select-Option Output damit bei anhaken der Checkbox Block b wieder angezeigt wird
**********************************************************************
AT SELECTION-SCREEN OUTPUT.
  IF p_check EQ 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ELSE.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.


**********************************************************************
*Replace damit die Sternchensuche funktioniert (z.B. L*)
**********************************************************************
REPLACE ALL OCCURRENCES OF '*' IN p_gesell WITH '%'.


**********************************************************************
*Select damit Tabelle von Datenbank in interne Tabelle gezogen wird
**********************************************************************
  SELECT
    FROM
      scarr
     FIELDS
      *
     WHERE carrname LIKE @p_gesell
     INTO TABLE @DATA(lt_flug).


**********************************************************************
*Datenbanktabelle in Struktur typisieren
**********************************************************************
DATA ls_flug TYPE scarr.


**********************************************************************
*Wenn-Formel für das Einfügen/Ändern der Datenbanktabelle sowie fürs Anzeigen der gewünschten Daten aus der Tabelle
**********************************************************************
  IF lt_flug IS INITIAL. "<-- Initialer Zustand, Tabelle ist leer
    ls_flug-carrid = p_neu.
    ls_flug-carrname = p_neu2.
    ls_flug-currcode = p_neu3.
    ls_flug-url = p_neu4.
    INSERT scarr FROM ls_flug.
  ELSE.
    cl_demo_output=>display( lt_flug ).
    ls_flug-carrid = p_neu.
    ls_flug-carrname = p_neu2.
    ls_flug-currcode = p_neu3.
    ls_flug-url = p_neu4.
    UPDATE scarr FROM ls_flug.
  ENDIF.
