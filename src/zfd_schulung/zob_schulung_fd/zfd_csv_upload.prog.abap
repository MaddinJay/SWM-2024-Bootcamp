*&---------------------------------------------------------------------*
*& Report ZFD_CSV_UPLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_csv_upload.

TYPES: BEGIN OF lty_komponenten,
         name TYPE string,
       END OF lty_komponenten.

TYPES: BEGIN OF lty_person,
         name    TYPE string,
         vorname TYPE string,
         alter   TYPE i,
         beruf   TYPE string,
       END OF lty_person.

DATA lt_person TYPE TABLE OF lty_person.
DATA lt_csv_data TYPE truxs_t_text_data.
DATA lt_komponenten_person TYPE TABLE OF lty_komponenten.
DATA ls_komponenten TYPE lty_komponenten.
DATA ls_components TYPE abap_compdescr.

DATA lo_struktur TYPE REF TO cl_abap_structdescr.

data lv_path TYPE string VALUE 'csv'.

CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    filename = lv_path
*   FILETYPE = 'ASC'
*   HAS_FIELD_SEPARATOR           = ' '
*   HEADER_LENGTH                 = 0
*   READ_BY_LINE                  = 'X'
*   DAT_MODE = ' '
*   CODEPAGE = ' '
*   IGNORE_CERR                   = ABAP_TRUE
*   REPLACEMENT                   = '#'
*   CHECK_BOM                     = ' '
*   VIRUS_SCAN_PROFILE            =
*   NO_AUTH_CHECK                 = ' '
* IMPORTING
*   FILELENGTH                    =
*   HEADER   =
  TABLES
    data_tab = lt_csv_data
* CHANGING
*   ISSCANPERFORMED               = ' '
* EXCEPTIONS
*   FILE_OPEN_ERROR               = 1
*   FILE_READ_ERROR               = 2
*   NO_BATCH = 3
*   GUI_REFUSE_FILETRANSFER       = 4
*   INVALID_TYPE                  = 5
*   NO_AUTHORITY                  = 6
*   UNKNOWN_ERROR                 = 7
*   BAD_DATA_FORMAT               = 8
*   HEADER_NOT_ALLOWED            = 9
*   SEPARATOR_NOT_ALLOWED         = 10
*   HEADER_TOO_LONG               = 11
*   UNKNOWN_DP_ERROR              = 12
*   ACCESS_DENIED                 = 13
*   DP_OUT_OF_MEMORY              = 14
*   DISK_FULL                     = 15
*   DP_TIMEOUT                    = 16
*   OTHERS   = 17
  .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

lo_struktur ?= cl_abap_typedescr=>describe_by_name( 'LTY_PERSON' ).

LOOP AT lo_struktur->components into ls_components.
  ls_komponenten-name = ls_components-name.
  APPEND ls_komponenten to lt_komponenten_person.

ENDLOOP.
