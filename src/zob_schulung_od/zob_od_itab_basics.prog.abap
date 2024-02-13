*&---------------------------------------------------------------------*
*& Report zob_od_itab_basics
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_itab_basics.
DATA go_itab TYPE REF TO zob_od_cl_itab_basics.
DATA gt_itab TYPE zob_od_cl_itab_basics=>itab_data_type.
DATA gs_data TYPE zob_od_cl_itab_basics=>initial_type.

START-OF-SELECTION.

  go_itab = NEW #(  ).
  go_itab->get_itab(
    EXPORTING
      fill_itab = gt_itab
    RECEIVING
      rv_data   = gt_itab
  ).

  LOOP AT gt_itab INTO gs_data.
    WRITE: / | { gs_data-number } { gs_data-group } { gs_data-description }|.
  ENDLOOP.
