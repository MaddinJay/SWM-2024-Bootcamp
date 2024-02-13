*&---------------------------------------------------------------------*
*& Report ztw_kerosinverbrauch
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_kerosinverbrauch.

SELECTION-SCREEN BEGIN OF BLOCK suchfeld WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_flugnr TYPE spfli-connid OBLIGATORY,      "Flugnummer; alle als Obligatory, um die Eineindeutigkeit zu gewährleisten
              p_datum  TYPE sflight-fldate OBLIGATORY,    "Flugdatum
              p_fges   TYPE spfli-carrid OBLIGATORY.      "Fluggesellschaft

SELECTION-SCREEN END OF BLOCK suchfeld.

SELECTION-SCREEN BEGIN OF BLOCK kerosinpreis WITH FRAME TITLE TEXT-002.
  PARAMETERS p_preis TYPE p DECIMALS 3 DEFAULT '2.559'.

SELECTION-SCREEN END OF BLOCK kerosinpreis.


START-OF-SELECTION.

  DATA: lo_kerosin        TYPE REF TO ztw_leerflugzeug_menge,
        lo_passagiere     TYPE REF TO ztw_passagier_menge,
        lv_kerosinp_l     TYPE p DECIMALS 2,
        lv_kerosinmenge_l TYPE p DECIMALS 2,
        lv_kerosinmenge_g TYPE p DECIMALS 2,
        lv_gesamtpreis    TYPE p DECIMALS 2,
        lv_valid_input    TYPE abap_bool.

        lv_valid_input = abap_true.



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
    DO.
    CLEAR lv_valid_input.
  IF lv_kerosinmenge_g IS INITIAL.
      MESSAGE 'Bitte überprüfen Sie die eingegebenen Daten.' TYPE 'I'.
    ELSE.
      lv_valid_input = abap_true. " Die Eingaben sind gültig
      EXIT. " Beende die Schleife, da die Eingaben gültig sind
    ENDIF.
  ENDDO.

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
