*&---------------------------------------------------------------------*
*& Report zfd_glas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_glas.

*******************************
* Datendeklaration
*******************************
DATA go_glas TYPE REF TO zfd_glas. " Deklaration für Interface Art 1 und 3
*DATA go_glas TYPE REF TO zfd_gefaess. " Deklaration für Interface Art 2 (Interface)
DATA go_getraenk TYPE REF TO zfd_getraenk.
DATA go_wasser TYPE REF TO zfd_wasser.
DATA go_gin TYPE REF TO zfd_gin.

DATA lv_fuellmenge TYPE i.
DATA gt_getraenkelist TYPE STANDARD TABLE OF REF TO zfd_getraenk.
DATA gv_name TYPE string.

*******************************
* Instanzierung
*******************************
START-OF-SELECTION.

*  go_gin = NEW #(  ).
*  go_glas = NEW zfd_glas( go_gin ). " UPCAST  !

  go_wasser = NEW #( iv_name = 'Adelholzner Wasser' ).
*  go_glas = NEW #( go_wasser ).   " UPCAST !
  APPEND go_wasser TO gt_getraenkelist.

  go_gin = NEW #( iv_name = 'Hendricks Gin'  ).
*  go_glas = NEW zfd_glas( go_gin ). " UPCAST  !
  APPEND go_gin TO gt_getraenkelist.

*  go_getraenk = NEW #(  ).
*  go_glas = NEW zfd_glas( go_getraenk ).


*******************************
* Methodenaufrufe
*******************************
* " 1. Art des Aufrufs:
*  go_glas->zfd_gefaess~glas_fuellen( iv_menge1 = 100 ).
*  go_glas->zfd_gefaess~glas_leeren( iv_menge2 = 3 ).
*  lv_fuellmenge = go_glas->zfd_gefaess~get_fuellmenge( ). " Funktionaler Methodenaufruf und Zuweisung zur Reportvariablen

  " 2. + 3. Art des Aufrufs:
*  go_glas->glas_fuellen( iv_menge1 = 100 ).
*  go_glas->glas_leeren( iv_menge2 = 3 ).
*  lv_fuellmenge = go_glas->get_fuellmenge( ). " Funktionaler Methodenaufruf und Zuweisung zur Reportvariablen


*******************************
* Ausgabe im Programm per Loop
*******************************
  LOOP AT gt_getraenkelist INTO go_getraenk.

    go_glas = NEW #( go_getraenk ).
    go_glas->glas_fuellen( iv_menge1 = 10 ).
    go_glas->glas_leeren( iv_menge2 = 5 ).
*    go_getraenk->erhoehe_menge( iv_getraenk_menge1 = 10 ).
*    go_getraenk->reduziere_menge( iv_getraenk_menge2 = 5 ).
    lv_fuellmenge = go_glas->get_fuellmenge( ).
    gv_name = go_glas->get_name(  ).

    WRITE: /, gv_name,'hat die Füllmenge:', lv_fuellmenge.

*    CASE go_getraenk.
*      WHEN go_wasser.
*        WRITE: /, 'Wasser hat die Füllmenge ' , lv_fuellmenge.
*
*      WHEN go_gin.
*        WRITE: /, 'Gin hat die Füllmenge ' , lv_fuellmenge.
*    ENDCASE.
  ENDLOOP.


*  WRITE: / 'Füllmenge:', lv_fuellmenge.


******************************
* Übung  Vererbung 2
*******************************
  ULINE. ULINE.
*
*Data go_getraenk type REF TO zfd_getraenk.
*Data go_gin type REF TO zfd_gin.
*Data go_wasser type REF TO zfd_wasser.
*
*go_gin = new #( ).
*go_wasser = new #( ).
*
********************************
** Upcast 1 Gin
********************************
*go_getraenk = go_gin.
*go_getraenk->erhoehe_menge( iv_getraenk_menge1 = 100 ).
*lv_fuellmenge = go_getraenk->get_menge(  ).
*WRITE: / 'Füllmenge:', lv_fuellmenge.
*
********************************
** Upcast 2 Wasser
********************************
*go_getraenk = go_wasser.
*go_getraenk->erhoehe_menge( iv_getraenk_menge1 = 100 ).
*lv_fuellmenge = go_getraenk->get_menge(  ).
*WRITE: / 'Füllmenge:', lv_fuellmenge.
*
*
*Write:/ 'Ende Programm.'.
