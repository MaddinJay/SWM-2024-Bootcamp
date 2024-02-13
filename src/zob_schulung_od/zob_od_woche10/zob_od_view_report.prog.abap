*&---------------------------------------------------------------------*
*& Report zob_od_view_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

REPORT zob_od_view_report.
START-OF-SELECTION.
PARAMETERS: p_rcurr Type s_currcode,
            p_text(10) type c.
SELECT
 FROM
ZOB_CDS_OD_CARRIER( p_curr = @p_rcurr,
p_text = @p_text )
 FIELDS
 *
 INTO TABLE @DATA(lt_fluggesell_info).
 DATA: o_salv TYPE REF TO cl_salv_table.
    cl_salv_table=>factory( IMPORTING
                              r_salv_table = o_salv
                            CHANGING
                              t_table      = lt_fluggesell_info ).
    DATA functions TYPE REF TO cl_salv_functions_list.
    functions = o_salv->get_functions( ).
    functions->set_all( ).
    o_salv->display( ).
