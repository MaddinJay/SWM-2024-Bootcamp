*&---------------------------------------------------------------------*
*& Report zob_mb_parameters
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_parameters.

SELECT
 FROM
 Z_CDS_MB_001( p_name = 'Kangeroos' , p_datum = '20240101'
 )
 FIELDS
 *
 INTO TABLE @DATA(lt_flug).

 cl_demo_output=>display( lt_flug ).
