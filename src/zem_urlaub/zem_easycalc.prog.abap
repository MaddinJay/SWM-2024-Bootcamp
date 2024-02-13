*&---------------------------------------------------------------------*
*& Report zem_easycalc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_easycalc.

*Parameters p_links type p.
*Parameters p_rechts type p.
*
*Data lv_links like p_links.
*Data lv_rechts like p_rechts.
*Data lv_erg like p_rechts.
*Data lv_summe like p_rechts.
*
*lv_links = p_links.
*lv_rechts = p_rechts.
*
*Data: begin of ls_struktur,
*      links type p,
*      rechts type p,
*      summe type p,
*
*      end of ls_struktur.
*
*
*      Data lt_tabelle like table of ls_struktur.
*
*ls_struktur-links = p_links.
*ls_struktur-rechts = p_rechts.
*ls_struktur-summe = p_rechts.
*Append ls_struktur to lt_tabelle.
*
*
*While lv_links > 1.
*
*
*lv_links = floor( lv_links / 2 ).
*ls_struktur-links = lv_links.
*
*lv_rechts = lv_rechts * 2.
*ls_struktur-rechts = lv_rechts.
*
*lv_erg = lv_erg + lv_rechts.
*ls_struktur-summe = lv_erg.
*
*append ls_struktur to lt_tabelle.
*
*
*Endwhile.
*
*cl_demo_output=>display( lt_tabelle ).
*
*
*Loop at lt_tabelle into ls_struktur.
*
*IF ls_struktur-links mod 2 <> 0.
*
*lv_summe = lv_summe + ls_struktur-rechts.
*
*
*Endif.
*
*Endloop.
*
*Write lv_summe.


*Data(lv_1) = 89.
*Data(lv_2) = 4.
*
*Data(lv_e) = lv_1 div lv_2.
*
*write lv_e.
*
*
*Data(lv_time) = sy-uzeit+4(2).
*
*Data lv_time2 type p DECIMALS 4.
*
*lv_time2 =  sy-datum(4) - sqrt( lv_time ).
*
*
*
*write lv_time.
*Write / lv_time2.

*Data lv_count type i.
*Data(lv_text) = 'Hundeschnauze'.
*
*Do 4 times.
*
*lv_count = lv_count + sy-index.
*write: lv_text+5(8), '!', lv_text(lv_count).
*enddo.
*
*
*Data(lv_count) = 4.
*Data(lv_text) = 'Hundeschnauze'.
*
*write: lv_text+5(8), '!', lv_text(lv_count).


*DATA(lv_text)   = 'Hundeschnauze'.
*DATA(lv_length) = strlen( lv_text ).
*
*DATA lv_count TYPE i.
*
*DO lv_length TIMES.
*
*lv_count = lv_length - sy-index.
*
*Write lv_text+lv_count(1).
*
*ENDDO.
*
*Data(lv_text2) = reverse( lv_text ).
*
*write lv_text2.

*write: /, lv_text+5(8), '!', lv_text(4).

*Parameters: p_name1 type string,
*            p_name2 type string,
*            p_name3 type string,
*            p_name4 type string.


*      Call Function 'ZEM_FUBA_ZUFALL'
*    Exporting
*       iv_name1 = '1'
*       iv_name2 = '2'
*       iv_name3 = '3'
*       iv_name4 = '4'.










*Perform zem_form_zufall using p_name1 p_name2 p_name3 p_name4.
*
*
*Form zem_form_zufall using p_name1 p_name2 p_name3 p_name4.
*
*DATA: BEGIN OF ls_struktur,
*        name TYPE string,
*      END OF ls_struktur.
*
*DATA lt_tabelle LIKE TABLE OF ls_struktur.
*
*DATA lv_name TYPE string.
*
**DATA(lv_name1)   = 'Derya'.
**DATA(lv_name2)   = 'Hylia'.
**DATA(lv_name3)   = 'Aylin'.
**DATA(lv_name4)   = 'Yildiz'.
*
*
*DATA lv_count TYPE i.
*lv_count = sy-uzeit+4(1) + sy-uzeit+3(1).
*
*
*DO 15 TIMES.
*
*  lt_tabelle = VALUE #( BASE lt_tabelle
*                    ( name = p_name1 )
*                    ( name = p_name2 )
*                    ( name = p_name3 )
*                    ( name = p_name4 ) ).
*ENDDO.
*
*READ TABLE lt_tabelle INDEX sy-uzeit+4(2) INTO ls_struktur.
*
*IF sy-subrc = 0.
*  WRITE: /, |{ ls_struktur-name } ist Sieger|.
*
*ELSE.
*  READ TABLE lt_tabelle INDEX lv_count INTO DATA(ls_struktur2).
*  WRITE: /, |{ ls_struktur2-name } ist Sieger|.
*
*ENDIF.
*
*Endform.

DATA lv_avg TYPE p DECIMALS 3.



*Select
*From ZEM_RESULT
*Fields
*avg( anzahl_gesamt ) as Durchschnitt_Siege,
*sum( anzahl_gesamt ) as Summe_Siege,
*max( anzahl_siege ) as MaxSiege,
*min( anzahl_siege ) as MinSiege,
*Count(  anzahl_siege ) as SpielerAnzahl
*Where anzahl_siege Between 5 and 8
*into Table @Data(lt_tab)
*Up to 5 Rows.
*
*cl_demo_output=>display( lt_tab ).

*SELECT
*FROM zem_fixpreis
*FIELDS
*preisid,
*name,
*SUM( ceNTKWH ) AS Summe,
*AVG( summebetrag ) AS Durschnitt
*GROUP BY preisid, name
*HAVING SUM( centkwh ) BETWEEN '1.00' AND '6.00'
*ORDER BY MAX( Centkwh ) DESCENDING
*INTO TABLE @DATA(lt_tab2)
*UP TO 3 ROWS.
*
*
*cl_demo_output=>display( lt_tab2 ).

SELECT
FROM zem_fixpreis
FIELDS
preisid,
name,
min( ceNTKWH ) AS Summe,
AVG( summebetrag ) AS Durchschnitt,
Count( preisid ) as Zeilenanzahl
GROUP BY preisid, name
HAVING SUM( centkwh ) BETWEEN '0.1' AND '5.0' AND name <> 'NEV' AND preisid = 'UML'
ORDER BY MAX( Centkwh ) DESCENDING
INTO TABLE @DATA(lt_tab3)
UP TO 4 ROWS.

cl_demo_output=>display( lt_tab3 ).



*Loop at lt_tab into Data(ls_s).
*Write: ls_s-spielername, ls_s-anteil_siege, ls_s-anzahl_siege, /.
*Endloop.
