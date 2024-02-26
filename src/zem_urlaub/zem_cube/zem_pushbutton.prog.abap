*&---------------------------------------------------------------------*
*& Report zem_pushbutton
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_pushbutton.


Parameters: p_tech type znachname as listbox VISIBLE LENGTH 20.
Parameters: p_grund type zsto_grund as listbox VISIBLE LENGTH 25.


SELECTION-SCREEN SKIP.

PARAMETERS: p_string TYPE string DEFAULT 'neu' LOWER CASE.

SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON (40) start USER-COMMAND fc1.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN: Skip 2.

PARAMETERS: p_s1 TYPE string  LOWER CASE.
PARAMETERS: p_s2 TYPE string  LOWER CASE.
PARAMETERS: p_s3 TYPE string  LOWER CASE.

SELECTION-SCREEN BEGIN OF LINE.

SELECTION-SCREEN: POSITION pos_low.
  SELECTION-SCREEN PUSHBUTTON (28) start1 USER-COMMAND fc2.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF BLOCK db WITH FRAME.

  SELECTION-SCREEN BEGIN OF LINE.

  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.

    SELECTION-SCREEN PUSHBUTTON (30) start3 USER-COMMAND fc4.
    SELECTION-SCREEN: POSITION POS_LOW.
    PARAMETERS: p_stonr TYPE zstonr.
    PARAMETERS: p_s4 TYPE string.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN: SKIP 1.

  SELECTION-SCREEN BEGIN OF LINE.

    SELECTION-SCREEN PUSHBUTTON (25) start2 USER-COMMAND fc3.

    SELECTION-SCREEN: POSITION POS_LOW.

    SELECTION-SCREEN: PUSHBUTTON (32) exec1 USER-COMMAND exec1.


  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK db.

SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN: PUSHBUTTON (30) exec2 USER-COMMAND exec2.
  SELECTION-SCREEN: PUSHBUTTON (30) exec3 USER-COMMAND exec3.
SELECTION-SCREEN END OF LINE.



INITIALIZATION.
  start =  icon_all_green && 'Anzeigen STO_kommentar in p_string' .
  start1 = icon_abc && 'concate ps1 + s2 in s3'.
  start3 = icon_text_field && 'älteste unerledigt'.
  start2 = icon_delete_all_attributes && 'eingaben löschen'.
  exec1 = icon_workflow_event_producer && 'stoerungsnummer abschließen'.
  exec2 = icon_start_viewer && 'Techniker Datenbank'.
  exec3 = icon_calculation && 'Analyse'.


AT SELECTION-SCREEN.

* Unterschiedliche Aktionen anhand des User-Command


  CASE sy-ucomm.
    WHEN 'FC1'.                                           "bei Ausführen (ONLI) wird p_string entsprechend ausgegeben (siehe if bedingung ganz unten)
      SELECT SINGLE
      FROM zdb_sto24
      FIELDS kommentar
      INTO @DATA(lv_kommentar).

      SELECT SINGLE
      FROM zdb_sto24
      FIELDS sto_grund
      INTO @DATA(lv_stogrund).

      p_string = lv_kommentar.

      "CONCATENATE '' lv_kommentar  into p_string.

    WHEN 'FC2'.

      CONCATENATE p_s1 p_s2 INTO p_s3.

      WRITE p_s3.
    WHEN  'FC3'.
      CLEAR: p_string, p_s1, p_s2, p_s3, p_stonr, p_s4, p_tech.

    WHEN 'FC4'.



      SELECT SINGLE
      FROM zdb_sto24
      FIELDS
       min( datum ) AS old,
       sto_grund,
      stonr as old_sto
       Where nachname is INITIAL or nachname = ''
    GROUP BY  stonr, sto_grund
      INTO @DATA(ls_komm).

      p_s4 =  ls_komm-sto_grund.

      p_stonr = ls_komm-old_sto.

    WHEN 'EXEC1'.

      UPDATE zdb_sto24 SET bearb_status = 'Erledigt' WHERE stonr = p_stonr.

      IF sy-subrc = 0.
        MESSAGE 'hat funktioniert' TYPE 'I'.
      ELSE.
        MESSAGE 'nop' TYPE 'I'.
      ENDIF.

    WHEN 'EXEC2'.

      SELECT
      FROM zdb_technik24
      FIELDS *
      INTO TABLE @DATA(lt_tab).

      cl_demo_output=>display( lt_tab ).

     When 'EXEC3'.

     Select
     from zdb_sto24
     fields
     sto_grund,
     Count( sto_grund ) as Anzahl,
     max( datum ) as letzter_Eingang
     GROUP BY sto_grund
     into table @Data(lt_analyse).

     cl_demo_output=>display( lt_analyse ).



  ENDCASE.

AT SELECTION-SCREEN output.


Perform listbox_techniker using p_tech.
perForm listbox_sto_grund using p_grund.

Form listbox_techniker using p_tech.
**********************************************************************
* Verfügbare Techniker in Listbox

Types: BEGIN OF ls_tech,
       nachname type znachname,
       end of ls_tech.


Data: it_tech type STANDARD TABLE OF ls_tech,
      ls_tech type ls_tech.

Data: g_id type vrm_id,
      it_values type vrm_values,
      wa_values like line of it_values.


Select
From zdb_technik24
Fields
nachname
where v_status = 'X'
Into TAble @it_tech.


Loop at it_tech into ls_tech.
wa_values-key = ls_tech-nachname.
wa_values-text = ls_tech-nachname.


Append wa_values to it_values.
clear wa_values.

Endloop.

g_id = 'P_TECH'.
Call FUNCTION 'VRM_SET_VALUES'
EXPORTING
id          = g_id
values      = it_values

EXCEPTIONS
id_illegal_name = 1
others          = 2.

Endform.

Form listbox_sto_grund using p_grund.
**********************************************************************
*Störungsgrunde manuell in Listbox

Types: BEGIN OF ls_stogrund,
       stogrund type zsto_grund,
       end of ls_stogrund.


Data: it_stogrund type STANDARD TABLE OF ls_stogrund,
      ls_stogrund type ls_stogrund.


Data: g_id3 type vrm_id,
      it_values3 type vrm_values,
      wa_values3 like line of it_values3.


*AT SELECTION-SCREEN OUTPUT.


ls_stogrund-stogrund = 'Zählerdefekt'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Kein Strom'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Sperrung'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Ermittlung'.
Append ls_stogrund to it_stogrund.

Loop at it_stogrund into ls_stogrund.
wa_values3-key = ls_stogrund-stogrund.
wa_values3-text = ls_stogrund-stogrund.

Append wa_values3 to it_values3.
clear wa_values3.

endloop.


g_id3 = 'P_GRUND'.
Call FUNCTION 'VRM_SET_VALUES'
EXPORTING
id          = g_id3
values      = it_values3

EXCEPTIONS
id_illegal_name = 1
others          = 2.

Endform.


* Wenn User-Command 'ONLI' (Ausführen) gedrückt wurde
