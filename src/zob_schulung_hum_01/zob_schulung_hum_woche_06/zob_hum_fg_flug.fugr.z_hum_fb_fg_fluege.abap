FUNCTION z_hum_fb_fg_fluege.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  EXPORTING
*"     REFERENCE(EX_GESAMTFLUEGE) TYPE  I
*"----------------------------------------------------------------------



   SELECT
   From
   sflight
   Fields
*   count( carrid ) AS Fluggesellschaften
  count( fldate ) as Fluege_gesamt
   INTO @ex_gesamtfluege.

ENDFUNCTION.
