CLASS zem_class_erm_auft DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  Methods gesamtforderung importing iv_verbrauch type i
                                    iv_handelspreis type zem_dt_centkwh.

  Methods fixteile importing iv_verbrauch2 type i.

  Methods fixteile2 importing iv_verbrauch3 type i.

  Data mv_verbrauch type i.

  Methods fixteile3.



  PROTECTED SECTION.
  PRIVATE SECTION.

  Data lo_tarif type ref to zem_class_tarif.
  DAta rv_tarif type zem_dt_centkwh.
  Data lv_tarif type p decimals 2.

  Data lv_gesamtforderung type ZEM_DT_FORDERUNG.

ENDCLASS.



CLASS zem_class_erm_auft IMPLEMENTATION.

  METHOD gesamtforderung.



lo_tarif = NEW #(  ).
rv_tarif = lo_tarif->tarif(  ).

lv_tarif = rv_tarif + iv_handelspreis.

lv_gesamtforderung = ( lv_tarif * iv_verbrauch ) / 100. "Addition Handelspreis zur festen Preisbestandteilenv_tarif = rv_tarif.


Write: |Berechnung mit ermittelten Tarif { lv_tarif } Cent/kWh:|.
Uline.
Write: |{ iv_verbrauch } kWh X { lv_tarif } Cent/kWh = { lv_gesamtforderung } Euro (netto)|.
Uline.


  ENDMETHOD.

  METHOD fixteile.

  mv_verbrauch = iv_verbrauch2.

  Data lo_preisfix type ref to zem_class_preisfix.

  lo_preisfix = NEW #(  ).
  lo_preisfix->abgabe2( iv_verbrauch = mv_verbrauch ).

  ENDMETHOD.

  METHOD fixteile2.

  mv_verbrauch = iv_verbrauch3.

  Data lo_preisfix type ref to zem_class_preisfix.

  lo_preisfix = NEW #(  ).
  lo_preisfix->abgabe( iv_verbrauch = mv_verbrauch ).

  ENDMETHOD.

  METHOD fixteile3.








  ENDMETHOD.

ENDCLASS.
