*&---------------------------------------------------------------------*
*& Report zuh_uebung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_extra.

Data p_zeit type dats.
*PARAMETERS p_zeit type dats.
p_zeit = '20171018'.

select
from vbak
left join vbap
on vbak~vbeln = vbap~vbeln
left join kna1
on vbak~knkli = kna1~kunnr
left join makt
on vbap~matnr = makt~matnr
fields
vbak~erdat as Datum,
vbak~vbeln as Verkaufsbelegnr,
vbak~netwr as Betrag,
vbak~waerk as Waehrung,
kna1~name1 as Kunde,
vbap~posnr as Position,
makt~maktx as Material
where vbak~erdat = @p_zeit
into Table @Data(lt_extra).

cl_demo_output=>display( lt_extra ).

*loop at lt_extra into ls_extra
*where
