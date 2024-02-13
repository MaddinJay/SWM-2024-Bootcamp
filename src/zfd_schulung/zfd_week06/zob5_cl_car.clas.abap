CLASS zob5_cl_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS neues_Auto_einfuegen IMPORTING iv_brand    TYPE char30  "Methode zum Einfügen eines neuen Autos
                                                 iv_model    TYPE char30
                                                 iv_yearprod TYPE numc4
                                                 iv_tillservice      TYPE ZOB005_T_car-km DEFAULT 1000.


    CLASS-METHODS neuen_Besitzer_einfuegen IMPORTING iv_name     TYPE char30 "Methode zum Einfügen eines neuen Besitzers
                                                     iv_adresse  TYPE char30
                                                     iv_brand    TYPE char30  "Methode zum Einfügen eines neuen Autos
                                                     iv_model    TYPE char30
                                                     iv_yearprod TYPE numc4

                                                      iv_fahrgestellnr type char30.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zob5_cl_car IMPLEMENTATION.


  METHOD neues_auto_einfuegen.
    INSERT INTO zob005_t_car VALUES @( VALUE "Es werden Werte durch das Insert sortiert in die DB eingefügt
            #(
               brand = iv_brand
               model = iv_model
               yearprod = iv_yearprod
               km = iv_tillservice
                ) ).
    IF sy-subrc = 0.                          "If-Formel für Prüfung, ob das Auto eingefügt werden konnte
      WRITE 'Auto wurde hinzugefügt'.
    ELSE.
      WRITE 'Auto ist bereits vorhanden'.
    ENDIF.

  ENDMETHOD.

  METHOD neuen_besitzer_einfuegen.
    INSERT INTO zob005_t_owner VALUES @( VALUE "Es werden Werte durch das Insert sortiert in die DB eingefügt
            #(
               owner = iv_name
               adress = iv_adresse
               brand = iv_brand
               model = iv_model
               yearprod = iv_yearprod
               km = 0
               fahrgestellnr = iv_fahrgestellnr
               ) ).

    SELECT SINGLE
    FROM zob005_t_car
    FIELDS *
    WHERE brand = @iv_brand AND model = @iv_model AND yearprod = @iv_yearprod
    INTO  @DATA(ls_struktur).

    IF sy-subrc = 0.                          "If-Formel für Prüfung, ob der Besitzer eingefügt werden konnte
      WRITE 'Besitzer wurde dem bestehenden Auto hinzugefügt'.
    ELSE.
      zob5_cl_car=>neues_auto_einfuegen(
      iv_brand = iv_brand
      iv_model = iv_model
      iv_yearprod = iv_yearprod

      ).
      WRITE 'Besitzer wurde einem neuen Auto hinzugefügt'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
