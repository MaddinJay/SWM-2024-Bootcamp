CLASS z_03_cl_kunde DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

**********************************************************************
**********************************************************************
*Kundenmethoden

    "Methode: Der Kunde gibt seine Daten - unter Anderem seinen Zählerstand - ein
    METHODS: setZaehlerstand IMPORTING iv_kdnr         TYPE zob_tab_costumer-cust_number
                                       iv_zaehlerstand TYPE zob_tab_costumer-meter_value
                                       iv_vdate        TYPE zob_tab_costumer-date_of_entry
                                       iv_device       TYPE zob_tab_costumer-device_number
                                       iv_tphone       TYPE zob_tab_costumer-tel_number
                                       iv_auftrnr      TYPE zob_tab_costumer-order_number
                                       iv_prevalue     TYPE zob_tab_costumer-pre_value.

    "Methode: Der Gesamtverbrauch wird berechnet (Zählerstand-Vorwert=Gesamtverbrauch)
    METHODS: berechnungVerbrauch IMPORTING iv_kdnr3            TYPE zob_tab_costumer-cust_number
                                           iv_auftrnr3         TYPE zob_tab_costumer-order_number
                                           iv_vorwert          TYPE zob_tab_costumer-pre_value
                                           iv_zstand           TYPE zob_tab_costumer-meter_value
                                 RETURNING VALUE(rv_verbrauch) TYPE zob_tab_costumer-consum.

    "Methode: Die monatlichen Kosten werden berechnet (Gesamtverbrauch*kwhPreis=Gesamtkosten/Monatskosten)
    METHODS: berechnungPreis IMPORTING iv_kdnr3         TYPE zob_tab_costumer-cust_number
                                       iv_auftrnr3      TYPE zob_tab_costumer-order_number
                             RETURNING VALUE(rv_kosten) TYPE zob_tab_costumer-cost.

**********************************************************************
**********************************************************************
*Mitarbeitermethoden
    METHODS: getZaehlerstand IMPORTING iv_kdnr          TYPE zob_tab_costumer-cust_number
                                       iv_auftrnr       TYPE zob_tab_costumer-order_number
                             RETURNING VALUE(rt_result) TYPE string.



    METHODS getDatenbank RETURNING VALUE(rt_db) TYPE string.

    METHODS: statusBestaetigen IMPORTING iv_kdnr2    TYPE zob_tab_costumer-cust_number
                                         iv_auftrnr2 TYPE zob_tab_costumer-order_number
                                         iv_status   TYPE zob_tab_costumer-status.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS z_03_cl_kunde IMPLEMENTATION.
  METHOD setzaehlerstand.
    SELECT *
    FROM zob_tab_costumer
    WHERE cust_number = @iv_kdnr AND device_number = @iv_device
    INTO TABLE @DATA(lt_zstand).
    SORT lt_zstand BY date_of_entry DESCENDING.

    DATA(ls_zstand) = lt_zstand[ 1 ].

    DATA(gs_kunde) = VALUE zob_tab_costumer( cust_number = iv_kdnr meter_value = iv_zaehlerstand date_of_entry = iv_vdate device_number = iv_device tel_number = iv_tphone order_number = iv_auftrnr pre_value = ls_zstand-meter_value price = '0.29' ).
    MODIFY zob_tab_costumer FROM gs_kunde.

    IF sy-subrc = 0.
      WRITE 'Die Verbrauchsinformationen des Kunden wurden erfolgreich gespeichert'.
    ELSE.
      WRITE 'Die Verbrauchsinformationen des Kunden wurden nicht(!) gespeichert'.
    ENDIF.
  ENDMETHOD.

  METHOD getzaehlerstand.
    SELECT
    FROM zob_tab_costumer
    FIELDS *
    WHERE cust_number = @iv_kdnr AND order_number = @iv_auftrnr
    INTO TABLE @DATA(lt_kunde).

    DATA: o_salv TYPE REF TO cl_salv_table.
    cl_salv_table=>factory( IMPORTING
                              r_salv_table = o_salv
                            CHANGING
                              t_table      = lt_kunde ).
    DATA functions TYPE REF TO cl_salv_functions_list.
    functions = o_salv->get_functions( ).
    functions->set_all( ).
    o_salv->display( ).
  ENDMETHOD.



  METHOD getdatenbank.
    SELECT
    FROM zob_tab_costumer
    FIELDS *
    INTO TABLE @DATA(lt_datenbank).
    DATA: o_salv TYPE REF TO cl_salv_table.
    cl_salv_table=>factory( IMPORTING
                              r_salv_table = o_salv
                            CHANGING
                              t_table      = lt_datenbank ).
    DATA functions TYPE REF TO cl_salv_functions_list.
    functions = o_salv->get_functions( ).
    functions->set_all( ).
    o_salv->display( ).
  ENDMETHOD.

  METHOD statusbestaetigen.
    UPDATE zob_tab_costumer SET status = iv_status WHERE cust_number = iv_kdnr2 AND order_number = iv_auftrnr2.
    IF sy-subrc = 0.
      WRITE 'Status erfolgreich'.
    ELSE.
      WRITE 'Status nicht erfolgreich'.
    ENDIF.
  ENDMETHOD.

  METHOD berechnungVerbrauch.
    "Zählerstand-Vorwert=Gesamtverbrauch --> METER_VALUE - PRE_VALUE = CONSUM
    SELECT SINGLE
        FROM zob_tab_costumer
        FIELDS *
        WHERE cust_number = @iv_kdnr3 AND order_number = @iv_auftrnr3
        INTO  @DATA(ls_datenbank).

    ls_datenbank-consum = ls_datenbank-meter_value - ls_datenbank-pre_value.

    UPDATE zob_tab_costumer SET consum = ls_datenbank-consum WHERE cust_number = iv_kdnr3 AND order_number = iv_auftrnr3.
    IF sy-subrc = 0.
      WRITE 'Der Gesamtverbrauch des Kunden wurde berechnet und erfolgreich gespeichert'.
    ELSE.
      WRITE 'Der Gesamtverbrauch des Kunden wurde nicht(!) gespeichert'.
    ENDIF.

  ENDMETHOD.

  METHOD berechnungpreis.
    "Gesamtverbrauch*kwhPreis=Gesamtkosten/Monatskosten --> CONSUM * PRICE = COST
    SELECT SINGLE
            FROM zob_tab_costumer
            FIELDS *
            WHERE cust_number = @iv_kdnr3 AND order_number = @iv_auftrnr3
            INTO  @DATA(ls_preis).


    ls_preis-cost = ls_preis-consum * ls_preis-price.

    UPDATE zob_tab_costumer SET cost = ls_preis-cost WHERE cust_number = iv_kdnr3 AND order_number = iv_auftrnr3.
      IF sy-subrc = 0.
      WRITE 'Die Kosten des Kunden wurden berechnet und erfolgreich gespeichert'.
    ELSE.
      WRITE 'Die Kosten des Kunden wurden nicht(!) gespeichert'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
