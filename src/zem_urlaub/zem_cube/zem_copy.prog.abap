*&---------------------------------------------------------------------*
*& Report zem_copy
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_copy.

TYPE-POOLS: vrm.

SELECT SINGLE
FROM zdb_sto24
FIELDS
kundennr AS letzte_Stoerung
WHERE bearb_status > 1
INTO @DATA(lv_stonr).

SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN: POSITION 83.
  SELECTION-SCREEN PUSHBUTTON (25) loeschen USER-COMMAND fc1.
SELECTION-SCREEN END OF LINE.


SELECTION-SCREEN BEGIN OF BLOCK Stoerung WITH FRAME TITLE TEXT-001.

    PARAMETERS: p_kdnr  TYPE zdb_sto24-stonr.
    PARAMETERS: p_grund TYPE zkommentar as listbox visible length 20.
    PARAMETERS: p_kommi TYPE zkommentar.
    Parameters: p_datum TYPE frmdatum DEFAULT sy-datum.

  SELECTION-SCREEN: Skip 1.

  SELECTION-SCREEN begin of line.
    SELECTION-SCREEN PUSHBUTTON (25) erfasse USER-COMMAND fc5.
  selection-SCREEN end of line.

SELECTION-SCREEN END OF BLOCK stoerung.

  SELECTION-SCREEN: Skip 1.

SELECTION-SCREEN BEGIN OF BLOCK sto WITH FRAME TITLE TEXT-002.

  TYPES: BEGIN OF ls_tech,
           nachname TYPE znachname,
         END OF ls_tech.

   DATA: it_tech    TYPE STANDARD TABLE OF ls_tech,
         ls_technik TYPE ls_tech,
         g_id       TYPE vrm_id,
         it_values  TYPE vrm_values,
         wa_values  LIKE LINE OF it_values.



    PARAMETERS: p_tech TYPE znachname AS LISTBOX VISIBLE LENGTH 10.



Selection-Screen: begin of line.

    SELECTION-SCREEN: PUSHBUTTON (30) abruf USER-COMMAND fc8.
    SELECTION-SCREEN: POSITION pos_low.
    PARAMETERS: p_stonr TYPE zstonr,
                p_stog type zkommentar.

SELECTION-SCREEN: end of line.

    SELECTION-SCREEN: skip.

  SELECTION-SCREEN: begin of line.
    SELECTION-SCREEN: PUSHBUTTON (30) tech_z  USER-COMMAND fc6.
SELECTION-SCREEN: POSITION pos_low.
    SELECTION-SCREEN: PUSHBUTTON (30) erledigt USER-COMMAND fc7.

  SELECTION-SCREEN: end of line.

SELECTION-SCREEN end of block sto.

SELECTION-SCREEN begin of block status with frame title text-003.




SELECTION-SCREEN END OF BLOCK status.

SELECTION-SCREEN SKIP.

* PUSHBUTTON für Anzeige / User-Command: 'SHOW'
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON 3(30) anzeige USER-COMMAND show.
  SELECTION-SCREEN POSITION 83.
  SELECTION-SCREEN: PUSHBUTTON (13) exec3 USER-COMMAND exec3.
  SELECTION-SCREEN: Pushbutton (9) dat USER-COMMAND show1.

  parameters: p_datay type frmdatum.


  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN SKIP.

  SELECTION-SCREEN begin of block spezial with frame title text-001.

  Selection-Screen begin of line.

  SELECTION-SCREEN: Pushbutton (30) anzahl USER-COMMAND fc10.

  Parameters: p_anzahl(4) type n.
  SELECTION-SCREEN: POSITION pos_low.

  SELECTION-SCREEN end of line.

  SELECTION-SCREEN: Skip.

  SELECTION-SCREEN begin of line.

   SELECTION-SCREEN PUSHBUTTON (30) quick USER-COMMAND fc9.
      PARAMETERS: p_stonr2 TYPE zstonr.
      PARAMETERS: p_grundl TYPE string.


    SELECTION-SCREEN end of line.

  SELECTION-SCREEN end of block spezial.

INITIALIZATION.
  anzeige   = icon_view_list && 'Übersicht aller Störungen'.
  loeschen  = icon_delete && 'Eingaben löschen'.                  "FC1
  erfasse   = icon_transfer && 'Störung erfassen'.                "FC5
  tech_z    = icon_set_state && 'Techniker zuweisen'.             "FC6
  erledigt  = icon_final_date && 'Störung abschließen'.           "FC7
  exec3     = icon_calculation && 'Analyse'.                      "SHOW1
  dat       =  'von heute'.
  abruf     = icon_call_answer && 'älteste unzugewiesene'.
  quick     = 'älteste unerledigte Störung'.
  anzahl    = 'Anzahl unerledigte'.

**********************************************************************
    select
    from zdb_sto24
    Fields
    Count( stonr ) as Anzahl
    Where bearb_status <> 'Erledigt'
    into @Data(lv_anzahl_sto).


AT SELECTION-SCREEN.

  DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ).

  CASE sy-ucomm.

     WHEN 'SHOW'.
      zmaf_class_sb=>sto_abrufen( ).

     WHEN 'FC1'. "-->eingaben löschen
      CLEAR: p_grund, p_kdnr, p_kommi,  p_tech, p_stonr, p_datay, p_stog.

     When 'FC5'. "-->Störung erfassen

        IF p_kdnr is INITIAL.
            Message |bitte mindestens eine Kundennummer vorgeben| type 'I'.
        Else.
            lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ip_sgrund = p_grund ip_kommi = p_kommi ip_datum = p_datum ip_tech = p_tech ).
        Endif.

     When 'FC6'. "--> Techniker zuweisen
          IF p_tech is INITIAL or p_stonr is INITIAL.
             message |Bitte Techniker und Störungsnummer auswählen, um Störung zuzuweisen.| type 'I'.
          Else.
             lo_sto_erfassen->tech_zuweisen( ip_tech = p_tech ip_stonr = p_stonr ).
             message |der Techniker { p_tech } ist der Störungsnr. { p_stonr } zugewiesen| type 'I'.
          Endif.

     when 'FC7'. "-->Störung auf erledigt setzen
          IF p_stonr is INITIAL or p_stonr = '0000'.
             Message |Bitte die Störungsnummer auswählen, die abgeschlossen werden soll| type 'I'.
          Else.
          lo_sto_erfassen->status_erledigt( ip_stonr = p_stonr ).
              message |{ icon_green_light } die Störungsnr. { p_stonr } ist abgeschlossen| type 'I'.
              Clear: p_stonr, p_kommi.
          Endif.

     When 'SHOW1'. "--> Tagesdatum in Anlalysefeld eintragen
      p_datay = sy-datum.

     When 'FC8'. "-->


    SELECT SINGLE
      FROM zdb_sto24
      FIELDS
      MIN( datum ) AS old,
      stonr,
      sto_grund
      Where nachname is INITIAL
      GROUP BY stonr, sto_grund
      INTO @DATA(ls_sto_grund).


      p_stog =  ls_sto_grund-sto_grund.
      p_stonr = ls_sto_grund-stonr.




     When 'EXEC3'.

     if p_datay is INITIAL.

      Select
      from zdb_sto24
      fields
       sto_grund,
      Count( sto_grund ) as Anzahl,
      max( datum ) as letzter_Eingang
      GROUP BY sto_grund

      into table @Data(lt_analyse).

      cl_demo_output=>display( lt_analyse ).

     else.

      Select
      from zdb_sto24
      fields
      sto_grund,
      Count( sto_grund ) as Anzahl
      Where datum = @p_datay
      GROUP BY sto_grund
      into table @Data(lt_analyse_dat).

      cl_demo_output=>display( lt_analyse_dat ).

     Endif.


     When 'FC9'.

    Select single
    from zdb_sto24
    Fields
    Count( stonr ) as Anzahl
    Where bearb_status <> 'Erledigt'
    into @Data(lv_anzahl_sto).


      SELECT SINGLE
      FROM zdb_sto24
      FIELDS
       min( datum ) AS old,
       sto_grund,
        stonr as old_sto
       Where nachname is INITIAL or nachname = ''
      GROUP BY  stonr, sto_grund
      INTO @DATA(ls_komm).

      p_grundl =  ls_komm-sto_grund.
      p_stonr2 = ls_komm-old_sto.
      p_anzahl =  lv_anzahl_sto.


      When 'FC10'.

    Select single
    from zdb_sto24
    Fields
    Count( stonr ) as Anzahl
    Where bearb_status <> 'Erledigt'
    into @Data(lv_count).

    p_anzahl = lv_count.

  ENDCASE.

At SELECTION-SCREEN on VALUE-REQUEST FOR p_stonr.

Perform pstonr.

Form pstonr.
Data: lt_return type table of DDSHRETVAL,
      ls_return type DDSHRETVAL.

select
from zdb_sto24
fields

datum,
uhrzeit,
sto_grund,
kommentar,
nachname,
bearb_status,
stonr
Where bearb_status <> 'Erledigt'
into table @Data(lt_stonr)
up to 10 Rows.



Call function 'F4IF_INT_TABLE_VALUE_REQUEST'
EXPORTING
RETFIELD      = 'ZDB_STO24'
VALUE_ORG     = 'S'
TABLES
Value_TAB     = LT_STONR
Return_Tab    = LT_RETURN

EXCEPTIONS
Parameter_ERROR = 1
NO_VALUES_FOUND = 2
Others          = 3.

read Table lt_return into ls_return index 1.
p_stonr = ls_return-fieldval.


Endform.

AT SELECTION-SCREEN OUTPUT.

  PERFORM listbox_sto_grund USING p_grund.
  PERFORM listbox_techniker USING p_tech.


 FORM listbox_sto_grund USING p_grund.
**********************************************************************
*Störungsgrunde manuell in Listbox

  TYPES: BEGIN OF ls_stogrund,
           stogrund TYPE zsto_grund,
         END OF ls_stogrund.


  DATA: it_stogrund TYPE STANDARD TABLE OF ls_stogrund,
        ls_stogrund TYPE ls_stogrund.


  DATA: g_id3      TYPE vrm_id,
        it_values3 TYPE vrm_values,
        wa_values3 LIKE LINE OF it_values3.


*AT SELECTION-SCREEN OUTPUT.


  ls_stogrund-stogrund = 'kein Strom'.
  APPEND ls_stogrund TO it_stogrund.
  ls_stogrund-stogrund = 'Zählerzuordnung'.
  APPEND ls_stogrund TO it_stogrund.
  ls_stogrund-stogrund = 'Zähler Defekt'.
  APPEND ls_stogrund TO it_stogrund.
  ls_stogrund-stogrund = 'Störung App'.
  APPEND ls_stogrund TO it_stogrund.
  ls_stogrund-stogrund = 'Sonstiges'.
  APPEND ls_stogrund TO it_stogrund.

  LOOP AT it_stogrund INTO ls_stogrund.
    wa_values3-key = ls_stogrund-stogrund.
    wa_values3-text = ls_stogrund-stogrund.

    APPEND wa_values3 TO it_values3.
    CLEAR wa_values3.

  ENDLOOP.


  g_id3 = 'P_GRUND'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = g_id3
      values          = it_values3
    EXCEPTIONS
      id_illegal_name = 1
      OTHERS          = 2.

ENDFORM.

FORM listbox_techniker USING p_tech.
**********************************************************************
* Verfügbare Techniker in Listbox

  TYPES: BEGIN OF ls_tech,
           nachname TYPE znachname,
         END OF ls_tech.


  DATA: it_tech TYPE STANDARD TABLE OF ls_tech,
        ls_tech TYPE ls_tech.

  DATA: g_id      TYPE vrm_id,
        it_values TYPE vrm_values,
        wa_values LIKE LINE OF it_values.


  SELECT
  FROM zdb_technik24
  FIELDS
  nachname
  WHERE v_status = 'X'
  INTO TABLE @it_tech.


  LOOP AT it_tech INTO ls_tech.
    wa_values-key = ls_tech-nachname.
    wa_values-text = ls_tech-nachname.


    APPEND wa_values TO it_values.
    CLEAR wa_values.

  ENDLOOP.

  g_id = 'P_TECH'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = g_id
      values          = it_values
    EXCEPTIONS
      id_illegal_name = 1
      OTHERS          = 2.

Endform.
