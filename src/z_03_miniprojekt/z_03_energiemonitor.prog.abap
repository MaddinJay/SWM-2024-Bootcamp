*&---------------------------------------------------------------------*
*& Report z_03_energiemonitor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_03_energiemonitor. "Der Report des Kunden

DATA gv_kunde TYPE REF TO z_03_cl_kunde.
gv_kunde = NEW #( ).


PARAMETERS: p_kdnr   TYPE zob_tab_costumer-cust_number, "Kundennummer
            p_zaehl  TYPE zob_tab_costumer-meter_value, "Zählerstand
            p_vdate  TYPE zob_tab_costumer-date_of_entry, "Ablesedatum
            p_device TYPE zob_tab_costumer-device_number, "Zählernummer
            p_tphone TYPE zob_tab_costumer-tel_number, "Telefonnummer
            p_aufnr  TYPE zob_tab_costumer-order_number."Auftragsnummer

DATA lv_vorwert TYPE zob_tab_costumer-pre_value.

"Methodenaufruf setZaehlerstand
gv_kunde->setzaehlerstand( iv_kdnr = p_kdnr iv_zaehlerstand = p_zaehl iv_vdate = p_vdate iv_device = p_device iv_tphone = p_tphone iv_auftrnr = p_aufnr iv_prevalue = lv_vorwert ).

"Methodenaufruf berechnungVerbrauch
gv_kunde->berechnungVerbrauch( iv_kdnr3 = p_kdnr iv_auftrnr3 = p_aufnr iv_zstand = p_zaehl iv_vorwert = lv_vorwert ).

"Methodenaufruf berechnungpreis
gv_kunde->berechnungpreis( iv_kdnr3 = p_kdnr iv_auftrnr3 = p_aufnr ).
