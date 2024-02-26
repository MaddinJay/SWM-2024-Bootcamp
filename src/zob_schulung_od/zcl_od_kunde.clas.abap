CLASS zcl_od_kunde DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lt_datenbank TYPE TABLE OF zob_tab_costumer.
    	METHODS: setZaehlerstand IMPORTING iv_kdnr         TYPE zob_tab_customer-cust_number
                                       iv_zaehlerstand TYPE zob_tab_customer-meter_value
                                       iv_vdate        TYPE zob_tab_customer-date_of_entry
                                       iv_device       TYPE zob_tab_customer-device_number
                                       iv_tphone       TYPE zob_tab_customer-tel_number
                                       iv_auftrnr      TYPE zob_tab_customer-order_number
                                       iv_prevalue     TYPE zob_tab_customer-pre_value,
      berechnungVerbrauch IMPORTING iv_kdnr3            TYPE zob_tab_customer-cust_number
                                    iv_auftrnr3         TYPE zob_tab_customer-order_number
                                    iv_vorwert          TYPE zob_tab_customer-pre_value
                                    iv_zstand           TYPE zob_tab_customer-meter_value
                          RETURNING VALUE(rv_verbrauch) TYPE zob_tab_customer-consum,
      berechnungPreis IMPORTING iv_kdnr3         TYPE zob_tab_customer-cust_number
                                iv_auftrnr3      TYPE zob_tab_customer-order_number
                      RETURNING VALUE(rv_kosten) TYPE zob_tab_customer-cost,
      getZaehlerstand IMPORTING iv_kdnr          TYPE zob_tab_customer-cust_number
                                iv_auftrnr       TYPE zob_tab_customer-order_number
                      RETURNING VALUE(rt_result) TYPE string,
      getDatenbank RETURNING VALUE(rt_db) TYPE string,
      handle_save FOR EVENT added_function OF cl_salv_events_table
                            IMPORTING e_salv_function,

      statusBestaetigen IMPORTING iv_kdnr2    TYPE zob_tab_customer-cust_number
                                  iv_auftrnr2 TYPE zob_tab_customer-order_number
                                  iv_status   TYPE zob_tab_customer-status.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_od_kunde IMPLEMENTATION.

  METHOD setzaehlerstand.
    SELECT *
    FROM zob_tab_customer
    WHERE cust_number = @iv_kdnr AND device_number = @iv_device
    INTO TABLE @DATA(lt_zstand).
    SORT lt_zstand BY date_of_entry DESCENDING.

    DATA(ls_zstand) = lt_zstand[ 1 ].

    DATA(gs_kunde) = VALUE zob_tab_customer( cust_number = iv_kdnr meter_value = iv_zaehlerstand date_of_entry = iv_vdate device_number = iv_device tel_number = iv_tphone order_number = iv_auftrnr pre_value = ls_zstand-meter_value price = '0.29' ).
    MODIFY zob_tab_customer FROM gs_kunde.

    IF sy-subrc = 0.
      WRITE 'Die Verbrauchsinformationen des Kunden wurden erfolgreich gespeichert'.
    ELSE.
      WRITE 'Die Verbrauchsinformationen des Kunden wurden nicht(!) gespeichert'.
    ENDIF.
  ENDMETHOD.

  METHOD getzaehlerstand.
    SELECT
    FROM zob_tab_customer
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
    DATA: o_salv       TYPE REF TO cl_salv_table,
          lo_functions TYPE REF TO cl_salv_functions_list,
          lo_columns   TYPE REF TO cl_salv_columns_table,
          lo_column    TYPE REF TO cl_salv_column_list.

    SELECT *
      FROM zob_tab_costumer
      INTO TABLE @lt_datenbank.

    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = o_salv
      CHANGING
        t_table      = lt_datenbank
    ).

    lo_columns = o_salv->get_columns( ).




    lo_functions = o_salv->get_functions( ).
    lo_functions->set_default( abap_false ).
    lo_functions->add_function(
      name          = 'SAVE'
      text          = 'Speichern'
      icon          = 'icon_save'
      position      = if_salv_c_function_position=>right_of_salv_functions
      tooltip       = 'Änderungen speichern'
    ).


    o_salv->display( ).

*    SET HANDLER o_salv.AT USER-COMMANDhandle_save FOR lo_functions.

  ENDMETHOD.

  METHOD handle_save.
    TRY.
        LOOP AT lt_datenbank INTO DATA(ls_datenbank).

          UPDATE zob_tab_costumer FROM ls_datenbank.
        ENDLOOP.
        COMMIT WORK.
        MESSAGE 'Daten erfolgreich gespeichert.' TYPE 'S'.

      CATCH cx_root INTO DATA(lx_exception).
        MESSAGE 'Fehler beim Speichern der Daten.' TYPE 'E'.
    ENDTRY.
  ENDMETHOD.

  METHOD statusbestaetigen.
    UPDATE zob_tab_customer SET status = iv_status WHERE cust_number = iv_kdnr2 AND order_number = iv_auftrnr2.
    IF sy-subrc = 0.
      WRITE 'Status erfolgreich'.
    ELSE.
      WRITE 'Status nicht erfolgreich'.
    ENDIF.
  ENDMETHOD.

  METHOD berechnungVerbrauch.

    SELECT SINGLE
        FROM zob_tab_customer
        FIELDS *
        WHERE cust_number = @iv_kdnr3 AND order_number = @iv_auftrnr3
        INTO  @DATA(ls_datenbank).

    ls_datenbank-consum = ls_datenbank-meter_value - ls_datenbank-pre_value.

    UPDATE zob_tab_customer SET consum = ls_datenbank-consum WHERE cust_number = iv_kdnr3 AND order_number = iv_auftrnr3.
    IF sy-subrc = 0.
      WRITE 'Der Gesamtverbrauch des Kunden wurde berechnet und erfolgreich gespeichert'.
    ELSE.
      WRITE 'Der Gesamtverbrauch des Kunden wurde nicht(!) gespeichert'.
    ENDIF.

  ENDMETHOD.

  METHOD berechnungpreis.

    SELECT SINGLE
            FROM zob_tab_customer
            FIELDS *
            WHERE cust_number = @iv_kdnr3 AND order_number = @iv_auftrnr3
            INTO  @DATA(ls_preis).

    ls_preis-cost = ls_preis-consum * ls_preis-price.

    UPDATE zob_tab_customer SET cost = ls_preis-cost WHERE cust_number = iv_kdnr3 AND order_number = iv_auftrnr3.
    IF sy-subrc = 0.
      WRITE 'Die Kosten des Kunden wurden berechnet und erfolgreich gespeichert'.
    ELSE.
      WRITE 'Die Kosten des Kunden wurden nicht(!) gespeichert'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
