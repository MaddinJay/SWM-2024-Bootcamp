*&---------------------------------------------------------------------*
*& Report zst_instanziiung_klasse_512
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_instanziiung_klasse_512.

DATA lv_kraftfahrzeuge TYPE REF TO zst_schulung_uebung_kfz. "Deklarierung unserer Klasse

lv_kraftfahrzeuge = NEW #( ). "Instanz unserer Klasse

*CREATE Object lv_kraftfahrzeuge.

*Data(attribut) = lv_kraftfahrzeuge->lv_hersteller.

lv_kraftfahrzeuge->abbremsen( ).

*SELECT
*  FROM
*    SFLight
*  FIELDS
*    COnnid, seatsocc, seatsocc_b, seatsocc_f
*  ORDER BY Connid DESCENDING
*  INTO TABLE @DATA(lt_flights).
*
*  Select
*  from
*  spfli
*  left join lt_flights
*  on
*  spfli~connid = lt_flights~connid
*  fields
*
*
*  cl_demo_output=>display( lt_flights ).
