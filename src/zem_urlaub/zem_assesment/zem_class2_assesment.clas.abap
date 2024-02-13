CLASS zem_class2_assesment DEFINITION
  PUBLIC
  INHERITING FROM zem_class1_assesment
FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  Methods twoimport REDEFINITION.

  methods twoexport REDEFINITION.

  methods constructor.


  PROTECTED SECTION.



  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class2_assesment IMPLEMENTATION.


  METHOD twoimport.

*super->twoimport( iv_import1 ).


mv_import1 = iv_import1 + 1000.



  ENDMETHOD.

  METHOD twoexport.

  ev_export1 = mv_import + mv_import1 + 100.

  ENDMETHOD.

  METHOD constructor.

    super->constructor( ).

    mv_import = mv_import + 10000.

  ENDMETHOD.

ENDCLASS.
