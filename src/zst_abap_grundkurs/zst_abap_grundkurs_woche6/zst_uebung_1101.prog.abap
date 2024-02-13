*&---------------------------------------------------------------------*
*& Report zst_uebung_1101
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_1101.

PARAMETERS: p_marke TYPE zobst_t_car2-automarke, "Parameter zur Eingabe der Daten für die Tabelle
            p_model TYPE zobst_t_car2-model,
            p_jahr  TYPE zobst_t_car2-produktionsjahr. "Typen werden aus der Tabelle gezogen


SELECT
FROM
zobst_t_car2
FIELDS
automarke,
model,
produktionsjahr
INTO @DATA(lt_car).

ENDSELECT.

INSERT INTO zobst_t_car2 VALUES @( VALUE
#( automarke = p_marke
model = p_model
produktionsjahr = p_jahr ) ).
