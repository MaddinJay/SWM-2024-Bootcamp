*&---------------------------------------------------------------------*
*& Report zob_em_gruppenarbeit
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_em_gruppenarbeit.


*"ganze Tabelle ausgeben
*
**SELECTION-SCREEN BEGIN OF BLOCK Hole WITH FRAME TITLE TEXT-003.
**
**  PARAMETERS: p_hole as Checkbox.
**
**SELECTION-SCREEN END OF BLOCK Hole.
*
*
*Select
*From sbuspart
*Fields *
*Into Table @Data(lt_sbuspart).
*
*SELECTION-SCREEN begin of block hole with frame title text-004.
*
*Parameters: p_1 as checkbox.
*
*Selection-screen end of block hole.
*
*.
*
*If p_1 = abap_true.
*cl_demo_output=>display( lt_sbuspart ).
*endif.



**
Select
From spfli
Fields *
Into table @Data(lt_tabelle).
*
*cl_demo_output=>display( lt_tabelle ).
*
*Data ls_struktur type spfli.
*
*Delete  from spfli where connid = ' '.


Update spfli set connid = 0  where CITYFROM = 'LALALAND'.













        If sy-subrc = 0.
Write 'yes'.
Else. Write 'no'.
Endif.
