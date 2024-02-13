*&---------------------------------------------------------------------*
*& Report zob_od_extra_para_selection
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_extra_para_selection.

"parameter without any typing (1 character)
PARAMETERS: p_name.
"will be shown as checkbox
SELECTION-SCREEN BEGIN OF BLOCK main  WITH FRAME TITLE TEXT-odt.
  PARAMETERS: p_name1 AS CHECKBOX .
SELECTION-SCREEN END OF BLOCK main.

*"Radiobuton parameter, there must be at least two of them
PARAMETERS: p_name2 RADIOBUTTON GROUP rb1.
*"second one is set as defaulty set
PARAMETERS: p_name3 RADIOBUTTON GROUP rb1 DEFAULT 'X'.
*"parameter with ditctionary type
PARAMETERS: p_carrid TYPE scarr-carrid.
**"parameter with dynamic type
DATA: g_paramname(60) TYPE c.
PARAMETERS: p_dynami LIKE (g_paramname).
"parameter with ditctionary with value check
PARAMETERS: p_curr1  TYPE scarr-currcode VALUE CHECK.
*"obligatory parameter
PARAMETERS: p_carri1 TYPE scarr-carrid OBLIGATORY.
*"hidden parameter
PARAMETERS: p_carri2 TYPE scarr-carrid NO-DISPLAY.
*"parameter with memory id
PARAMETERS: p_carri3 TYPE char3 MEMORY ID car.
*"string parameter with field lenght set
PARAMETERS: p_strin1 TYPE string VISIBLE LENGTH 15 DEFAULT 'aaaa'.
*"string parameter with field lenght set and in lower case
PARAMETERS: p_strin2 TYPE string VISIBLE LENGTH 15 LOWER CASE DEFAULT 'aaaa'.
*"parameter with modify group
PARAMETERS: p_carri4 TYPE scarr-carrid MODIF ID gr1.
*"listbox parameter
PARAMETERS: p_name4  TYPE char2 AS LISTBOX VISIBLE LENGTH 25 MODIF ID gr1.
*"listobx parameter with user-command
PARAMETERS: p_name5  TYPE char2 AS LISTBOX VISIBLE LENGTH 25 USER-COMMAND lbchange.
*"parameter with matchcode object
PARAMETERS: p_name6  TYPE char2 MATCHCODE OBJECT h_t002.
*
*
"event at each output of selection screen

AT SELECTION-SCREEN OUTPUT.
  "loop at screen elements
  LOOP AT SCREEN.
    "if we find elements of our group
    IF screen-group1 EQ 'GR1'.
      "then change the font color
      screen-intensified = 1.
      MODIFY SCREEN.
    ENDIF.

  ENDLOOP.
*
*"events at user-command
AT SELECTION-SCREEN.
  "if the listobox has changed
  IF sy-ucomm EQ 'LBCHANGE'.
    "check if fields are same
    IF p_name5 = p_name4.
      "if yes then throw put a cursor on P_NAME5 and show message
      SET CURSOR FIELD 'P_NAME4'.
      MESSAGE w001(00) WITH 'P_NAME5 should be different than P_NAME4'.
    ENDIF.

  ENDIF.


INITIALIZATION.
  g_paramname = 'SFLIGHT-CARRID'.
*  "fill listboxes at initialization of program
  PERFORM set_listbox_values.
*
*
START-OF-SELECTION.
*  break-point.
*
**&---------------------------------------------------------------------*
**&      Form  set_listbox_values
**&---------------------------------------------------------------------*
*
FORM set_listbox_values.
  TYPE-POOLS: vrm.
  DATA: f_name TYPE vrm_id.
  DATA: ft_values TYPE vrm_values.
  DATA: fs_values LIKE LINE OF ft_values.

  f_name = 'P_NAME4'. "parameter name

  fs_values-key  = 'K1'. "key is the value that will be passed to parameter
  fs_values-text = 'Text of K1'. "descritpion of paramter shown in listbox
  APPEND fs_values TO ft_values.

  fs_values-key  = 'K2'.
  fs_values-text = 'Text of K2'.
  APPEND fs_values TO ft_values.

  fs_values-key  = 'K3'.
  fs_values-text = 'Text of K3'.
  APPEND fs_values TO ft_values.

  fs_values-key  = 'K4'.
  fs_values-text = 'Text of K4'.
  APPEND fs_values TO ft_values.


  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = f_name
      values          = ft_values
    EXCEPTIONS
      id_illegal_name = 1
      OTHERS          = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  f_name = 'P_NAME5'.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = f_name
      values          = ft_values
    EXCEPTIONS
      id_illegal_name = 1
      OTHERS          = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

ENDFORM.                    "set_listbox_values
