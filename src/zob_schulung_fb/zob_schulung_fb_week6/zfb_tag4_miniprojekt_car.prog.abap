*&---------------------------------------------------------------------*
*& Report zfb_tag4_miniprojekt_car
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_tag4_miniprojekt_car.

*&---------------------------------------------------------------------*
*& Report zem_car
*&-----------------------------"--------------------------------------*
*&
*&---------------------------------------------------------------------*

PARAMETERS: p_model TYPE zem_de_car_model, "Eingabe für Automodell
            p_brand TYPE brand,            "Eingabe für Automarke
            p_jahr  TYPE jahr,              "Eingabe für Produktionsjahr

            p_name  TYPE zem_de_name,
            p_adres TYPE zem_de_address,

            p_car   AS CHECKBOX,
            p_owner AS CHECKBOX.



IF p_car = abap_true.

  zfb_cl_car=>abruf( iv_model = p_model       "Aufruf Mehode mit Übergabe der Eingabewerte
                     iv_brand = p_brand
                      iv_jahr = p_jahr ).

ENDIF.

IF p_owner = abap_true.

  zfb_cl_car=>owner( iv_model = p_model
                     iv_name = p_name
                     iv_brand = p_brand
                     iv_address = p_adres ).
ENDIF.
