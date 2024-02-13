*&---------------------------------------------------------------------*
*& Report zoblv_addcar
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoblv_addcar.


PARAMETERS: p_marke  TYPE ZOBLV_T_Car-brand,
            p_modell TYPE ZOBLV_T_Car-model,
            p_jahr   TYPE ZOBLV_T_Car-caryear.

INSERT INTO  ZOBLV_T_Car VALUES @( VALUE
                                 #( brand = p_marke
                                   model = p_modell
                                   caryear = p_jahr ) ).
SELECT
FROM
ZOBLV_T_Car
FIELDS
brand,
model,
caryear

INTO TABLE @DATA(lt_car).


 cl_demo_output=>display( lt_car ).
