*&---------------------------------------------------------------------*
*& Report z_fb_tag3_fuba_uebung3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_tag3_fuba_uebung3.

*Extra: Funktionsgruppe Aufgabenstellung
*Erstellen Sie ein Funktionsgruppe mit Funktionsbausteine.
*Diese sollen das folgende tun:
*• • Findet die Kundennummer (kunnr) eines Kunden basierend auf dessen Namen,
* bei mehreren möglichen Einträgen, geben Sie alle zurück
*• • Gibt die Adresse eines Kunden zurück
*• • Gibt die Kontaktperson des Kunden zurück
*• • Gibt alle Verkaufsdokumente eines Kunden zurück
*
*Tabellen: KNA1, KNVK, VBAK

DATA: BEGIN OF ls_tab,
kundname    TYPE CHAR35,
kundnr      TYPE CHAR10,
ort         TYPE CHAR35,
PLZ         TYPE CHAR10,
regio       TYPE CHAR3,
      END OF ls_tab,
lt_ergebnis LIKE TABLE OF ls_tab.

*PARAMETERS p_knr TYPE kunnr.

CALL FUNCTION 'Z_FB_FUBA_KUNDNR'

  EXPORTING
    iv_name  = 'Domestic US Customer 1'
  IMPORTING
    lt_kund = lt_ergebnis.

cl_demo_output=>display( lt_ergebnis ).
