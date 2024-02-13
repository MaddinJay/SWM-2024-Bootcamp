*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_02_fb.
DATA: lv_brutto TYPE p DECIMALS 2.
*"Ausagbe
*WRITE 'Hallo Welt'.

PARAMETERS p_value1 TYPE p DECIMALS 2.


lv_brutto = p_value1 * '1.19'. "<----- Warum wird eine Zahl mit Nachkommestellen in Anführungszeichen geschrieben? Das ist doch dann ein Char?
WRITE lv_brutto.
