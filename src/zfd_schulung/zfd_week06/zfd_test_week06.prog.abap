*&---------------------------------------------------------------------*
*& Report zfd_test_week06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_test_week06.

TABLES zfd_t_car.
TABLES zfd_t_owner.

*data ls_auto type zfd_t_car.
*ls_auto = Value #( mandt = 100 brand = 'VW' model = 'GOLF' yearprod = 1998 ).
*insert zfd_t_car from ls_auto.
*
*WRITE: / 'Anlegen Datensatz'.
*IF Sy-subrc = 0.
*  WRITE 'Hat geklappt SUPER Basst scho'.
*ELSE.
*  WRITE 'Nicht geklappt'.
*ENDIF.

************

*data ls_owner type zfd_t_owner.
*ls_owner = Value #( mandt = 100 brand = 'Ford' model = 'Taunus' yearprod = 1975 owner_name = 'Meier' owner_adress = 'Germering' ).
*insert zfd_t_owner from ls_owner.
*
*WRITE: / 'Anlegen Datensatz'.
*IF Sy-subrc = 0.
*  WRITE 'Hat geklappt SUPER Basst scho'.
*ELSE.
*  WRITE 'Nicht geklappt'.
*ENDIF.

************

SELECT
  FROM zfd_t_car AS a
  LEFT OUTER JOIN zfd_t_owner AS b
  ON a~model = b~model and a~brand = b~brand
  FIELDS
  b~owner_name,
* b~owner_adress,
  a~brand,
  a~model,
  a~yearprod
  WHERE owner_name IS NOT INITIAL
  INTO TABLE @DATA(lt_tab).

cl_demo_output=>display( lt_tab ).
