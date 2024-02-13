*&---------------------------------------------------------------------*
*& Report z_03_ueberpruefung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_03_ueberpruefung. "Es geht um den Mitarbeiter

DATA gv_kunde TYPE REF TO z_03_cl_kunde.
gv_kunde = NEW #( ).  "Objekt erzeugt

DATA lv_vorwert TYPE zob_tab_costumer-pre_value. "hier importieren wir aus unserer Datenbanktabelle den Vorwert und den Verbrauch
DATA lv_verbrauch TYPE zob_tab_costumer-consum.

PARAMETERS: p_kdnr  TYPE zob_tab_costumer-cust_number, "Kundennummer       -------> Parameter definiert zur Einagbe des Mitarbeiters
            p_aufnr TYPE zob_tab_costumer-order_number. "Auftragsnummer => 12345


PARAMETERS: r_alle RADIOBUTTON GROUP r1,
            r_einzel  RADIOBUTTON GROUP r1.   "-------------> Radiobuttons sowie eine Checkbox: Radiobuttons zur Auswahl, ob man sich nur einen oder alle Kunden anzeigen lassen möchte.
PARAMETERS: p_status AS CHECKBOX.                             " Checkbox um auszuwählen, ob der Bearbeitungsstatus auf 'Ja' gesetzt werden soll.


IF r_alle = 'X' AND p_status IS INITIAL. "---> unsere IF-Formeln, "wenn dies ausgewählt, dann zeige mir das."
  gv_kunde->getzaehlerstand( iv_kdnr = p_kdnr iv_auftrnr = p_aufnr ). "Funktioniert: z.b. Kundennummer: 2209553355, Auftragsnummer: 12345
ELSEIF r_alle = 'X' AND p_status ='X'.
  gv_kunde->statusbestaetigen( iv_kdnr2 = p_kdnr iv_auftrnr2 = p_aufnr iv_status = 'Ja' ). "Funktioniert!
ELSEIF r_einzel = 'X'.
  gv_kunde->getdatenbank( ). "Funktioniert
ENDIF.
