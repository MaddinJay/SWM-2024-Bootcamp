CLASS zcl_z02_energiedaten DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor.

    METHODS insert IMPORTING iv_knr      TYPE z02_t_edm-kundennummer
                             iv_auftr    TYPE z02_t_edm-auftragsnummer
                             iv_vorname  TYPE z02_t_edm-vorname
                             iv_nachname TYPE z02_t_edm-nachname
                             iv_tel      TYPE z02_t_edm-telefonnummer
                             iv_email    TYPE z02_t_edm-email
                             iv_datum    TYPE z02_t_edm-datum
                             iv_zst      TYPE z02_t_edm-zst
                             iv_komm     TYPE z02_t_edm-kommentar
                             iv_aprs     TYPE z02_t_edm-arbeitspreis.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_z02_energiedaten IMPLEMENTATION.

  METHOD constructor.


  ENDMETHOD.

  METHOD insert.
    INSERT INTO z02_t_edm VALUES @(  VALUE
             #( kundennummer = iv_knr
                auftragsnummer = iv_auftr
                vorname = iv_vorname
                nachname = iv_nachname
                telefonnummer = iv_tel
                email = iv_email
                datum = iv_datum
                zst = iv_zst
                kommentar = iv_komm
                arbeitspreis = iv_aprs ) ).

    IF sy-subrc = 0.
      DATA(lv_message) = |Der Zählerstand { iv_zst } kWh wurde erfolgreich übermittelt!|.
      MESSAGE lv_message TYPE 'I'.
    ELSE.
      DATA(lv_message2) = |Der Zählerstand { iv_zst } kWh ist bereits vorhanden!|.
      MESSAGE lv_message2 TYPE 'I'.
    ENDIF.
  ENDMETHOD.


ENDCLASS.
