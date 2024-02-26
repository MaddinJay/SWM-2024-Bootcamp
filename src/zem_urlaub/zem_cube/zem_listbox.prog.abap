*&---------------------------------------------------------------------*
*& Report zem_listbox
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_listbox.



Parameters: p_grund type zsto_grund as listbox VISIBLE LENGTH 25.
Parameters: p_stonr type zsto_grund as listbox VISIBLE LENGTH 10.
Parameters: p_tech type znachname as listbox VISIBLE LENGTH 20.


Parameters p_stonr1 type zstonr.



At SELECTION-SCREEN on VALUE-REQUEST FOR p_stonr1.


select
from zdb_sto24
fields
stonr,
datum,
uhrzeit,
sto_grund,
kommentar
WHERE bearb_status = 'N'
into table @Data(lt_stonr)
up to 10 Rows.

Data: lt_return type table of DDSHRETVAL.



Call function 'F4IF_INT_TABLE_VALUE_REQUEST'
EXPORTING
RETFIELD      = 'ZDB_STO24'
VALUE_ORG     = 'S'
TABLES
Value_TAB     = LT_STONR
Return_Tab    = LT_RETURN

EXCEPTIONS
Parameter_ERROR = 1
NO_VALUES_FOUND = 2
Others          = 3.







At SELECTION-SCREEN OUTPUT.




Perform listbox_sto_grund using p_grund.
Perform listbox_stonr     using p_stonr.
Perform listbox_techniker using p_tech.



Form listbox_sto_grund using p_grund.
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


ls_stogrund-stogrund = 'kein Strom'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Zählerzuordnung'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Zählerdefekt'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Störung App'.
Append ls_stogrund to it_stogrund.
ls_stogrund-stogrund = 'Sonstiges'.
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

Form listbox_stonr using p_stonr.
***********************************************************************
* Neue Störungsnummern in Listbox

Types: BEGIN OF ls_stonr,
       stonr type zstonr,
       end of ls_stonr.


Data: it_stonr type STANDARD TABLE OF ls_stonr,
      ls_stonr type ls_stonr.


Data: g_id2 type vrm_id,
      it_values2 type vrm_values,
      wa_values2 like line of it_values2.


Select
from zdb_sto24
fields
stonr
Where nachname = ''
*Where bearb_status = 'Neu'
Into table @Data(lt_stonr).

Loop at lt_stonr into ls_stonr.
wa_values2-key = ls_stonr-stonr.
wa_values2-text = ls_stonr-stonr.

Append wa_values2 to it_values2.
clear wa_values2.

endloop.


g_id2 = 'P_STONR'.

Call FUNCTION 'VRM_SET_VALUES'
EXPORTING
id          = g_id2
values      = it_values2

EXCEPTIONS
id_illegal_name = 1
others          = 2.

Endform.

Form listbox_techniker using p_tech.
**********************************************************************
* Verfügbare Techniker in Listbox

Types: BEGIN OF ls_tech,
       nachname type znachname,
       end of ls_tech.


Data: it_tech type STANDARD TABLE OF ls_tech,
      ls_tech type ls_tech.

Data: g_id type vrm_id,
      it_values type vrm_values,
      wa_values like line of it_values.


Select
From zdb_technik24
Fields
nachname
where v_status = 'X'
Into TAble @it_tech.


Loop at it_tech into ls_tech.
wa_values-key = ls_tech-nachname.
wa_values-text = ls_tech-nachname.


Append wa_values to it_values.
clear wa_values.

Endloop.

g_id = 'P_TECH'.
Call FUNCTION 'VRM_SET_VALUES'
EXPORTING
id          = g_id
values      = it_values

EXCEPTIONS
id_illegal_name = 1
others          = 2.

Endform.
