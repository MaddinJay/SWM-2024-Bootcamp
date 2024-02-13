*&---------------------------------------------------------------------*
*& Report zuh_daten_in_scustom
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_daten_in_scustom.
types ls_kunde type scustom.

PARAMETERS: p_id_n(8)    TYPE n.


INITIALIZATION.
DATA p_name(25) TYPE c.
p_name = 'Starr'.

SELECT SINGLE *
 FROM scustom
 WHERE name = 'Starr'
 INTO @DATA(ls_kunde).





PARAMETERS: "p_id_n(8)    TYPE n,
            p_name_n(25) TYPE c LOWER CASE DEFAULT ls_kunde-name,
            p_form_n(15) TYPE c LOWER CASE DEFAULT ls_kunde-form,
            p_stre_n(30) TYPE c LOWER CASE DEFAULT ls_kunde-street,
            p_code_n(10) TYPE c DEFAULT ls_kunde-postcode,
            p_city_n(25) TYPE c LOWER CASE DEFAULT ls_kunde-city,
            p_tel_n(30)  TYPE c DEFAULT ls_kunde-telephone.


p_id_n = ls_kunde-id.


ls_kunde-id = p_id_n.
ls_kunde-name = p_name_n.
ls_kunde-form = p_form_n.
ls_kunde-street = p_stre_n.
ls_kunde-postcode = p_code_n.
ls_kunde-city = p_city_n.
ls_kunde-telephone = p_tel_n.



*Insert scustom from ls_kunde.

* cl_demo_output=>display( lt_kunde ).
