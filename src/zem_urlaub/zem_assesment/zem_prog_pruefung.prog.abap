*&---------------------------------------------------------------------*
*& Report zem_prog_pruefung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_prog_pruefung.


*Select
*from zem_cds_ueben( p_name = 'LH', p_text = @( sy-uzeit+4(2) ) )
*FIELDS *
*into table @Data(lt_tabelle)
*up to 10 rows.



*Select From Zem_Cds_ASS1 fields * into table @Data(lt_tabelle).
*
*cl_demo_output=>display( lt_tabelle ).



*Select
*From ZEM_CDS_Assoziation
*Fields
*carrid,
*\_scarr-carrname,
*Count( connid ) as Summe_ID,
*Avg( \_sflight-price ) as AVG
*Group by carrid, \_scarr-carrname
*into table @data(lt_t).
*
*cl_demo_output=>display( lt_t ).
*
*
*data lv_price type p DECIMALS 2.
*
*
*Loop at lt_t into Data(ls_s).
*
*lv_price =  ls_s-avg.
*
*Write: ls_s-Carrid, ls_s-carrname, lv_price, 'EUR', ls_s-summe_id, /.
*
*Endloop.


Select
from zem_cds_assoziation
Fields *
Where carrid = 'LH'
into table @Data(lt_t).

cl_demo_output=>display( lt_t ).
