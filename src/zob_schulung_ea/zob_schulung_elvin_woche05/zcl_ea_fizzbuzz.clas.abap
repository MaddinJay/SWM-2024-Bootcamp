CLASS zcl_ea_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS convert_number
      IMPORTING
        iv_number        TYPE int1
      RETURNING
        value(rv_number) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ea_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.

    IF iv_number MOD 15 = 0.
     rv_number = 'FIZZBUZZ'.

        ELSEIF iv_number MOD 5 = 0.
      rv_number ='BUZZ'.

    ELSEIF iv_number MOD 3 = 0.
      rv_number = 'FIZZ'.
    ELSE.
       rv_number = |{ iv_number }|.
 ENDIF.








**  rv_number = SWITCH #( iv_number
*                        WHEN '1'  THEN '1'
*                        WHEN '2'  THEN '2'
*                        WHEN '3'  THEN 'FIZZ'
*                        WHEN '5'  THEN 'BUZZ'
*                        WHEN '6'  THEN 'FIZZ'
*                        WHEN '10' THEN 'BUZZ'
*                        WHEN '15' THEN 'FIZZBUZZ'
*                        WHEN '30' THEN 'FIZZBUZZ' ).


  ENDMETHOD.

ENDCLASS.




































