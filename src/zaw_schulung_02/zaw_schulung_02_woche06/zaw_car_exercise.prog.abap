*&---------------------------------------------------------------------*
*& Report zaw_car_exercise
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_car_exercise.

PARAMETERS: p_brand TYPE zaw_de_carbrand,
            p_model TYPE zaw_de_carmodel,
            p_jahr  TYPE zaw_de_year_prod,
            p_next  TYPE zaw_persid,

            p_fname TYPE zaw_de_owner_name,
            p_sname TYPE zaw_de_owner_name,
            p_adres TYPE zaw_de_owner_address,
            p_last  TYPE zaw_persid,
            p_ident TYPE zaw_gk_personalnummer,

            p_car   AS CHECKBOX,
            p_owner AS CHECKBOX.


IF p_car = abap_true.

  zaw_klasse_car=>car( iv_model = p_model
                       iv_brand = p_brand
                       iv_jahr = p_jahr
                       iv_next = p_next
                       ).
ENDIF.

IF p_owner = abap_true.

  zaw_klasse_car=>owner( iv_fname = p_fname
                         iv_sname = p_sname
                         iv_address = p_adres
                         iv_brand = p_brand
                         iv_model = p_model
                         iv_last = p_last
                         iv_ident = p_ident
                         ).
ENDIF.

*DATA go_owner TYPE REF TO zaw_cl_check_car.   "Objekt mit Konstruktor-Methode aus der Klasse zaw_cl_check_car
*go_owner = NEW #( iv_sname = p_sname          "Wert, der in die Klasse übergeben wird ( Eingabe als Parameterwert)
*                  iv_fname = p_fname ).
*go_owner->carcheck(  ).
