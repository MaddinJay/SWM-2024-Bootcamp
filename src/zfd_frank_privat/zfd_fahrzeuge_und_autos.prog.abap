*&---------------------------------------------------------------------*
*& Report zfd_fahrzeuge_und_autos
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_fahrzeuge_und_autos.

INCLUDE zfd_cl_fahrzeug.
INCLUDE zfd_cl_auto.

START-OF-SELECTION.

  PARAMETERS: p_herst TYPE string,
              p_mod   TYPE string,
              p_bauj  TYPE n LENGTH 4.

  DATA gv_alter TYPE i.
  DATA go_car TYPE REF TO lcl_auto.

  go_car = NEW #( iv_ahersteller = p_herst iv_amodell = p_mod iv_atueren = 88 ).


*  go_car->set_daten(  iv_hersteller = p_herst
*                      iv_modell = p_mod
*                      iv_baujahr = p_bauj
*                    ).

  go_car->set_tueren( iv_tueren = 4 ).
  go_car->display_details(  ).

  WRITE / |ende.|.
