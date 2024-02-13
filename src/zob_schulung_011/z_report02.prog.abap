*&---------------------------------------------------------------------*
*& Report z_report02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_report02.




PARAMETERS: pv_name TYPE string.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    CASE screen-name.
      WHEN 'PV_NAME'.
        IF pv_name = 'Max'.
          screen-active = 0. " Mache das Eingabefeld unsichtbar, wenn der Name 'Max' ist.
        ENDIF.
    ENDCASE.
  ENDLOOP.

  write pv_name.
