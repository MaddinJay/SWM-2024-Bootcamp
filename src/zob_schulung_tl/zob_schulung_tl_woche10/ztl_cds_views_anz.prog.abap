*&---------------------------------------------------------------------*
*& Report ztl_cds_views_anz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_cds_views_anz.

*SELECT
*FROM
*ztl_cds_union "Wichtig ist davor das CDS View zu aktvieren
*FIELDS
* *
* INTO TABLE @DATA(lt_cds_view).
* cl_demo_output=>display( lt_cds_view ). "Tabelle ausgeben lassen

SELECT
FROM
ZTL_CDS_JOIN1( p_name = 'Kangeroos' )
FIELDS *
INTO TABLE @DATA(lt_fluggesell_info).
cl_demo_output=>display( lt_fluggesell_info ).
