*&---------------------------------------------------------------------*
*& Report zuh_miniprojekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_miniprojekt.


SELECTION-SCREEN BEGIN OF BLOCK suchfeld WITH FRAME TITLE TEXT-001.
  TYPES lv_flugnr TYPE sflight-connid.
  PARAMETERS: p_fges   TYPE sflight-carrid OBLIGATORY,      "Fluggesellschaft
              p_flugnr TYPE sflight-connid OBLIGATORY,      "Flugnummer; alle als Obligatory, um die Eineindeutigkeit zu gewährleisten
              p_datum  TYPE sflight-fldate OBLIGATORY.       "Flugdatum

SELECTION-SCREEN END OF BLOCK suchfeld.

SELECTION-SCREEN BEGIN OF BLOCK kerosinpreis WITH FRAME TITLE TEXT-002.
  PARAMETERS p_preis TYPE p DECIMALS 3 DEFAULT '2.559'.

SELECTION-SCREEN END OF BLOCK kerosinpreis.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_datum.

  DATA: lt_return TYPE TABLE OF ddshretval, "Tabellen und Strukturen deklarieren
        ls_return TYPE ddshretval.
  DATA: lt_return2 TYPE STANDARD TABLE OF dynpread.

  lt_return2 = VALUE #( ( fieldname = 'P_FLUGNR' ) ( fieldname = 'P_FGES' ) ). "lt_return2 eine VALUE einfügen

  CALL FUNCTION 'DYNP_VALUES_READ' "Liest Werte aus einem Selektionsbild
    EXPORTING
      dyname     = sy-cprog
      dynumb     = sy-dynnr
    TABLES
      dynpfields = lt_return2.


  DATA: lv_carrid TYPE sflight-carrid, "Variablen deklarieren
        lv_flug   TYPE sflight-connid.

  lv_carrid = lt_return2[ fieldname = 'P_FGES' ]-fieldvalue. "Variablen eine fieldvalue geben
  lv_flug = lt_return2[ fieldname = 'P_FLUGNR' ]-fieldvalue.

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
  p_datum = |{ ls_return-fieldval+6(4) }{ ls_return-fieldval(2) }{ ls_return-fieldval+3(2) }|.


START-OF-SELECTION.

  DATA: lo_kerosin        TYPE REF TO z_g2_leerflugzeug,
        lo_passagiere     TYPE REF TO z_g2_passagiere,
        lv_kerosinp_l     TYPE p DECIMALS 2,
        lv_kerosinmenge_l TYPE p DECIMALS 2,
        lv_kerosinmenge_g TYPE p DECIMALS 2,
        lv_gesamtpreis    TYPE p DECIMALS 2.

  CREATE OBJECT lo_kerosin.
  CREATE OBJECT lo_passagiere.


  CALL METHOD lo_kerosin->berechnung_kerosinmenge       "hier muss Exporting erfolgen, damit die Werte korrekt in die Methode gezogen werden.
    EXPORTING
      iv_flugnr = p_flugnr
      iv_datum  = p_datum
      iv_fges   = p_fges.

  CALL METHOD lo_passagiere->berechnung_keromenge_personen
    EXPORTING
      iv_flugnr = p_flugnr
      iv_datum  = p_datum
      iv_fges   = p_fges.

  CALL METHOD lo_kerosin->display_kerosinmeng_l.           "Ausgabe der Kerosinmenge für das leere Flugzeug in L

  CALL METHOD lo_passagiere->anzeige.                     "Ausgabe der Kerosinmenge für die Passagiere in L


**********************************************************************
*Berechnung Gesamtmenge Kerosin:
**********************************************************************

  lv_kerosinp_l = lo_passagiere->kerosinp_l.
  lv_kerosinmenge_l = lo_kerosin->kerosinmenge_l.
  lv_kerosinmenge_g = lv_kerosinmenge_l + lv_kerosinp_l.



**********************************************************************
*Ausgabe der Gesamtmenge
**********************************************************************
  ULINE.
  WRITE / |Es sollten mindestens { lv_kerosinmenge_g } Liter Kerosin getankt werden.|.

**********************************************************************
*Message falls ein Eingabefehler unterlaufen ist.
**********************************************************************

  IF lv_kerosinmenge_g IS INITIAL.
    MESSAGE 'Bitte überprüfen Sie die eingegebenen Daten.' TYPE 'I'.
  ENDIF.

**********************************************************************
*Berechnung Kerosinpreis
**********************************************************************

  lv_gesamtpreis = lv_kerosinmenge_g * p_preis.

  ULINE.

**********************************************************************
*Falls Kerosinpreis gelöscht wurde
**********************************************************************

  IF p_preis IS INITIAL.                                        "Ausgabe mit If-Schleife, falls kein Kerosinpreis vorgegeben wird.
    WRITE 'Sie haben keinen Preis pro Liter angegeben.'.
  ELSE.
    WRITE |Die Gesamtkosten betragen { lv_gesamtpreis } EURO.|.
  ENDIF.
