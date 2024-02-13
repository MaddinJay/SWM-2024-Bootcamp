*&---------------------------------------------------------------------*
*& Report z_03_energiemonitor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_energiemonitor. "Es geht um den Kunden

DATA gv_kunde TYPE REF TO zcl_od_kunde.
gv_kunde = NEW #( ).


PARAMETERS: p_kdnr   TYPE zob_tab_customer-cust_number, "Kundennummer
            p_zaehl  TYPE zob_tab_customer-meter_value, "Zählerstand
            p_vdate  TYPE zob_tab_customer-date_of_entry, "Ablesedatum
            p_device TYPE zob_tab_customer-device_number, "Zählernummer => eig. schon Kunde, brauchen wir Zählernummer noch?
            p_tphone TYPE zob_tab_customer-tel_number, "Telefonnummer => 0897549256
            p_aufnr  TYPE zob_tab_customer-order_number."Auftragsnummer => 1234
*            p_vrwrt type zob_tab_customer-pre_value.

DATA lv_vorwert TYPE zob_tab_customer-pre_value.

"Methodenaufruf setZaehlerstand
gv_kunde->setzaehlerstand( iv_kdnr = p_kdnr iv_zaehlerstand = p_zaehl iv_vdate = p_vdate iv_device = p_device iv_tphone = p_tphone iv_auftrnr = p_aufnr iv_prevalue = lv_vorwert ).

"Methodenaufruf berechnungVerbrauch
gv_kunde->berechnungVerbrauch( iv_kdnr3 = p_kdnr iv_auftrnr3 = p_aufnr iv_zstand = p_zaehl iv_vorwert = lv_vorwert ).

"Methodenaufruf berechnungpreis
gv_kunde->berechnungpreis( iv_kdnr3 = p_kdnr iv_auftrnr3 = p_aufnr ).
**********************************************************************
**********************************************************************
