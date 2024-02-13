CLASS zod_lcl_rus_multiplikation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS: rus_multi IMPORTING
                    iv_operand1 type i
                    iv_operand2 type i

                    EXPORTING
                    rv_result type i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zod_lcl_rus_multiplikation IMPLEMENTATION.
  METHOD rus_multi.
  DATA: lv_operand1 type i,
        lv_operand2 type i.
    lv_operand1 = iv_operand1.
    lv_operand2 = iv_operand2.

WHILE lv_operand1 > 0.
  IF lv_operand1 MOD 2 = 1. " Addiere zahl_rechts zum Ergebnis, wenn zahl_links ungerade ist
    rv_result = rv_result + lv_operand2.
    WRITE: / lv_operand1, lv_operand2.
  ENDIF.


  lv_operand1 = lv_operand1 DIV 2. " Teile zahl_links durch 2
  lv_operand2 = lv_operand2 * 2. " Verdopple zahl_rechts
ENDWHILE.
WRITE: / 'Das Produkt von 47 * 42 ist:', rv_result.

  ENDMETHOD.

ENDCLASS.
