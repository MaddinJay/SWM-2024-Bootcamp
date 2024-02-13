*&---------------------------------------------------------------------*
*& Report z_03_ueberpruefung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_plausipruefung. "Es geht um den Mitarbeiter

DATA gv_kunde TYPE REF TO zcl_od_kunde.
gv_kunde = NEW #( ).

DATA lv_vorwert TYPE zob_tab_customer-pre_value.
DATA lv_verbrauch TYPE zob_tab_customer-consum.

PARAMETERS: p_kdnr  TYPE zob_tab_customer-cust_number, "Kundennummer
            p_aufnr TYPE zob_tab_customer-order_number, "Auftragsnummer => 1234
            p_zaehl TYPE zob_tab_customer-meter_value. "Zählerstand

PARAMETERS: r_einzl RADIOBUTTON GROUP r1,
            r_alle  RADIOBUTTON GROUP r1.
PARAMETERS: p_status AS CHECKBOX.


IF r_einzl = 'X' AND p_status = ''.
  gv_kunde->getzaehlerstand( iv_kdnr = p_kdnr iv_auftrnr = p_aufnr ). "Funktioniert: z.b. Kundennummer: 2209553355, Auftragsnummer: 1234
ELSEIF r_einzl = 'X' AND p_status ='X'.
  gv_kunde->statusbestaetigen( iv_kdnr2 = p_kdnr iv_auftrnr2 = p_aufnr iv_status = 'Ja' ). "Funktioniert!
ELSEIF r_alle = 'X'.
  gv_kunde->getdatenbank( ). "Funktioniert
ENDIF.


*gv_kunde->berechnungpreispromonat( iv_kdnr3 = p_kdnr iv_auftrnr3 = p_aufnr iv_zstand = p_zaehl iv_vorwert = lv_vorwert iv_verbrauch = lv_verbrauch ).
