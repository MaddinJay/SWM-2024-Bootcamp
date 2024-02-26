*&---------------------------------------------------------------------*
*& Report z_mul_prog_stromverbrauch
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_mul_prog_stromverbrauch.


SELECTION-SCREEN BEGIN OF BLOCK eingabe WITH FRAME TITLE TEXT-001.
  SELECTION-SCREEN BEGIN OF BLOCK eingabe1 WITH FRAME.

    PARAMETERS: p_kdnr TYPE zmul_de_kdnr OBLIGATORY,           "Kundennummer
                p_znr  TYPE zmul_de_znr OBLIGATORY,            "Zählernummer
                p_datum TYPE zmul_de_abldat OBLIGATORY.        "Ablesedatum

  SELECTION-SCREEN END OF BLOCK eingabe1.

  SELECTION-SCREEN BEGIN OF BLOCK zst WITH FRAME.

    PARAMETERS: p_zst   TYPE zmul_de_zst OBLIGATORY.          "Zählerstand

    PARAMETERS: rb_kd  RADIOBUTTON GROUP doku DEFAULT 'X',    " Kundenablesung
                rb_swm RADIOBUTTON GROUP doku.                " EVU-Ablesung

  SELECTION-SCREEN END OF BLOCK zst.


  SELECTION-SCREEN BEGIN OF BLOCK delete WITH FRAME.

    PARAMETERS: p_del AS CHECKBOX.                            "Datensatz löschen

  SELECTION-SCREEN END OF BLOCK delete.

SELECTION-SCREEN END OF BLOCK eingabe.


DATA: lt_tabelle       TYPE TABLE OF zmul_db_zst,
      ls_struktur      TYPE          zmul_db_zst,

      lv_status        TYPE          zmul_de_status,
      lv_plausi_status TYPE          zmul_de_status.

DATA: lv_jahr_verb      TYPE           i,
      lv_jahr           TYPE           i,
      lv_vergleich      TYPE           p DECIMALS 2.


**********************************************************************
* 1. Prüfung - ist Zählerstand höher als der letzte - in Class1
**********************************************************************

START-OF-SELECTION.

  DATA(lo_class1) = NEW z_mul_class1_miniprojekt( ).

  lv_status = lo_class1->zst_pruefen( ip_kdnr      = p_kdnr
                                      ip_zaehlernr = p_znr
                                      ip_zaehlerst = p_zst
                                      ip_datum     = p_datum ).


**********************************************************************
*Übergbe Ergebnis aus 1. in ein Unterprogramm
**********************************************************************
* Im Unterproramm wird Datensatz zur DB hinzugefügt. Mit Status P oder W
**********************************************************************


  PERFORM zmul_form_1plausi USING lv_status p_datum p_zst p_znr p_kdnr.

FORM zmul_form_1plausi USING lv_status p_datum p_zst p_znr p_kdnr.


  IF lv_status = 'P'.

    ls_struktur-bearb_status = 'P'.
    ls_struktur-ablesedatum  = p_datum.
    ls_struktur-zaehlerstand = p_zst.
    ls_struktur-zaehlernr    = p_znr.
    ls_struktur-kundennr     = p_kdnr.

    MODIFY zmul_db_zst FROM ls_struktur.

  ELSEIF lv_status = 'W'.

    WRITE / 'Zählerstand ist unplauibel'.

  ENDIF.
ENDFORM.

START-OF-SELECTION.

  DATA lv_ist_verb TYPE zmul_de_zst.


***********************************************************************
* Nur wenn der Status P ist, wird die Bearbietung vorgesetzt
**********************************************************************
* In Class 2 werden Informationen zum aktuellen Verbrauch abgerufen
**********************************************************************

IF p_del = abap_true.
    DELETE FROM zmul_db_zst WHERE kundennr = p_kdnr AND ablesedatum = p_datum AND zaehlerstand = p_zst.
    Write:  '@11@', |Ableseergebnis { p_zst } vom { p_datum } wird gelöscht|.

 Elseif lv_status = 'P' and p_del <> abap_true and lv_status <> 'W'.

    DATA(lo_class2) = NEW zem_class2_miniprojekt(  ).

    lv_ist_verb = lo_class2->anzeige_aktueller_verbrauch( ip_kdnr = p_kdnr ).

    lo_class2->ermittlung_gesamtverbrauch( IMPORTING rv_jahr = lv_jahr
                                                     rv_jahr_verb = lv_jahr_verb ).

**********************************************************************
* mit dem Ergebnis aus 2. wird die zweite Prüfung durchgeführt, aus der Status F oder W zurückkommt.
**********************************************************************



    lv_plausi_status = lo_class1->zst_plausi( iv_jahr = lv_jahr
                                              iv_jahr_verb = lv_jahr_verb ).

  ENDIF.


**********************************************************************
* Unterprogramm: Datensatz mit Status und festgestellten Verbrauch in Datenbank updaten
**********************************************************************


  PERFORM zmul_form_plausi2 USING lv_plausi_status.

FORM zmul_form_plausi2 USING lv_plausi_status.


  if lv_plausi_status = 'W'.

    ls_struktur-bearb_status = 'W'.
    ls_struktur-ablesedatum  = p_datum.
    ls_struktur-zaehlerstand = p_zst.
    ls_struktur-zaehlernr    = p_znr.
    ls_struktur-kundennr     = p_kdnr.
    ls_struktur-ableseart    = 'K'.
    ls_struktur-ist_verbrauch = lv_ist_verb.

    MODIFY zmul_db_zst FROM ls_struktur.

  ELSEIF lv_plausi_status = 'F'.

    ls_struktur-bearb_status = 'F'.
    ls_struktur-ablesedatum  = p_datum.
    ls_struktur-zaehlerstand = p_zst.
    ls_struktur-zaehlernr    = p_znr.
    ls_struktur-kundennr     = p_kdnr.
    ls_struktur-ableseart    = 'K'.
    ls_struktur-ist_verbrauch = lv_ist_verb.

    MODIFY zmul_db_zst FROM ls_struktur.


  ELSEIF lv_plausi_status    = 'P'.
    ls_struktur-bearb_status = 'F'.
    ls_struktur-ablesedatum  = p_datum.
    ls_struktur-zaehlerstand = p_zst.
    ls_struktur-zaehlernr    = p_znr.
    ls_struktur-kundennr     = p_kdnr.
    ls_struktur-ableseart    = 'K'.
    ls_struktur-ist_verbrauch = lv_ist_verb.

    MODIFY zmul_db_zst FROM ls_struktur.

  ENDIF.



ENDFORM.
