CLASS zobst_cl_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: add_car
      IMPORTING
        iv_marke TYPE zobst_t_car2-automarke
        iv_model TYPE zobst_t_car2-model
        iv_jahr  TYPE zobst_t_car2-produktionsjahr
        exporting
        ex_car type zobst_t_car2.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zobst_cl_car IMPLEMENTATION.
  METHOD add_car.
    SELECT
    FROM
    zobst_t_car2
    FIELDS
    automarke,
    model,
    produktionsjahr
    INTO @DATA(lt_car).

    ENDSELECT.

    INSERT INTO zobst_t_car2 VALUES @( VALUE
    #( automarke = iv_marke
    model = iv_model
    produktionsjahr = iv_jahr ) ).

    lt_car = ex_car.

     ENDMETHOD.


ENDCLASS.
