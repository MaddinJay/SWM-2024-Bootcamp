*&---------------------------------------------------------------------*
*& Report zfd_unterproggi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_unterproggi.

FORM gr_zahl_zurueck USING iv_zahl1 TYPE i
                     changing iv_zahl2 type i .

  IF iv_zahl1 > iv_zahl2.
    iv_zahl2 = iv_zahl1.
  ELSEIF iv_zahl2 > iv_zahl1.
    iv_zahl2 = iv_zahl2.
  ELSE.
    iv_zahl2 = iv_zahl2.
  ENDIF.
ENDFORM.
