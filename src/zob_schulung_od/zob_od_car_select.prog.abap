*&---------------------------------------------------------------------*
*& Report zob_od_car_select
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_car_select.

SELECT db_car~abrandt as Automarke,
       db_car~amodel as Automodel,
       db_car~prodyear as Produktionsjahr,
       db_aowner~autobesitzer as Autobesitzer,
       db_aowner~besitzeradresse as Adresse
     FROM zob_od_dtb_car AS db_car
     LEFT JOIN zob_od_dtb_owner AS db_aowner
     ON db_car~abrandt = db_aowner~abrandt
     and db_car~amodel = db_aowner~amodel

WHERE db_aowner~autobesitzer IS NOT NULL
GROUP BY db_car~abrandt, db_car~amodel, db_car~prodyear, db_aowner~autobesitzer, db_aowner~besitzeradresse
INTO TABLE @DATA(lt_auto).


*cl_demo_output=>display( lt_auto ).

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
  TABLES
    t_outtab           = lt_auto
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.

IF sy-subrc <> 0.
  write 'well done'." Handle the error accordingly
ENDIF.
