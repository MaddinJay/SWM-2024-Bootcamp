CLASS zas_owner_klasse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Statische Methode, um einen neuen Tabelleneintrag mit den passenden Importparametern zu erzeugen
    CLASS-METHODS hinzfuegen IMPORTING iv_owner_name    TYPE string
                                       iv_owner_address TYPE string
                                       iv_brand         TYPE string
                                       iv_model         TYPE string.

    CLASS-METHODS carHinzfuegen IMPORTING iv_brand TYPE string
                                          iv_model TYPE string
                                          iv_year  TYPE n.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zas_owner_klasse IMPLEMENTATION.


  METHOD hinzfuegen. "Implementierung der statischen Methode,
    DATA(ls_owner) = VALUE zobas_t_owner011( owner_name = iv_owner_name owner_address = iv_owner_address brand = iv_brand model = iv_model ).
    "lokale Struktur erzeugt und Importparameter mit Feldern der Tabelle gematcht
    INSERT zobas_t_owner011 FROM ls_owner.
    "Inhalte der Tabelle hinzugefügt

    "Überprüfen, ob das Hinzufügen der Inhalte erfolgreich war oder nicht
    IF sy-subrc = 0.
      WRITE: 'Die Inhalte wurden der Tabelle hinzugefügt!', /.
    ELSE.
      WRITE: 'Die Inhalte wurden nicht der Tabelle hinzugefügt!', /.
    ENDIF.
  ENDMETHOD.

  METHOD carhinzfuegen.
    DATA lt_car TYPE TABLE OF zobas_t_car_011.
    DATA ls_car TYPE zobas_st_car_011.
    DATA(ls_owner2) = VALUE zobas_t_car_011( brand = iv_brand model = iv_model jahr = iv_year ).

    IF iv_brand <> ls_car-brand OR iv_model <> ls_car-model.
      "lokale Struktur erzeugt und Importparameter mit Feldern der Tabelle gematcht
      INSERT zobas_t_car_011 FROM ls_owner2.
    ENDIF.

    "Überprüfen, ob das Hinzufügen der Inhalte erfolgreich war oder nicht
    IF sy-subrc = 0.
      WRITE 'Die Inhalte wurden der Tabelle hinzugefügt!'.
    ELSE.
      WRITE 'Die Inhalte wurden nicht der Tabelle hinzugefügt!'.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
