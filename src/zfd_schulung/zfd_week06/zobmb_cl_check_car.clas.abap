CLASS zobmb_cl_check_car DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA gs_owner type ZOB005_T_owner.

  Methods constructor importing iv_owner type ZOB005_T_owner-owner.
  methods autopruefen IMPORTING iv_owner type ZOB005_T_owner-owner.

  methods reparieren.





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zobmb_cl_check_car IMPLEMENTATION.
  METHOD constructor.

  select single
  from ZOB005_T_owner
  fields
  *
  where owner = @iv_owner
  into @data(gs_owner).
 cl_demo_output=>display( gs_owner ).



  ENDMETHOD.

  METHOD autopruefen.

   SELECT SINGLE
    FROM zob005_t_car
    FIELDS km
   WHERE model = @gs_owner-model AND brand = @gs_owner-brand
      INTO @DATA(lv_till_service).
*    cl_demo_output=>display( gs_owner ).

    IF gs_owner-km >= lv_till_service.
      reparieren( ).
    ENDIF.


  ENDMETHOD.

  METHOD reparieren.

  update ZOB005_T_owner
  set km = 0
  where owner = @gs_owner-owner.

  ENDMETHOD.

ENDCLASS.
