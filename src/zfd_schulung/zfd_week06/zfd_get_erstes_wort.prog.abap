*&---------------------------------------------------------------------*
*& Report zfd_get_erstes_wort
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_get_erstes_wort.

Data lv_satz type string Value 'Dagobert hat einen Geldspeicher.'.
Data lv_erstes_Wort type string .

perform get_erstes_Wort using lv_satz changing lv_erstes_wort.
write lv_erstes_wort.


FORM get_erstes_wort
  USING iv_satz TYPE string
  CHANGING cv_erstes_wort TYPE string.

  Data iv_rest_satz type string.

  SPLIT iv_satz AT space INTO: cv_erstes_wort iv_rest_satz.

ENDFORM.
