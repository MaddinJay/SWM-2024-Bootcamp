*&---------------------------------------------------------------------*
*& Report zem_class_modify
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_class_modify.


SELECTION-SCREEN begin of block rahmen with frame title text-001.

PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid,
            p_fldate TYPE sflight-fldate.

Selection-screen end of block rahmen.


 ZEM_CLASS_treibstoffverbrauch=>verbrauch( iv_connid = p_connid iv_carrid = p_carrid iv_fldate = p_fldate ).
