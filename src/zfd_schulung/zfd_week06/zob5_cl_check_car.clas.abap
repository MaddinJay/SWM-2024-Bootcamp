CLASS zob5_cl_check_car DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name TYPE zobtl_t_owner_tl-owner_name.
    METHODS car_check.
    METHODS car_reparieren.


  PROTECTED SECTION.
    DATA gs_owner TYPE zobtl_t_owner_tl.
  PRIVATE SECTION.



ENDCLASS.



CLASS zob5_cl_check_car IMPLEMENTATION.
  METHOD constructor.
    SELECT SINGLE
    FROM zobtl_t_owner_tl
    FIELDS
      *
    WHERE owner_name = @iv_name
    INTO @gs_owner.

  ENDMETHOD.

  METHOD car_check.

    SELECT SINGLE
    FROM zobtl_t_car_tl
    FIELDS
      service
      WHERE model = @gs_owner-model AND brand = @gs_owner-brand
      INTO @DATA(lv_till_service).

    IF gs_owner-leservice >= lv_till_service.
      car_reparieren( ).
    ENDIF.

  ENDMETHOD.

  METHOD car_reparieren.
    update zobtl_t_owner_tl
      set leservice = 0
      where owner_name = @gs_owner-owner_name.
  ENDMETHOD.

ENDCLASS.
