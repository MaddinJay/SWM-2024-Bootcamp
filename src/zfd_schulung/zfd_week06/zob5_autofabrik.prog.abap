*&---------------------------------------------------------------------*
*& Report zob5_autofabrik
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob5_autofabrik.

SELECTION-SCREEN BEGIN OF BLOCK b WITH FRAME.   "Rahmen um die Parameter
  PARAMETERS:                                   "3 Parameter mit Lower Case und verpflichtend angelegt
    p_brand  TYPE char30 LOWER CASE OBLIGATORY,
    p_model  TYPE char30 LOWER CASE OBLIGATORY,
    p_yearpr TYPE numc4 LOWER CASE OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b.

SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.   "Rahmen um die Parameter
  PARAMETERS:                                   "3 Parameter mit Lower Case und verpflichtend angelegt
    p_owner  TYPE char30 LOWER CASE,
    p_adress TYPE char30 LOWER CASE,
    p_fahr type char30 Lower Case.
SELECTION-SCREEN END OF BLOCK a.


IF p_owner IS INITIAL AND p_adress IS INITIAL.
  zob5_cl_car=>neues_auto_einfuegen( iv_brand = p_brand iv_model = p_model iv_yearprod = p_yearpr ). "Statische Methode aus Klasse aufrufen
ELSE.
*  zob5_cl_car=>neues_auto_einfuegen( iv_brand = p_brand iv_model = p_model iv_yearprod = p_yearpr ).
  zob5_cl_car=>neuen_besitzer_einfuegen( iv_name = p_owner iv_adresse = p_adress iv_brand = p_brand iv_model = p_model iv_yearprod = p_yearpr iv_fahrgestellnr = p_fahr ).

ENDIF.
