CLASS zem_cl_check_car DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  Data gs_owner type zobas_t_owner011.


  Methods reparatur.

  methods constructor importing iv_p_own_n type string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_cl_check_car IMPLEMENTATION.
  METHOD constructor.


 Select Single
 From zobas_t_owner011
 Fields *

 Where owner_name = @iv_p_own_n
 into @gs_owner.

cl_demo_output=>display( gs_owner ).


  ENDMETHOD.

  METHOD reparatur.

   Select Single
 From zobas_t_car_011
 Fields
 restkm
 Where model = @gs_owner-model
 into @Data(lv_restkm).

If lv_restkm >= gs_owner-kmlastcheck.

Write 'das Auto muss zur Inspektion'.



Endif.


  ENDMETHOD.

ENDCLASS.
