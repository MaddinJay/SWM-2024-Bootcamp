CLASS zfb_cl_car DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: abruf IMPORTING iv_model TYPE zem_de_car_model           "Importparameter aus Hauptprogramm
                                   iv_brand TYPE brand                      "Report: zem_car
                                   iv_jahr  TYPE jahr.

    CLASS-METHODS: owner IMPORTING iv_model   TYPE zem_de_car_model           "Importparameter aus Hauptprogramm
                                   iv_brand   TYPE brand                      "Report: zem_car

                                   iv_address TYPE zem_de_address
                                   iv_name    TYPE zem_de_name.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfb_cl_car IMPLEMENTATION.


  METHOD abruf.

    DATA ls_new TYPE zem_db_car.                  "Definition Struktur: auf Felder der DB typisiert

    INSERT INTO zem_db_car VALUES @( VALUE #(     "Importparameter zum einfügen in die TAbelle

                        model = iv_model
                        brand = iv_brand
                        jahr = iv_jahr ) ).


    IF sy-subrc = 0.                              "Erfolgsprüfung

      WRITE: 'Eintrag in DB CAR ist erfolgt'.     "Erfolgsmeldung

    ELSE.
      WRITE: 'Eintrag in DB CAR war erfolglos'.   "Einfügen war nicht erfolgreich

    ENDIF.


  ENDMETHOD.


  METHOD owner.

    DATA ls_new2 TYPE zem_db_owner.                  "Definition Struktur: auf Felder der DB typisiert

    INSERT INTO zem_db_owner VALUES @( VALUE #(     "Importparameter zum einfügen in die TAbelle
                        owner_name = iv_name
                        owner_address = iv_address
                        model = iv_model
                        brand = iv_brand
                         ) ).


    IF sy-subrc = 0.                              "Erfolgsprüfung

      WRITE: 'Eintrag in DB OWNER ist erfolgt'.   "Erfolgsmeldung

    ELSE.
      WRITE: 'Eintrag in DB OWNER war erfolglos'.  "Einfügen war nicht erfolgreich

    ENDIF.

  ENDMETHOD.


ENDCLASS.
