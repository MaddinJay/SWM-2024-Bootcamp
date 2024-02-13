CLASS zob2_cl_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  "Statische Methode, um einen neuen Tabelleneintrag mit den passenden Importparametern zu erzeugen
    CLASS-METHODS hinzfuegen IMPORTING iv_brand TYPE string
                                       iv_model TYPE string
                                       iv_year  TYPE n
                                       iv_restkm type zem_de_restkm.




     CLASS-METHODS: owner IMPORTING iv_model   TYPE string           "Importparameter aus Hauptprogramm
                                    iv_brand   TYPE string                      "Report: zem_car

                                   iv_address TYPe string
                                   iv_name    TYPE string
                                   iv_kmlast  type zem_de_lastkm
                                   iv_fahrg   type zem_de_fahrgestell.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zob2_cl_car IMPLEMENTATION.

  METHOD hinzfuegen. "Implementierung der statischen Methode,
    DATA(ls_car) = VALUE zobas_t_car_011( brand = iv_brand model = iv_model jahr = iv_year restkm = iv_restkm ).
    "lokale Struktur erzeugt und Importparameter mit Feldern der Tabelle gematcht
    INSERT zobas_t_car_011 FROM ls_car.
    "Inhalte der Tabelle hinzugefügt


     IF sy-subrc = 0.
    WRITE 'Die Inhalte wurden der Tabelle hinzugefügt!'.
  ELSE.
    WRITE 'Die Inhalte wurden nicht der Tabelle hinzugefügt!'.
  ENDIF.


  ENDMETHOD.

  METHOD owner.

      DATA ls_new2 TYPE zobas_t_owner011.                  "Definition Struktur: auf Felder der DB typisiert

    INSERT INTO zobas_t_owner011 VALUES @( VALUE #(     "Importparameter zum einfügen in die TAbelle
                        owner_name = iv_name
                        owner_address = iv_address
                        model = iv_model
                        brand = iv_brand
                        kmlastcheck = 0
                        fahrgestell = iv_fahrg
                         ) ).


    IF sy-subrc = 0.                              "Erfolgsprüfung

      WRITE: 'Eintrag in DB OWNER ist erfolgt'.   "Erfolgsmeldung

    ELSE.
      WRITE: 'Eintrag in DB OWNER war erfolglos'.  "Einfügen war nicht erfolgreich

    ENDIF.

  ENDMETHOD.

ENDCLASS.
