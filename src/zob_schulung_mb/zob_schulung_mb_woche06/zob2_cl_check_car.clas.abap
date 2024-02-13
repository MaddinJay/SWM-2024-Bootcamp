CLASS zob2_cl_check_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA gs_owner TYPE zobmb_t_owner003.

    METHODS constructor IMPORTING iv_name TYPE string.
    METHODS autoPruefen IMPORTING iv_name          TYPE string
                                  "iv_kms           TYPE n
                                  "iv_kmseitservice TYPE n.
.
    METHODS reparieren "IMPORTING iv_name  TYPE string
      "         iv_model TYPE string
      "        iv_km    TYPE n.
      .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zob2_cl_check_car IMPLEMENTATION.
  METHOD constructor.
    SELECT SINGLE
    FROM zobmb_t_owner003
    FIELDS *
    WHERE owner_name = @iv_name
    INTO @DATA(gs_owner).
    cl_demo_output=>display( gs_owner ).

  ENDMETHOD.

  METHOD autopruefen.

    SELECT SINGLE
    FROM zobmb_t_car_003
    FIELDS kmbisservice
   WHERE model = @gs_owner-model "AND brand = @gs_owner-brand
      INTO @DATA(lv_till_service).
*    cl_demo_output=>display( gs_owner ).

    IF gs_owner-kmseitservice >= lv_till_service.
      reparieren( ).
    ENDIF.

  ENDMETHOD.

  METHOD reparieren.
    UPDATE zobmb_t_owner003
      SET kmseitservice = 0
      WHERE owner_name = @gs_owner-owner_name.


  ENDMETHOD.

ENDCLASS.
