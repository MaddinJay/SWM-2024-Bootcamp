*&---------------------------------------------------------------------*
*& Report z_as_views2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_views2.

*SELECT
*FROM ZOB_CDS_AS_BUCHUNGEN( p_name = 'Kangeroos' , p_date = '20240206' )
*FIELDS *
*INTO TABLE @DATA(lt_fluggesell_info).
*cl_demo_output=>display( lt_fluggesell_info ).

*PARAMETERS: p_crc TYPE scarr-currcode, p_txt TYPE string.
*
*SELECT
*FROM zob_cds_as_carrier( p_currcode = @p_crc , p_txtfld = @p_txt )
*FIELDS *
*INTO TABLE @DATA(lt_carrier).
*cl_demo_output=>display( lt_carrier ).

PARAMETERS: p_date TYPE but050-date_from.
select
from zob_cds_as_bu_partner( p_dats = @p_date )
fields *
into table @DATA(lt_partner).
cl_demo_output=>display( lt_partner ).
