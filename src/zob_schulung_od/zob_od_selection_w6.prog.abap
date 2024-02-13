*&---------------------------------------------------------------------*
*& Report zob_od_selection_w6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_selection_w6.
TABLES: scustom.
  DATA: lt_table TYPE TABLE OF scustom,
        ls_scustom type scustom.

PARAMETERS p_code TYPE s_country OBLIGATORY.

    SELECT
     FROM scustom left join  sbook on scustom~id = sbook~customid
     FIELDS *
     where scustom~country = @p_code
     ORDER BY scustom~country, scustom~city, scustom~street DESCENDING
     into CORRESPONDING FIELDS OF table @lt_table.

     LOOP at lt_table INTO ls_scustom.
     write: / ls_scustom-country, ls_scustom-city, ls_scustom-street.
     ENDLOOP.
