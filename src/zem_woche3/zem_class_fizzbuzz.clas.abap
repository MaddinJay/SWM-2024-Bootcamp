CLASS zem_class_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS fizzbuzz IMPORTING iv_zahl          TYPE int1
                     RETURNING VALUE(rv_nummer) TYPE string.

**********************************************************************

    TYPES: BEGIN OF ts_list,

             number           TYPE int1,
             convertet_number TYPE string,

           END OF ts_list.

    DATA tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY.


    METHODS convert_number  IMPORTING iv_number        TYPE int1
                            RETURNING VALUE(rv_number) TYPE string.


    METHODS convert         IMPORTING iv_number        TYPE int1
                            RETURNING VALUE(rt_result) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zem_class_fizzbuzz IMPLEMENTATION.



  METHOD fizzbuzz.

    DATA(mo_zahl) = iv_Zahl.

*     If mo_zahl mod 15 eq 0.
*     rv_nummer = 'FIZZBUZZ'.
*     Elseif mo_zahl mod 5 eq 0.
*     rv_nummer = 'BUZZ'.
*     Elseif mo_zahl mod 3 eq 0.
*     rv_nummer = 'FIZZ'.
*     Else. rv_nummer = |{ mo_zahl }|.
*
*    Endif.


    rv_nummer = COND #( WHEN mo_zahl MOD 15 EQ 0
                        THEN 'FIZZBUZZ'
                        WHEN mo_zahl MOD 5 EQ 0
                        THEN 'BUZZ'
                        WHEN mo_zahl MOD 3 EQ 0
                        THEN 'FIZZ'
                        ELSE |{ mo_zahl }| ).


  ENDMETHOD.

  METHOD convert.

  ENDMETHOD.

  METHOD convert_number.

  ENDMETHOD.

ENDCLASS.





