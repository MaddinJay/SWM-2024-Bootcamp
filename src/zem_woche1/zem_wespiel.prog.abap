*&---------------------------------------------------------------------*
*& Report zem_wespiel
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_wespiel.

*Data lv_connid type spfli-connid.
*
*
*
*data(ls_struktur) = Value spfli(
*
*          carrid = 2
*          Connid = 401
*          Countryfr = 'YT'
*          CITYFROM = 'BRA').



*Delete from spfli where carrid = ' '.


*SELECT
*  FROM
*    spfli
*  FIELDS
*    *
*  WHERE carrid = 2
*  INTO TABLE @DATA(lt_spfli).
*
*
*LOOP AT lt_spfli INTO DATA(ls_spfli).
*  "Kopie
*  ls_spfli-cityfrom = 'MUNICH'.
*  MODIFY spfli FROM ls_spfli.
*ENDLOOP.





*Data lv_v1 type p DECIMALS 2 value '2.0'.
*Data lv_v2 type p DECIMALS 6.
*
*While lv_v2 < 100.
*
*IF lv_v2 > 3.
*Clear lv_v2.
*Endif.
*
*lv_v2 = sy-index.
*Write: 'Index:', lv_v2.
*
*lv_v2 = ( lv_v1 + 1 ) ** lv_v2.
*Write:  'Ergebniss:',  lv_v2, /.
*Endwhile.



*Data: begin of ls_struktur,
*      price type p DECIMALS 2,
*      carrid type string,
*      avg type p decimals 2,
*      end of ls_struktur.
*
* Data lt_tabelle like table of ls_struktur.
*
*
*Select
*From sbook
*left OUTER JOIN SFLIGHT
*on sbook~CARRID = sflight~CARRID
*Fields
*sflight~price, sbook~carrid
*Where sflight~price < 200
*into table @lt_tabelle.
*
*Loop at lt_tabelle into ls_struktur.
*write: ls_struktur-price, /.
*Endloop.


SELECT
  FROM t002
  Fields laiso
  order by laiso
  INTO TABLE @Data(lt_langu).


cl_demo_output=>display( lt_langu ).


*Loop at lt_tabelle into Data(ls_struktur).
*Write: 'Preis:', ls_struktur-price, /.
*
*ls_struktur-price = ls_struktur-price + 1.
*Write: 'Preis + 1:', ls_struktur-price, /.
*
*Endloop.
