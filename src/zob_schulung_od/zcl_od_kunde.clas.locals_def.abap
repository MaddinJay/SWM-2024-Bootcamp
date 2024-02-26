
CLASS zcl_odevents DEFINITION.
  PUBLIC SECTION.
* Bezeichner der Buttons
    CONSTANTS: co_btn_xl_export TYPE string VALUE 'BTN_XL_EXPORT'.
    CONSTANTS: lv_action TYPE sy-ucomm VALUE 'back'.

    CLASS-METHODS:
      on_toolbar_click FOR EVENT added_function OF cl_salv_events_table
        IMPORTING
          e_salv_function
          sender,

      handle_user_command FOR EVENT added_function OF cl_salv_events_table
        IMPORTING
          e_salv_function
          sender.

ENDCLASS.
