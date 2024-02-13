CLASS zob_sb2_cl_db_bearbeitung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS einfuegen IMPORTING iv_kdnr   TYPE zob_sb2_kunden-kundennummer
                                iv_tnr    TYPE zob_sb2_tickets-ticketnummer
                                iv_kname  TYPE zob_sb2_kunden-kundenname
                                iv_anlieg TYPE zob_sb2_tickets-anliegen.

    METHODS alv_aufruf.

protected section.
private section.
ENDCLASS.



CLASS ZOB_SB2_CL_DB_BEARBEITUNG IMPLEMENTATION.


  METHOD einfuegen.
    INSERT INTO zob_sb2_tickets VALUES @(  VALUE
              #( kundennummer = iv_kdnr
                 ticketnummer = iv_tnr
                 kundenname = iv_kname
                 anliegen = iv_anlieg
                 status = 'In Bearbeitung'
                                    ) ).

    IF sy-subrc = 0.
      DATA(lv_message) = |Das Ticket wurde eingereicht!|.
      MESSAGE lv_message TYPE 'I'.
    ELSE.
      DATA(lv_message2) = |Das Ticket ist bereits vorhanden!|.
      MESSAGE lv_message2 TYPE 'I'.
    ENDIF.
  ENDMETHOD.


  METHOD alv_aufruf.
    DATA: go_alv       TYPE REF TO cl_salv_table,
          go_functions TYPE REF TO cl_salv_functions_list.

    SELECT
    FROM zob_sb2_tickets
    FIELDS *
    INTO TABLE @DATA(lt_tickets).

    cl_salv_table=>factory( IMPORTING r_salv_table = go_alv
                            CHANGING t_table = lt_tickets ).

    go_functions = go_alv->get_functions( ).
    go_functions->set_all( ).
    go_alv->display( ).
  ENDMETHOD.
ENDCLASS.
