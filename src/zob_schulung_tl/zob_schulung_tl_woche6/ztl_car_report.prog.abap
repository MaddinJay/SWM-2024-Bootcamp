*&---------------------------------------------------------------------*
*& Report ztl_car_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_car_report.
*Klasse aufrufen
DATA aufrufen TYPE REF TO ztl_cl_car.
SELECTION-SCREEN BEGIN OF BLOCK tto WITH FRAME TITLE TEXT-001.

PARAMETERS:
p_brand TYPE zobtl_t_car_tl-brand,
p_model TYPE zobtl_t_car_tl-model,
p_jahr TYPE zobtl_t_car_tl-jahr,
p_name TYPE zobtl_t_owner_tl-owner_name,
p_adress TYPE zobtl_t_owner_tl-owner_adress.
SELECTION-SCREEN END OF BLOCK tto.

"Damit hat man die Methode aufgerufen + Die Formel in der Methode ausgeführt
ztl_cl_car=>eintrag(
EXPORTING
iv_brand = p_brand
iv_model = p_model
iv_jahr = p_jahr
).

ztl_cl_car=>owner(
EXPORTING
iv_name = p_name
iv_adress = p_adress
iv_brand = p_brand
iv_model = p_model
iv_jahr = p_jahr
 ).


"Schickt eine Nachricht, wenn es geklappt/ nicht geklappt hat
IF sy-subrc = 0.
MESSAGE 'Die Daten wurden gespeichert.' TYPE 'I'.
ELSE.
MESSAGE 'Die Daten konnten nicht geschrieben werden.' TYPE 'W'.
ENDIF.
