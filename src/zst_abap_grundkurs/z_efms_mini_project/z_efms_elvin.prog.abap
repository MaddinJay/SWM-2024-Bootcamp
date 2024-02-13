*&---------------------------------------------------------------------*
*& Report z_efms_gesamt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_efms_gesamt.

SELECTION-SCREEN begin of block rahmen with frame title text-001.
PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY MODIF ID sc1,
            p_connid TYPE sflight-connid OBLIGATORY MODIF ID sc1,
            p_fldate TYPE sflight-fldate OBLIGATORY MODIF ID sc1.
Selection-screen end of block rahmen.

SELECTION-SCREEN begin of block rahmen2 with frame title text-002.
PARAMETERS: p_kosten as CHECKBOX.
Selection-screen end of block rahmen2.

SELECTION-SCREEN begin of SCREEN 100.
PARAMETERS p_literp type p decimals 2 MODIF ID sc2.
Selection-screen end of SCREEN 100.

z_efms_class_verbrauch=>verbrauch( iv_connid = p_connid iv_carrid = p_carrid iv_fldate = p_fldate ).


if p_kosten = abap_true.
    CALL SCREEN 100.
  z_efms_class_verbrauch=>tankkosten( p_literp ).
endif.
