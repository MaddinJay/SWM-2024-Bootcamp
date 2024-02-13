*&---------------------------------------------------------------------*
*& Report zst_uebung_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_2.


**********************************************************************
*Typendeklaration 2
**********************************************************************
*TYPES: BEGIN OF lty_s_typ2,
*         sprachkuerzel(2) TYPE c,
*         text             TYPE string,
*       END OF lty_s_typ2.
*DATA: ls_typ2 TYPE lty_s_typ2.
*DATA lt_typ2 TYPE TABLE OF lty_s_typ2.
*
*
*lt_typ2 = VALUE #(
*( sprachkuerzel = 'DE' text = 'Deutscher Text' )
*( sprachkuerzel = 'AT' text = 'Österreichischer Text' )
*( sprachkuerzel = 'EN' text = 'Englischer Text' )
*( sprachkuerzel = 'ES' text = 'Spanischer Text' )
*( sprachkuerzel = 'IT' text = 'Italiensischer Text' )
*).
*
*
*cl_demo_output=>display( lt_typ2 ).

**********************************************************************
*Komplexe Tabelle
**********************************************************************
*
*TYPES: BEGIN OF lty_s_color1,
*         sprache    TYPE string,
*         farbenname TYPE string,
*       END OF lty_s_color1.
*DATA: ls_color1 TYPE lty_s_color1.
*
*ls_color1-sprache = 'Englisch'.
*ls_color1-farbenname = 'Red'.
*
*
*TYPES: BEGIN OF lty_t_farbt,
*         name         TYPE string,
*         vorkommen    TYPE string,
*         emotion      TYPE string,
*         uebersetzung TYPE lty_s_color1,
*       END OF lty_t_farbt.
*
*Data: Ls_Farbt type lty_t_farbt.
*Data: Lt_Farbt type table of lty_t_farbt.
*
*      ls_farbt-name = 'Rot'.
*      ls_farbt-vorkommen = 'Rose'.
*      ls_farbt-emotion = 'Wut'.
*      ls_farbt-uebersetzung = ls_color1.
*
*      Append ls_farbt to lt_farbt.
*
*cl_demo_output=>display(  lt_farbt ).

**********************************************************************
*Einmal Eins
**********************************************************************

*Data: lv_eme1 Type i,
*      lv_eme2 Type i,
*      lv_erg Type i.
*
*Do 10 Times.
*lv_eme1 = sy-index.
*do 10 Times .
*lv_eme2 = sy-index.
*lv_erg = lv_eme1 * lv_eme2.
*Write: / lv_eme1, '*', lv_eme2, '=', lv_erg.
*enddo.
*enddo.

**********************************************************************
*Max und Min
**********************************************************************

Types: Begin of Lty_s_maxmin,
      zahl type i,
      end of Lty_s_maxmin.
      Data: lt_maxmin type table of lty_s_maxmin,
            ls_maxmin type lty_s_maxmin,
            ls_max type lty_s_maxmin,
            ls_min type lty_s_maxmin.

   Do 100 Times.
   ls_maxmin-zahl = sy-index.
  append ls_maxmin to lt_maxmin.
   enddo.

cl_demo_output=>display(  lt_maxmin ).
