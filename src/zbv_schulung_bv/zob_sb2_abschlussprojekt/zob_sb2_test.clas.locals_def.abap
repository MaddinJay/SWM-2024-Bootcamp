*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
CLASS lcl_events DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF t_tickets,
             auswahl         TYPE checkbut,
             kundennummer    TYPE zob_sb2_tickets-kundennummer,
             ticketnummer    TYPE zob_sb2_tickets-ticketnummer,
             stoerung        TYPE zob_sb2_tickets-stoerung,
             kundenname      TYPE zob_sb2_tickets-kundenname,
             anmerkung       TYPE zob_sb2_tickets-anmerkung,
             technikernummer TYPE zob_sb2_tickets-technikernummer,
             techniker       TYPE zob_sb2_tickets-techniker,
             status          TYPE zob_sb2_tickets-status,
           END OF t_tickets.
* Bezeichner des Buttons
    CONSTANTS: co_btn_xl_export TYPE string VALUE 'BTN_XL_EXPORT'.
    CLASS-DATA: lt_tickets  TYPE TABLE OF t_tickets,
                ls_tickets  TYPE t_tickets,
                rs_selfield TYPE slis_selfield.

    CLASS-METHODS : on_toolbar_click FOR EVENT added_function OF cl_salv_events_table
      IMPORTING
        e_salv_function
        sender.
ENDCLASS.
