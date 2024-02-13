CLASS zcl_mb_fibonacci DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    DATA: mv_sum1 TYPE i VALUE 0,
          mv_sum2 TYPE i VALUE 1,
          mv_erg type i.

    METHODS fibonacci.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mb_fibonacci IMPLEMENTATION.
  METHOD fibonacci.

    DO 11 TIMES.

      WRITE mv_erg.

      mv_erg = mv_sum1 + mv_sum2.
      mv_sum1 = mv_sum2.
      mv_sum2 = mv_erg.



    ENDDO.

  ENDMETHOD.

ENDCLASS.
