CLASS zfd_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zfd_high_scores IMPLEMENTATION.

  METHOD constructor.
    scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.

*    LOOP AT scores_list into data(ms_scores).
*      write / ms_scores.
*    endloop.

    result = scores_list.
  ENDMETHOD.

  METHOD latest.
    " add solution here
  ENDMETHOD.

  METHOD personalbest.
    sort scores_list DESCENDING.

  ENDMETHOD.

  METHOD personaltopthree.
    " add solution here
  ENDMETHOD.


ENDCLASS.



