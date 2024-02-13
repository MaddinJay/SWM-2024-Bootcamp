CLASS zobas_t_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS carhinzufuegen IMPORTING iv_brand TYPE zobas_t_car_011-brand
                                           iv_model TYPE zobas_t_car_011-model
                                           iv_jahr  TYPE zobas_t_car_011-jahr.

    CLASS-METHODS ownerhinzufuegen IMPORTING iv_owner_name    TYPE zobas_t_owner011-owner_name
                                             iv_owner_address TYPE zobas_t_owner011-owner_address
                                             iv_brand         TYPE zobas_t_owner011-brand
                                             iv_model         TYPE zobas_t_owner011-model.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zobas_t_car IMPLEMENTATION.
  METHOD carhinzufuegen.
    SELECT SINGLE
    FROM zobas_t_car_011
    FIELDS *
    INTO  @DATA(ls_zobas_t_car_011).
*      cl_demo_output=>display( lt_zobas_t_car_011 ).

    IF ls_zobas_t_car_011-brand <> iv_brand AND ls_zobas_t_car_011-model <> iv_model.
      ls_zobas_t_car_011 = VALUE zobas_t_car_011( brand = iv_brand model = iv_model jahr = iv_jahr ).
      INSERT zobas_t_car_011 FROM ls_zobas_t_car_011.
      IF sy-subrc = 0.
        WRITE 'Die Daten wurden erfolgreich hinzugefügt.'.
      ENDIF.
    ELSE.
      WRITE 'Die Daten existieren bereits und wurden deshalb nicht hinzugefügt.'.
    ENDIF.


  ENDMETHOD.

  METHOD ownerhinzufuegen.
    SELECT SINGLE
       FROM zobas_t_owner011
       FIELDS *
       INTO  @DATA(ls_zobas_t_owner_011).
    ls_zobas_t_owner_011 = VALUE zobas_t_owner011( owner_name = iv_owner_name owner_address = iv_owner_address brand = iv_brand model = iv_model ).
    INSERT zobas_t_owner011 FROM ls_zobas_t_owner_011.

    IF ls_zobas_t_owner_011-model <> iv_model AND ls_zobas_t_owner_011-brand <> iv_brand.
      ls_zobas_t_owner_011 = VALUE zobas_t_owner011( owner_name = iv_owner_name owner_address = iv_owner_address brand = iv_brand model = iv_model ).
      INSERT zobas_t_owner011 FROM ls_zobas_t_owner_011.
      IF sy-subrc = 0.
        WRITE: |Die Daten wurden erfolgreich der Tabelle hinzugefügt.|.
      ENDIF.
    ELSE.
      WRITE: |Die Daten existieren bereits und wurden deshalb nicht hinzugefügt.|.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
