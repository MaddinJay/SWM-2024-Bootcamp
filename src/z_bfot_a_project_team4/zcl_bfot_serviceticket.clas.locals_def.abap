*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
CLASS lcl_events DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF t_tickets,
             auswahl            TYPE checkbut,
             ticketnummer       TYPE zbfot_tickets-ticketnummer,
             vknr               TYPE zbfot_tickets-vknr,
             tickettitel        TYPE zbfot_tickets-tickettitel,
             ticketbeschreibung TYPE zbfot_tickets-ticketbeschreibung,
             ticketstatus       TYPE zbfot_tickets-ticketstatus,
             sparte             TYPE zbfot_tickets-sparte,
             tech_id            TYPE zbfot_tickets-bearbeiterid,
             datum              TYPE zbfot_tickets-datum,
           END OF t_tickets.
* Bezeichner der Buttons
    CONSTANTS: co_btn_xl_export TYPE string VALUE 'BTN_XL_EXPORT'.
    CONSTANTS: lv_action TYPE sy-ucomm VALUE 'back'.

    CLASS-DATA: lt_tickets  TYPE TABLE OF t_tickets,
                ls_tickets  TYPE t_tickets,
                rs_selfield TYPE slis_selfield.

    CLASS-METHODS:
      on_toolbar_click FOR EVENT added_function OF cl_salv_events_table
        IMPORTING
          e_salv_function
          sender,

      handle_user_command FOR EVENT added_function OF cl_salv_events_table
        IMPORTING
          e_salv_function
          sender



        .



ENDCLASS.
