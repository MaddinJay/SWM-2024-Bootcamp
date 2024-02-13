CLASS zem_class_preis_vert DEFINITION
  PUBLIC
*INHERITING FROM zem_class_tarif
  CREATE PUBLIC.

  PUBLIC SECTION.

   DATA gv_xxx TYPE zem_dt_centkwh.

  Methods: handelspreis importing iv_handelspreis type zem_dt_centkwh.

  Methods: vertrieb exporting ev_vertrieb type zem_dt_centkwh
                              ev_diridari type zem_dt_centkwh.




  Data mv_handelspreis type zem_dt_centkwh.
  Data mv_handelspreis2 type zem_dt_centkwh.


  PROTECTED SECTION.
  PRIVATE SECTION.

  Data lv_vertrieb type zem_dt_centkwh.
  Data lv_handel type zem_dt_centkwh.
  Data mv_handel type zem_dt_centkwh.


ENDCLASS.



CLASS zem_class_preis_vert IMPLEMENTATION.


  METHOD handelspreis.

  mv_handelspreis = iv_handelspreis.

  ENDMETHOD.

  METHOD vertrieb.


  ev_vertrieb = '7.000'.
  ev_diridari = gv_xxx.


   ENDMETHOD.


ENDCLASS.
