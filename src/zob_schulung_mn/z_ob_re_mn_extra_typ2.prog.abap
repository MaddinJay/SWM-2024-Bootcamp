*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_extra_typ2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_extra_typ2.

TYPES: BEGIN OF ty_s_text,
        sprachkuerzel TYPE c LENGTH 2,
        text type string,
       END OF ty_s_text.


DATA: lt_text TYPE TABLE OF ty_s_text.

lt_text = VALUE #(
  ( sprachkuerzel = 'DE' text = 'deutscher Text' )
  ( sprachkuerzel = 'AT' text = 'österreichischer Text' )
).

cl_demo_output=>display( lt_text ).
