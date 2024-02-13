*&---------------------------------------------------------------------*
*& Report zaw_modularisierung_kunde
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_modularisierung_kunde.


***Erstellen Sie ein Funktionsgruppe mit Funktionsbausteine.

*Findet die Kundennummer (kunnr) eines Kunden basierend auf dessen Namen, bei mehreren möglichen Einträgen bitte alle zurückgeben.

TYPES: BEGIN OF lty_s_kunde,
         Kundennummer TYPE string,
         Kundenname   TYPE string,
       END OF lty_s_kunde,
       lty_t_kunde TYPE TABLE OF lty_s_kunde.


DATA: ls_kunde TYPE lty_s_kunde,
      lt_kunde TYPE lty_t_kunde,
      lv_name  TYPE string VALUE 'Domestic US Customer 2',
      lv_stras TYPE string,
      lv_plz   TYPE pstlz,
      lv_ort   TYPE string,
      lv_regio TYPE regio,
      BEGIN OF ls_kontakt,
        Kundenname TYPE string,
        Vorname    TYPE string,
        Nachname   TYPE string,
      END OF ls_kontakt,
      lt_kontakt LIKE TABLE OF ls_kontakt.


CALL FUNCTION 'Z_AW_FM_KUNDENNUMMER'
  EXPORTING
    ip_name  = lv_name
  IMPORTING
    et_kunde = lt_kunde.

LOOP AT lt_kunde INTO ls_kunde.
  WRITE: / |Kundenname: { ls_kunde-kundenname }, Kundennummmer: { ls_kunde-kundennummer }|.
ENDLOOP.

ULINE.


* Gebt die Adresse eines Kunden zurück.

CALL FUNCTION 'Z_AW_FM_ADRESSE'
  EXPORTING
    ip_name  = lv_name
  IMPORTING
    ev_stras = lv_stras
    ev_plz   = lv_plz
    ev_ort   = lv_ort
    ev_regio = lv_regio.

WRITE: lv_name, lv_stras, lv_plz, lv_ort, lv_regio.

ULINE.


*Gebt die Kontaktperson des Kunden zurück

CALL FUNCTION 'Z_AW_FM_KONTAKT'
  EXPORTING
    ip_name    = lv_name
  IMPORTING
    et_kontakt = lt_kontakt.

LOOP AT lt_kontakt INTO ls_kontakt.
  IF ls_kontakt-nachname IS NOT INITIAL.
    WRITE: / |Kunde "{ ls_kontakt-kundenname }" hat folgende*n Ansprechpartner*in: { ls_kontakt-vorname } { ls_kontakt-nachname }|.
  ENDIF.
ENDLOOP.
