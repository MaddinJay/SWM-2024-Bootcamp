*&---------------------------------------------------------------------*
*& Report zob_mb_parameters2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_parameters2.


PARAMETERS: p_text(10) type c default 'Hallo!',    "char10
            p_curr type s_currcode default 'EUR'. "scarr-currocode


SELECT
 FROM
 ZOB_CDS_MB_Carrier( p_currcode = @p_curr , p_text = @p_text )

 FIELDS
 *
 INTO TABLE @DATA(lt_flug).

 cl_demo_output=>display( lt_flug ).
