CLASS zcl_hum_extra_extra DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  Methods Ausgabe_Verkaufsbelege IMPORTING iv_datum Type vbak-audat.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hum_extra_extra IMPLEMENTATION.
  METHOD ausgabe_verkaufsbelege.
  SELect
  From VBAK as Verkaufsbeleg_Kopfdaten
  left join vbap as Verkaufsbeleg_Posdaten
  on verkaufsbeleg_Kopfdaten~vbeln = verkaufsbeleg_Posdaten~vbeln
  left join kna1 as Kundenstamm
  on verkaufsbeleg_kopfdaten~kunnr = kundenstamm~kunnr
  left join makt as Material
  on verkaufsbeleg_Posdaten~matnr = material~matnr

  Fields
  kundenstamm~kunnr as Kundennummer,
  kundenstamm~name1 as Kundenname,
  kundenstamm~name2 as Kundenname2,
  verkaufsbeleg_kopfdaten~vbeln as Verkaufsbeleg,
  verkaufsbeleg_Posdaten~pstyv as Position_Verkaufsbeleg,
  verkaufsbeleg_posdaten~posnr as Positionsnummer,
  material~matnr as Materialnummer,
  material~maktx as Materialtext,
  verkaufsbeleg_kopfdaten~netwr as Nettobetrag,
  verkaufsbeleg_kopfdaten~waerk as Waehrung
  Where  verkaufsbeleg_kopfdaten~audat = @iv_datum and material~spras = 'E'

  into table @data(lt_verkaufsbelege).
  cl_demo_output=>display( lt_verkaufsbelege ).

  ENDMETHOD.



ENDCLASS.
