*&---------------------------------------------------------------------*
*& Report zem_listbox2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_listbox2.


Parameters: p_sgrund type zsto_grund as listbox VISIBLE LENGTH 25.
Parameters: p_grund type zsto_grund as listbox VISIBLE LENGTH 25.

at SELECTION-SCREEN output.

perForm listbox_sto_grund using p_sgrund.

Form listbox_sto_grund using p_sgrund.
**********************************************************************
*Störungsgrunde manuell in Listbox

Types: BEGIN OF ls_stogrund,
       stogrund type zsto_grund,
       end of ls_stogrund.


Data: it_stogrund type STANDARD TABLE OF ls_stogrund,
      ls_stogrund type ls_stogrund.


Data: g_id3 type vrm_id,
      it_values3 type vrm_values,
      wa_values3 like line of it_values3.


*AT SELECTION-SCREEN OUTPUT.


ls_stogrund-stogrund = 'Zählerdefekt'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Kein Strom'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Sperrung'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Ermittlung'.
Append ls_stogrund to it_stogrund.

Loop at it_stogrund into ls_stogrund.
wa_values3-key = ls_stogrund-stogrund.
wa_values3-text = ls_stogrund-stogrund.

Append wa_values3 to it_values3.
clear wa_values3.

endloop.


g_id3 = 'P_GRUND'.
Call FUNCTION 'VRM_SET_VALUES'
EXPORTING
id          = g_id3
values      = it_values3

EXCEPTIONS
id_illegal_name = 1
others          = 2.

Endform.
