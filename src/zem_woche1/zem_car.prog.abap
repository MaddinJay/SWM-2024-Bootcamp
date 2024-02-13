*&---------------------------------------------------------------------*
*& Report zem_car
*&-----------------------------"--------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_car.

PARAMETERS: p_model  TYPE zem_de_car_model, "Eingabe für Automodell
            p_brand  TYPE brand,            "Eingabe für Automarke
            p_jahr   TYPE jahr, "Eingabe für Produktionsjahr
            p_aktstd TYPE int4,


            p_name   TYPE zem_de_name,
            p_adres  TYPE zem_de_address,
            p_fahrnr TYPE zem_db_owner-fahr_nr,

            p_car    AS CHECKBOX,
            p_owner  AS CHECKBOX.
"Jede 30 000km muss eine Inspektion gemacht werden
CONSTANTS inspektion TYPE zem_db_car-inspektion VALUE 30000.
DATA bis_check TYPE zem_db_car-km_bis_check.
IF p_car = abap_true.

  zem_cl_car=>abruf(
  EXPORTING iv_model = p_model       "Aufruf Mehode mit Übergabe der Eingabewerte
                     iv_brand = p_brand
                      iv_jahr = p_jahr
                      iv_inspektion = inspektion
                      iv_aktstand = p_aktstd
  IMPORTING
                      ev_bischeck = bis_check ).

  WRITE: / 'Anzahl km bis zur Reparatur', bis_check.
ENDIF.

IF p_owner = abap_true.

  zem_cl_car=>owner( iv_model = p_model
                     iv_name = p_name
                     iv_brand = p_brand
                     iv_address = p_adres
                     iv_fahrnr = p_fahrnr ).
ENDIF.
