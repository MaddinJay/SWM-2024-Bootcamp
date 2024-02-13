*&---------------------------------------------------------------------*
*& Report zuh_miniprojekt_endfassung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_miniprojekt_endfassung.

SELECTION-SCREEN BEGIN OF BLOCK suchfeld WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_fges   TYPE sflight-carrid OBLIGATORY,      "Fluggesellschaft
              p_flugnr TYPE sflight-connid OBLIGATORY,      "Flugnummer; alle als Obligatory, um die Eineindeutigkeit zu gewährleisten
              p_datum  TYPE sflight-fldate OBLIGATORY.       "Flugdatum

SELECTION-SCREEN END OF BLOCK suchfeld.

SELECTION-SCREEN BEGIN OF BLOCK kerosinpreis WITH FRAME TITLE TEXT-002.
  PARAMETERS p_preis TYPE p DECIMALS 3 DEFAULT '2.559'.   "per Default wird der Kerosinpreis vorgegeben, kann aber verändert bzw. gelöscht werden

SELECTION-SCREEN END OF BLOCK kerosinpreis.

START-OF-SELECTION.

  DATA: lo_kerosin        TYPE REF TO z_g2_leerflugzeug_endfassung,
        lo_passagiere     TYPE REF TO z_g2_passagiere_endfassung,
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

  CALL METHOD lo_kerosin->display_kerosinmeng_l.            "Ausgabe der Kerosinmenge für das leere Flugzeug in L

  CALL METHOD lo_passagiere->anzeige.                       "Ausgabe der Kerosinmenge für die Passagiere in L


**********************************************************************
*Berechnung Gesamtmenge Kerosin:
**********************************************************************

  lv_kerosinp_l = lo_passagiere->kerosinp_l.                "Übergabe Kerosinmenge leeres Flugzeug
  lv_kerosinmenge_l = lo_kerosin->kerosinmenge_l.           "Übergabe Kerosinmenge Passagiere
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
