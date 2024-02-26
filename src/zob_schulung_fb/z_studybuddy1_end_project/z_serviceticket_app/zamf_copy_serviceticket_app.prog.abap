*&---------------------------------------------------------------------*
*& Report zamf_copy_serviceticket_app
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zamf_copy_serviceticket_app.

TYPE-POOLS: vrm.

**********************************************************************
*  Button "Übersicht Störungen" + "Einträge löschen"

SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON 2(30) anzeige USER-COMMAND show.
  SELECTION-SCREEN: POSITION 83.
  SELECTION-SCREEN PUSHBUTTON (20) loeschen USER-COMMAND fc1.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN: SKIP.


**********************************************************************
* Block 1: "Störung erfassen"
**********************************************************************
* Eingabefelder

SELECTION-SCREEN BEGIN OF BLOCK Stoerung WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_kdnr   TYPE zdb_sto24-stonr.
  PARAMETERS: p_grund  TYPE zkommentar AS LISTBOX VISIBLE LENGTH 20.
  PARAMETERS: p_kommi TYPE zkommentar.
  PARAMETERS: p_datum TYPE frmdatum DEFAULT sy-datum.

  SELECTION-SCREEN: SKIP 1.

* Button "Erfassen"

  SELECTION-SCREEN BEGIN OF LINE.

    SELECTION-SCREEN PUSHBUTTON (30) erfasse USER-COMMAND fc5.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK stoerung.

**********************************************************************
**********************************************************************


**********************************************************************
* Block 2: Techniker manuell zuweisen + Störung manuell abschließen
**********************************************************************
* Eingabefelder: Störungsnummer + Listbox: Technkiker

SELECTION-SCREEN BEGIN OF BLOCK sto WITH FRAME TITLE TEXT-002.

  TYPES: BEGIN OF ls_tech,
           nachname TYPE znachname,
         END OF ls_tech.

  DATA: it_tech    TYPE STANDARD TABLE OF ls_tech,
        ls_technik TYPE ls_tech,
        g_id       TYPE vrm_id,
        it_values  TYPE vrm_values,
        wa_values  LIKE LINE OF it_values.

  PARAMETERS: p_stonr TYPE zstonr. " mit Wertehilfe
  PARAMETERS: p_tech TYPE znachname AS LISTBOX VISIBLE LENGTH 10. "Listbox Techniker


  SELECTION-SCREEN: SKIP.


* Button "Techniker zuweisen" + "Störung abschließen"
**********************************************************************

  SELECTION-SCREEN: BEGIN OF LINE.
    SELECTION-SCREEN: PUSHBUTTON (30) tech_z  USER-COMMAND fc6.
    SELECTION-SCREEN: POSITION POS_LOW.
    SELECTION-SCREEN: PUSHBUTTON (30) erledigt USER-COMMAND fc7.
  SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN END OF BLOCK sto.

**********************************************************************
**********************************************************************

SELECTION-SCREEN SKIP 1.

**********************************************************************
* Block 3: Techniker schnell zuweisen + Anzahl offener Vorgänge
**********************************************************************

SELECTION-SCREEN BEGIN OF BLOCK spezial WITH FRAME TITLE TEXT-004.

  SELECTION-SCREEN SKIP.

* Button + Anzeige: Anzahl offner Vorgänge
**********************************************************************
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN: PUSHBUTTON (30) anzahl USER-COMMAND show2.
    PARAMETERS: p_anzahl(4) TYPE n.
    SELECTION-SCREEN: POSITION POS_LOW.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN: SKIP.

* Button: älteste offene Störung
**********************************************************************
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON (30) quick USER-COMMAND fc9.
    PARAMETERS: p_stonr2 TYPE zstonr.
    PARAMETERS: p_grundl TYPE string.
  SELECTION-SCREEN END OF LINE.

* Button: zuweisen an nächsten freien Techniker
**********************************************************************
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON (30) quickcom USER-COMMAND fc11.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK spezial.

**********************************************************************
**********************************************************************

SELECTION-SCREEN SKIP.

* Button: Anlayse + Eingabefeld für das Datum (ohne Datum, Gesamtanalyse)
**********************************************************************

SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN: POSITION POS_HIGH.
  SELECTION-SCREEN: PUSHBUTTON 83(25) analyse USER-COMMAND exec3.
  PARAMETERS: p_datay TYPE frmdatum.
SELECTION-SCREEN END OF LINE.


* Button: Analyse für den heutigen Tag
**********************************************************************
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN: POSITION 83.
  SELECTION-SCREEN: PUSHBUTTON (25) dat USER-COMMAND show1.
SELECTION-SCREEN END OF LINE.


**********************************************************************
*Benennung der Button (Kommentar = technische Belegung)
**********************************************************************

INITIALIZATION.
  anzeige   = icon_view_list   && 'Übersicht aller Störungen'.   "SHOW
  loeschen  = icon_delete      && 'Eingaben löschen'.            "FC1
  erfasse   = icon_create      && 'Störung erfassen'.            "FC5
  tech_z    = icon_transfer    && 'Techniker zuweisen'.          "FC6
  erledigt  = icon_set_state   && 'Störung abschließen'.         "FC7
  analyse   = ICON_CASHING_UP  && 'Analyse (Datum-->)'.          "EXEC3
  dat       = icon_date        && 'von heute'.                   "SHOW1
  anzahl    = icon_calculation && 'Anzahl unerledigte'.          "SHOW2
  quick     = ICON_LATE_LINK   && 'älteste offene Störung'.      "FC9
  quickcom  = ICON_PM_FREE     && 'an freien Techniker'.         "FC11
**********************************************************************


AT SELECTION-SCREEN.

  DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ). "Initialisierung Klasse


**********************************************************************
* Aktionen anhand von Pushbuttons (Aufruf Methoden + Programmteile)
**********************************************************************

  CASE sy-ucomm.

    WHEN 'SHOW'. "Übersicht aller Störungen

        zmaf_class_sb=>sto_abrufen( ).

    WHEN 'FC1'.  "Eingaben löschen

        CLEAR: p_grund, p_kdnr, p_kommi,  p_tech, p_stonr, p_datay.

    WHEN 'FC5'.  "Störung erfassen

      IF p_kdnr IS INITIAL.
        MESSAGE |{ icon_column_right }Bitte mindestens die Kundennummer vorgeben| TYPE 'I'.
      ELSE.
        lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ip_sgrund = p_grund ip_kommi = p_kommi ip_datum = p_datum ip_tech = p_tech ).
      ENDIF.

    WHEN 'FC6'.  "Techniker zuweisen

      IF p_tech IS INITIAL OR p_stonr IS INITIAL.
        MESSAGE |{ icon_column_right }Bitte Techniker und Störungsnummer auswählen, um Störung zuzuweisen.| TYPE 'I'.
      ELSE.
        lo_sto_erfassen->tech_zuweisen( ip_tech = p_tech ip_stonr = p_stonr ).
        MESSAGE |{ icon_checked }Der Techniker { p_tech } ist der Störungsnr. { p_stonr } zugewiesen| TYPE 'I'.
      ENDIF.

    WHEN 'FC7'.  "Störung abschließen

      IF p_stonr IS INITIAL OR p_stonr = '0000'.
        MESSAGE |{ icon_column_right }Bitte die Störungsnummer auswählen, die abgeschlossen werden soll| TYPE 'I'.
      ELSE.
        lo_sto_erfassen->status_erledigt( ip_stonr = p_stonr ).
        MESSAGE |{ icon_checked } Die Störungsnr. { p_stonr } ist abgeschlossen| TYPE 'I'.
        CLEAR: p_stonr, p_kommi.
      ENDIF.



    WHEN 'SHOW1'. "Analyse heutiger Tag
      SELECT
      FROM zdb_sto24
      FIELDS
      sto_grund,
      COUNT( sto_grund ) AS Anzahl
      WHERE datum = @sy-datum
      GROUP BY sto_grund
      INTO TABLE @DATA(lt_analyse_dat).

      cl_demo_output=>display( lt_analyse_dat ).

**********************************************************************
* Analyse: wieviel Störungen gingen pro Störungsgrund ein


    WHEN 'EXEC3'.  "Button: Analyse

      IF p_datay IS INITIAL.            "Wenn kein Datum eingetragen ist, Analyse über gesamte STO

        SELECT
        FROM zdb_sto24
        FIELDS
        sto_grund,
        COUNT( sto_grund ) AS Anzahl,
        MAX( datum ) AS letzter_Eingang
        GROUP BY sto_grund

        INTO TABLE @DATA(lt_analyse).

        cl_demo_output=>display( lt_analyse ).

      ELSE.                             "Ansonsten zum eingetragenen Datum
        "Analayse für sy-datum (siehe 'SHOW1' = "Analyse heutiger Tag")
        SELECT
        FROM zdb_sto24
        FIELDS
        sto_grund,
        COUNT( sto_grund ) AS Anzahl
        WHERE datum = @p_datay
        GROUP BY sto_grund
        INTO TABLE @DATA(lt_analyse_dat2).

        cl_demo_output=>display( lt_analyse_dat2 ).

      ENDIF.

**********************************************************************
* Abruf älteste offene Störung + Anzahl noch offener für Aktualisierung

    WHEN 'FC9'. "Button: Älteste offene Störung


      SELECT SINGLE "Button: Anzahl
        FROM zdb_sto24
        FIELDS
        COUNT( stonr ) AS Anzahl
        WHERE bearb_status = 'NEU'
        INTO @DATA(lv_anzahl_sto).


      SELECT SINGLE "Button: offene Störungen
        FROM zdb_sto24
        FIELDS
        MIN( datum ) AS old,
        sto_grund,
        stonr AS old_sto
        WHERE nachname IS INITIAL OR nachname = ''
        GROUP BY  stonr, sto_grund
        INTO @DATA(ls_komm).

      p_grundl =  ls_komm-sto_grund.
      p_stonr2 = ls_komm-old_sto.
      p_anzahl =  lv_anzahl_sto.


**********************************************************************
* Abruf Anzahl unerledigter Vorgänge

    WHEN 'SHOW2'. "Button: Anzahl unerledigte

      SELECT SINGLE
      FROM zdb_sto24
      FIELDS
      COUNT( stonr ) AS Anzahl
      WHERE bearb_status = 'NEU'
      INTO @DATA(lv_count).

      p_anzahl = lv_count.

**********************************************************************
* Abgerufene Störungsnummer an nächsten freien Techniker zuweisen

    WHEN 'FC11'. "Button: An freien Techniker

      DATA lv_techniker TYPE znachname.

      lv_techniker = lo_sto_erfassen->quick_complete( ip_stonr2 = p_stonr2 ).

      IF lv_techniker is not Initial.
      Message |{ icon_checked }Die Störungsnummmer { p_stonr2 } ist dem Techniker { lv_techniker } zugewiesen| TYPE 'S'.

      clear: p_grundl, p_stonr.

      Else.

      MESSAGE |{ icon_checked }Aktuell sind keine Technkiker verfügbar.| TYPE 'S'.

      Endif.

      SELECT SINGLE
      FROM zdb_sto24
      FIELDS
      COUNT( stonr ) AS Anzahl
      WHERE bearb_status = 'NEU'
      INTO @DATA(lv_count2).

      p_anzahl = lv_count2.

      IF lv_count2 < 1.
        MESSAGE |{ icon_negative }Es sind aktuell keine neuen Störungen vorhanden.| TYPE 'I'.
      ENDIF.

  ENDCASE.

**********************************************************************
**********************************************************************
* Programmteile für Listboxen und Wertehilfen


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_stonr.

  PERFORM pstonr.    "Werthilfe offener Vorgänge für Eingabefeld Störungsnummer

FORM pstonr.   "Werthilfe offener Vorgänge für Eingabefeld Störungsnummer


  DATA: lt_return TYPE TABLE OF ddshretval,
        ls_return TYPE ddshretval.

  SELECT
  FROM zdb_sto24
  FIELDS

  datum,
  uhrzeit,
  sto_grund,
  kommentar,
  nachname,
  bearb_status,
  stonr
  WHERE bearb_status <> 'ERLEDIGT'
  INTO TABLE @DATA(lt_stonr)
  UP TO 10 ROWS.



  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'ZDB_STO24'
      value_org       = 'S'
    TABLES
      Value_TAB       = lt_stonr
      Return_Tab      = lt_return
    EXCEPTIONS
      Parameter_ERROR = 1
      no_values_found = 2
      OTHERS          = 3.

  READ TABLE lt_return INTO ls_return INDEX 1.
  p_stonr = ls_return-fieldval.


ENDFORM.


AT SELECTION-SCREEN OUTPUT.

  PERFORM listbox_sto_grund USING p_grund.      "Listbox: Inhalte für STO-Grund


  PERFORM listbox_techniker USING p_tech.       "Listbox: Inhalte für verfügbare Techniker

 FORM listbox_sto_grund USING p_grund.           "Listbox: Inhalte für STO-Grund
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

FORM listbox_techniker USING p_tech.            "Listbox: Inhalte für verfügbare Techniker
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

ENDFORM.
