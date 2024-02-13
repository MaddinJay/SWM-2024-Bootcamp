*&---------------------------------------------------------------------*
*& Report ZEM_INPUTANW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_inputanw.

PARAMETERS pa_input TYPE string.

DATA pa_output TYPE string.
DATA pa_output1 TYPE string.

SPLIT pa_input AT ' ' INTO pa_output pa_output1.

WRITE: /, pa_input. ULINE. ULINE.

WRITE: 'Vorname:', pa_output,/,
'Nachname:', pa_output1.
