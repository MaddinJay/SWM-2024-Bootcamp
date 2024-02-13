*&---------------------------------------------------------------------*
*& Report z_as_gruppenaufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_gruppenaufgabe.
TABLES stravelag.

**********************************************************************
* Parameter für die Suche des Reisebüros in der DB
**********************************************************************
PARAMETERS p_AGENCY TYPE string OBLIGATORY.

**********************************************************************
* Checkbox für das Ändern/Eintragen von Werten in der DB
**********************************************************************
PARAMETERS: p_edit   AS CHECKBOX,
            p_update AS CHECKBOX.

**********************************************************************
* Eingabefelder für das Ändern/Eintragen von Werten in der DB, Achtung: modif id b2 ist nur bei Initialization und AT SELECTION-SCREEN OUTPUT wichtig!
**********************************************************************
SELECTION-SCREEN BEGIN OF BLOCK Block2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_name   TYPE string MODIF ID b2,
              p_street TYPE String MODIF ID b2,
              p_pbox   TYPE String MODIF ID b2,
              p_pcode  TYPE String MODIF ID b2,
              p_land   TYPE c LENGTH 3 MODIF ID b2,
              p_city   TYPE String MODIF ID b2,
              p_region TYPE String MODIF ID b2,
              p_tele   TYPE String MODIF ID b2,
              p_url    TYPE String MODIF ID b2,
              p_langu  TYPE lang MODIF ID b2,
              p_curr   TYPE c LENGTH 5 MODIF ID b2.
SELECTION-SCREEN END OF BLOCK Block2.


**********************************************************************
** Initialization damit der Block2 nicht angezeigt wird
**********************************************************************
*INITIALIZATION.
*  LOOP AT SCREEN.
*    IF screen-group1 = 'B2'.
*      screen-active = 0.
*      MODIFY SCREEN.
*    ENDIF.
*  ENDLOOP.
*
***********************************************************************
*AT SELECTION-SCREEN OUTPUT.
*  IF p_edit EQ 'X'.
*    LOOP AT SCREEN.
*      IF screen-group1 = 'B2'.
*        screen-active = 1.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDLOOP.
*  ELSE.
*    LOOP AT SCREEN.
*      IF screen-group1 = 'B2'.
*        screen-active = 0.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDLOOP.
*  ENDIF.
*
DATA ls_stravelag TYPE stravelag.

**********************************************************************
* Neue Werte für das Ändern/Eintragen -> INSERT/UPDATE
**********************************************************************
DATA(ls_new_stravelag) = VALUE stravelag(
  agencynum = p_agency
   name = p_name
   street = p_street
   postbox = p_pbox
   postcode = p_pcode
   city = p_city
   country = p_land
   region = p_region
   telephone = p_tele
   url = p_url
   langu = p_langu
   currency = p_curr ).

**********************************************************************
* Select-Befehl, um herauszufinden, ob es die Reisebüronummer bereits in der DB gibt
**********************************************************************
SELECT
FROM stravelag
FIELDS *
WHERE agencynum = @p_agency
INTO TABLE @DATA(lt_stravelag2).

**********************************************************************
* Liest die interne Tabelle in die lokale Struktur an der ersten Zeile aus
**********************************************************************
READ TABLE lt_stravelag2 INTO ls_stravelag INDEX 1.

**********************************************************************
* IF-Schleife, um herauszufinden, ob das Reisebüro bereits vorhanden ist
**********************************************************************
IF sy-subrc = 0 AND p_edit = abap_false.  "Falls das Reisebüro vorhanden ist & die Checkbox nicht angeklickt wurde
  cl_demo_output=>display( lt_stravelag2 ).
ELSEIF sy-subrc = 4 AND p_edit = abap_false. "Falls das Reisebüro nicht vorhanden ist & die Checkbox nicht angeklickt wurde
  DATA(lv_message) = |Das Reisebüro existiert noch nicht! |.
  MESSAGE lv_message TYPE 'I'.
ENDIF.

**********************************************************************
* IF-Schleife: Wenn die Checkbox angeklickt wurde, soll ein neues Reisebüro mit bestimmten Werten angelegt werden
**********************************************************************
IF p_edit = abap_true.
  INSERT stravelag FROM ls_new_stravelag.
  DATA(lv_message2) = |Das neue Reisebüro wurde angelegt!|.
  MESSAGE lv_message2 TYPE 'I'.

ENDIF.

**********************************************************************
* IF-Schleife: Wenn die Checkbox angeklickt wurde, soll ein bestehendes Reisebüro mit bestimmten Werten geändert werden
**********************************************************************
IF p_update = abap_true.
  UPDATE stravelag FROM ls_new_stravelag.
  DATA(lv_message3) = |Das bestehende Reisebüro wurde geändert!|.
  MESSAGE lv_message3 TYPE 'I'.

ENDIF.

**********************************************************************
* Select-Befehl, um die neue DB anzuzeigen
**********************************************************************
*SELECT
*FROM stravelag
*FIELDS *
*INTO TABLE @DATA(lt_new_stravelag2).
*cl_demo_output=>display( lt_new_stravelag2 ).
