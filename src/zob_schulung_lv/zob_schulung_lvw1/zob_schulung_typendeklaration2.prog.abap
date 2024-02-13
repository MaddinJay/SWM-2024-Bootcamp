*&---------------------------------------------------------------------*
*& Report zob_schulung_typendeklaration2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_typendeklaration2.


TYPES: BEGIN OF ls_sprachtext,
         sprachkuerzel TYPE c LENGTH 2,
         text          TYPE string,
       END OF ls_sprachtext,
       lt_sprachtext TYPE TABLE OF ls_sprachtext.

DATA: lt_sprachtext type table of ls_sprachtext.

lt_sprachtext = VALUE #(
( sprachkuerzel = 'DE' text = 'deutscher text')
( sprachkuerzel = 'AT' text = 'österreichischer text' )
).





*lt_sprachtext = VALUE #( BASE ls_sprachtext (  sprachkuerzel = 't' text = 'testtext' ) ).
*  APPEND ls_sprachtext TO lt_sprachtext.


cl_demo_output=>display( lt_sprachtext ).
