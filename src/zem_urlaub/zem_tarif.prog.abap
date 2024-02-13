*&---------------------------------------------------------------------*
*& Report zem_tarif
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_tarif.



SELECTION-SCREEN BEGIN OF BLOCK info WITH FRAME TITLE TEXT-001.

  PARAMETERS p_verbr TYPE i.
  PARAMETERS p_handel TYPE zem_dt_centkwh OBLIGATORY.  "Mussfeld: Handelspreis.
                                                          "NUR SO kann konstendeckender Tarif ermittelt werden
  PARAMETERS p_fix AS CHECKBOX.
  PARAMETERS p_fix2 AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK info.

START-OF-SELECTION.


  DATA lo_betragsermittlung TYPE REF TO zem_class_erm_auft.
*Data lo_handelspreis  type ref to zem_class_preis_vert.

  lo_betragsermittlung = NEW #( ). "aufruf Instanz. Methodenaufruf unten

**********************************************************************
*Ausführung: Eingegebener Verbrauch + Tarif:
*(Tarif wird aus Handelspreis, abzuführende Preisbestandteile und fixer Vertriebsteils
*über zwei Klasse zem_class_preisfix und zem_class_preis_vert ermittelt)
********************************************************************

  lo_betragsermittlung->gesamtforderung( iv_verbrauch = p_verbr
                                       iv_handelspreis = p_handel ).

**********************************************************************
* 2 Checkboxen Auflistung Preisbeststandteile,die abgeführt werden müssen....Anhand Eingabe Verbrauch,
**************************************************************

  IF p_fix = abap_true.

* 1. Checkbox: Beträge werden mit modifiy auf eine lokale Tabelle überführt und angezeigt.
    lo_betragsermittlung->fixteile( iv_verbrauch2 = p_verbr ).

  ENDIF.

  IF p_fix2 = abap_true.

* 2. Checkbox: eine weitere Auflistung mit zusätzlichen Angaben zur Verwendung der Gelder
    lo_betragsermittlung->fixteile2( iv_verbrauch3 = p_verbr ).

  ENDIF.

**********************************************************************






**********************************************************************
*Versuch den Handelspreis in die Methode der Klasse zem_class_preis_vert von einer anderen Klasse
*übernehmen zu lassen, schlug fehl.
