CLASS zem_class_easycalc DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

 Methods add importing iv_zahl type p.



 Methods constructor.

 Data mv_zahl type p decimals 2.
 Data mo_zahl type p decimals 2.
Data mv_summe type p decimals 2.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.




CLASS zem_class_easycalc IMPLEMENTATION.


  METHOD add.

  mv_zAHL = iv_zahl.

  mv_summe = mv_zahl + mo_zahl.

  write mv_summe.

  ENDMETHOD.

 METHOD constructor.

if mv_zahl <> 0.

    mo_zahl = mv_zahl + 2.

    Write  / '+2 '. Exit.

    else. mo_zahl = mv_zahl + 1.

    write / '+1'.

endif.






 ENDMETHOD.



ENDCLASS.
