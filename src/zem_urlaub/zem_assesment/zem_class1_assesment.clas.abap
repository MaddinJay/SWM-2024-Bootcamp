CLASS zem_class1_assesment DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  Methods twoimport importing iv_import1 type i.


  Methods twoexport exporting ev_export1 type i.                            .


  methods constructor.


  PROTECTED SECTION.

 Data: mv_import1 type i,
       mv_import type i.


  PRIVATE SECTION.

ENDCLASS.



CLASS zem_class1_assesment IMPLEMENTATION.

  METHOD constructor.


 mv_import = 2.

  ENDMETHOD.

 METHOD twoimport.

mv_import1 = mv_import + iv_import1.

  ENDMETHOD.

  METHOD twoexport.

   ev_export1 = mv_import1.

  ENDMETHOD.



ENDCLASS.
