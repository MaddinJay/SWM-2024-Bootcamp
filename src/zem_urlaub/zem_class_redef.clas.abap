CLASS zem_class_redef DEFINITION
  PUBLIC
  INHERITING FROM zem_class_easycalc
  FINAL
  CREATE PUBLIC .



  PUBLIC SECTION.

  Methods add REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class_redef IMPLEMENTATION.

  METHOD add.

super->add( iv_zahl = 100  ).

mo_zahl = iv_zahl + mo_zahl.

Write: '+100', mo_zahl.

  ENDMETHOD.

ENDCLASS.
