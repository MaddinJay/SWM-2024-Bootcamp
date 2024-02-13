*&---------------------------------------------------------------------*
*& Report ztw_glas_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_glas_report.

PARAMETERS: p_fuelle TYPE i,
            p_leer   TYPE i.

DATA go_glas TYPE REF TO ztw_glas. "Bezug auf Klasse
*DATA go_glas TYPE REF TO ztw_gefaess. "Bezug auf Interface
DATA go_wasser TYPE REF TO ztw_getraenk_wasser.
DATA go_gin TYPE REF TO ztw_getraenk_gin.
DATA grt_getraenk TYPE TABLE OF REF TO ztw_getraenk.
DATA gs_getraenk TYPE REF TO ztw_getraenk.


START-OF-SELECTION.

  go_wasser = NEW #(  ). " Up Cast
  APPEND go_wasser TO grt_getraenk.
*********************************************************************
  go_gin = NEW #(  ).
  APPEND go_gin TO grt_getraenk.


  LOOP AT grt_getraenk INTO gs_getraenk.

    go_glas = NEW #( gs_getraenk ).
    go_glas->fuellen( iv_menge = p_fuelle ). "Nach 'go_glas' wird das Interface mit ~ deklariert
    go_glas->leeren( iv_menge = p_leer ).
    DATA(gv_menge) = go_glas->getfuellmenge(  ).

    IF gv_menge > p_fuelle.
      WRITE: / 'Die Menge Wasser ist: ', gv_menge.
    ELSE.
      WRITE: / 'Die Menge Gin ist: ', gv_menge.
    ENDIF.
    ENDLOOP.

*  cl_demo_output=>display( grt_getraenk ).
