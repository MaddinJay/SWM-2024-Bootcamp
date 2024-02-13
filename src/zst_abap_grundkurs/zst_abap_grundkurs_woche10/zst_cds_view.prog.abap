*&---------------------------------------------------------------------*
*& Report zst_cds_view
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_cds_view.

*SELECT
* FROM
* ZOB_CDS_ST_001( p_name = 'Kangeroos',
*                 p_date = '20240101' )
* FIELDS
* *
* INTO TABLE @DATA(lt_fluggesell_info).
*
*cl_demo_output=>display( lt_fluggesell_info ).

PARAMETERS: p_spra TYPE tbz9a-spras,
            p_date TYPE sy-datum.

SELECT
 FROM
 zob_cds_st_bu_partner( p_lang = @p_spra,
                 p_date = @p_date )
 FIELDS
 *
 INTO TABLE @DATA(lt_business).

cl_demo_output=>display( lt_business ).
