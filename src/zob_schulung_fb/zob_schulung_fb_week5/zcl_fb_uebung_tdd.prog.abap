*&---------------------------------------------------------------------*
*& Report zcl_fb_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcl_fb_uebung_tdd.

DATA iv_gender    TYPE int1.
DATA iv_language  TYPE char1.
DATA go_mapping   TYPE REF TO zfb_mapping_tdd.
DATA go_langu     TYPE REF TO zfb_mapping_tdd.

START-OF-SELECTION.
  PARAMETERS p_gender   TYPE int1.
  PARAMETERS p_langu    TYPE char1.
END-OF-SELECTION.

CREATE OBJECT go_mapping TYPE zfb_mapping_tdd.

DATA(gv_gender) = go_mapping->map_gender( p_gender ).

WRITE / gv_gender.

CREATE OBJECT go_langu TYPE zfb_mapping_tdd.

DATA(gv_langu) = go_mapping->map_language( p_langu ).

WRITE / gv_langu.
