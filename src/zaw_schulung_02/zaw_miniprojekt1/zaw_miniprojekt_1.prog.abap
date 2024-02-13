*&---------------------------------------------------------------------*
*& Report zaw_miniprojekt_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_miniprojekt_1.

**********************************************************************
* SelectionScreen, damit der Nutzer mit 3 Parametern einen bestimmten Flug auswählen kann
* und um dem Nutzer die vorhandenen Flüge anzeigen zu können
**********************************************************************
START-OF-SELECTION.
  TABLES sflight.
  SELECTION-SCREEN BEGIN OF SCREEN 100 TITLE TEXT-001 AS WINDOW. "Text umändern
    SELECT
     FROM spfli LEFT JOIN sflight ON sflight~connid = spfli~connid
     FIELDS
     sflight~carrid,
     sflight~connid,
     sflight~fldate,
     spfli~cityfrom,
     spfli~cityto
     WHERE fldate IS NOT INITIAL
     INTO TABLE @DATA(lt_fldate).
    cl_demo_output=>display( lt_fldate ).
    PARAMETERS: p_connid TYPE sflight-connid OBLIGATORY,
                p_carrid TYPE sflight-carrid OBLIGATORY,
                p_fldate TYPE sflight-fldate OBLIGATORY,
                p_preis  TYPE p DECIMALS 2.
  SELECTION-SCREEN END OF SCREEN 100.

  CALL SELECTION-SCREEN 100 USING SELECTION-SET 100.

**********************************************************************
**Suchhilfe für Datum
**********************************************************************
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fldate.

  DATA: lt_return TYPE TABLE OF ddshretval, "Tabellen und Strukturen deklarieren
        ls_return TYPE ddshretval.
  DATA: lt_return2 TYPE STANDARD TABLE OF dynpread.

  lt_return2 = VALUE #( ( fieldname = 'P_FLUG' ) ( fieldname = 'P_CARRID' ) ). "lt_return2 eine VALUE einfügen

  CALL FUNCTION 'DYNP_VALUES_READ' "Liest Werte aus einem Selektionsbild
    EXPORTING
      dyname     = sy-cprog
      dynumb     = sy-dynnr
    TABLES
      dynpfields = lt_return2.


  DATA: lv_carrid TYPE sflight-carrid, "Variablen deklarieren
        lv_flug   TYPE sflight-connid.

  lv_carrid = lt_return2[ fieldname = 'P_CARRID' ]-fieldvalue. "Variablen eine fieldvalue geben
  lv_flug = lt_return2[ fieldname = 'P_FLUG' ]-fieldvalue.

  IF lv_carrid IS INITIAL AND lv_flug IS INITIAL. " If-Befehl für alle möglichen Fälle.
    SELECT fldate FROM sflight INTO TABLE @DATA(lt_sflight).
  ELSEIF lv_flug IS INITIAL.
    SELECT fldate FROM sflight WHERE carrid = @lv_carrid INTO TABLE @lt_sflight.
  ELSEIF lv_carrid IS INITIAL.
    SELECT fldate FROM sflight WHERE connid = @lv_flug INTO TABLE @lt_sflight.
  ELSE.
    SELECT fldate FROM sflight WHERE carrid = @lv_carrid AND connid = @lv_flug INTO TABLE @lt_sflight.
  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST' "Baustein für VALUE-Help-Fenster befüllen
    EXPORTING
      retfield        = 'FLDATE'
      value_org       = 'S'
    TABLES
      value_tab       = lt_sflight
      return_tab      = lt_return
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  READ TABLE lt_return INTO ls_return INDEX 1. "Zeile Nummer 1 wird aus der Tabelle in die Struktur ausgelesen.
  p_fldate = |{ ls_return-fieldval+6(4) }{ ls_return-fieldval(2) }{ ls_return-fieldval+3(2) }|. "ls_return-fieldval. ist eine Zeile aus der Tabelle und fieldval die Spalte. Wir nehmen variable, gehen 6 zeichen nach rechts und nehmen die ersten 4 Zeichen

**********************************************************************
* Es werden Daten aus den Tabellen SAPLANE, SFLIGHT und SPFLI abgerufen und in der Strktur gs_spfli gespeichert
* Die Anzahl der belegten Sitzplätze wird summiert
**********************************************************************
  SELECT SINGLE
     FROM saplane
     JOIN sflight ON saplane~planetype = sflight~planetype
     JOIN spfli ON sflight~carrid = spfli~carrid AND sflight~connid = spfli~connid
     FIELDS
     spfli~connid,
     spfli~carrid,
     saplane~consum AS verbrauch_kg,
     saplane~planetype,
     spfli~distance AS flugdistanz,
     spfli~fltime AS flugzeit,
     spfli~distid AS flugdistanzID,
SUM( sflight~seatsocc ) AS seatsocc,
SUM( sflight~seatsocc_b ) AS seatsocc_b,
SUM( sflight~seatsocc_f ) AS seatsocc_f,
SUM( sflight~seatsocc + sflight~seatsocc_b + sflight~seatsocc_f ) AS totalSumOcc
     WHERE sflight~connid = @p_connid
     AND sflight~carrid = @p_carrid
     AND sflight~fldate = @p_fldate
GROUP BY spfli~connid,
     spfli~carrid,
     saplane~consum,
     saplane~planetype,
     spfli~distance,
     spfli~fltime,
     sflight~carrid,
     spfli~distid
  INTO @DATA(gs_spfli).


  DATA lv_verbrauch TYPE p DECIMALS 3.
  DATA lv_kosten TYPE p DECIMALS 2.


* 1) Definition der Referenzvariablen (Objektreferenz), die auf die Klasse zeigt

  DATA gv_verbrauch_in_kg TYPE REF TO zaw_gcl_miniprojekt1.

* 2) Instanziierung (mit der Referenzvariablen wird aus der Klasse ein Objekt gebildet)

  gv_verbrauch_in_kg = NEW #( ).

* 3) Aufruf der Methode aus der Klasse für das Objekt, das wir erzeugt haben, über den Objektkomponentenselektor

  gv_verbrauch_in_kg->get_verbrauch(
    EXPORTING                                    "Parameter, die aus der Struktur abgeleitet und an die Klasse weitergegeben werden
      iv_flugzeit     = gs_spfli-flugzeit
      iv_verbrauch_kg = gs_spfli-verbrauch_kg
      iv_totalsumocc  = gs_spfli-totalsumocc
    IMPORTING                                     "Der Export-Parameter empfängt das berechnete Ergebnis aus der Klasse und speichert es in der Variablen
      ev_verbrauch    = lv_verbrauch
  ).


  IF sy-subrc = 0 AND lv_verbrauch IS NOT INITIAL.
    WRITE: icon_green_light, |Für die Distanz von { gs_spfli-flugdistanz } { gs_spfli-flugdistanzid } verbraucht dieser Flug { lv_verbrauch } kg Kerosin.| .
    ULINE.
    IF p_preis IS NOT INITIAL.
      lv_kosten = p_preis * lv_verbrauch.
      WRITE: / icon_yellow_light, |Für diesen Verbrauch entstehen Kosten in Höhe von { lv_kosten } Euro.|.
    ENDIF.
  ELSE.
    DATA(lv_message) = |{ icon_red_light } Diesen Flug gibt es nicht!|.
    MESSAGE lv_message TYPE 'I'.
  ENDIF.
