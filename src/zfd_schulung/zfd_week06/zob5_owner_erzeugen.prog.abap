*&---------------------------------------------------------------------*
*& Report zob5_owner_erzeugen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob5_owner_erzeugen.

SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.   "Rahmen um die Parameter
  PARAMETERS:                                   "3 Parameter mit Lower Case und verpflichtend angelegt
    p_brand  TYPE char30 LOWER CASE OBLIGATORY,
    p_model  TYPE char30 LOWER CASE OBLIGATORY,
    p_yearpr TYPE numc4 LOWER CASE OBLIGATORY.
SELECTION-SCREEN END OF BLOCK a.


zob5_cl_car=>neues_auto_einfuegen( iv_brand = p_brand iv_model = p_model iv_yearprod = p_yearpr ). "Statische Methode aus Klasse aufrufen
