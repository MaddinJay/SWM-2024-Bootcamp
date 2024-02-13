
 CLASS ztw_glas DEFINITION
  PUBLIC
  CREATE PUBLIC.
   PUBLIC SECTION.

     METHODS constructor IMPORTING io_getraenk TYPE REF TO ztw_getraenk.
     INTERFACES: ztw_gefaess. "Gefäß hinzugefügt
     ALIASES fuellen FOR ztw_gefaess~fuellen. "ALIASES schreiben, damit im Report nicht zu viel geändert werden muss.
     ALIASES leeren FOR ztw_gefaess~leeren.
     ALIASES getfuellmenge FOR ztw_gefaess~getfuellmenge.

   PROTECTED SECTION.
   PRIVATE SECTION.
     DATA: mo_getraenk TYPE REF TO ztw_getraenk.

 ENDCLASS.


 CLASS ztw_glas IMPLEMENTATION.

   METHOD constructor.
     "Instanziiere mo_getränk
     mo_getraenk = io_getraenk.
   ENDMETHOD.

   METHOD ztw_gefaess~fuellen. "Methode greift auf Interface 'ztw_gefaess' zu.
     mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).
   ENDMETHOD.

   METHOD ztw_gefaess~getfuellmenge.
     rv_menge = mo_getraenk->get_menge(  ).
   ENDMETHOD.

   METHOD ztw_gefaess~leeren.
     mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).
   ENDMETHOD.

 ENDCLASS.
