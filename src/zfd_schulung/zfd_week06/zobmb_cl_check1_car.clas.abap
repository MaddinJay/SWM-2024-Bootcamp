CLASS zobmb_cl_check1_car DEFINITION INHERITING FROM zobmb_cl_check_car
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS reparieren REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zobmb_cl_check1_car IMPLEMENTATION.
  METHOD reparieren.

"Option erweitern
    UPDATE ZOB005_T_owner
    SET fahrgestellnr = '1287236'
    WHERE owner = @gs_owner-owner.

    super->reparieren( ).

    "Option überschreiben
*    UPDATE ZOB005_T_owner
*    SET km = 0, fahrgestellnr = '1287236'
*    WHERE owner = @gs_owner-owner.

  ENDMETHOD.

ENDCLASS.
