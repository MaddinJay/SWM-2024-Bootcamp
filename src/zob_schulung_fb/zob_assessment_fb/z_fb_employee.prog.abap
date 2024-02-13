*&---------------------------------------------------------------------*
*& Report z_fb_employee
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_employee.

CLASS zcl_employee DEFINITION.

  PUBLIC SECTION.
    DATA: employee_id   TYPE i,
          employee_name TYPE string,
          salary    TYPE p DECIMALS 2.

    METHODS:
      constructor IMPORTING id     TYPE i
                            name   TYPE string
                            salary TYPE p,

      display_employee_info,

      give_raise    IMPORTING increase TYPE p.

ENDCLASS.

CLASS zcl_employee IMPLEMENTATION.

  METHOD constructor.
    employee_id = id.
    employee_name = name.
    me->salary = salary.
  ENDMETHOD.

  METHOD display_employee_info.
    WRITE: / 'ID des Employee:', me->employee_id,
            / 'Name des Employee:', me->employee_name,
            / 'Salary des Employee:', me->salary.
  ENDMETHOD.

  METHOD give_raise.

    me->salary = me->salary + increase.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA lo_empl TYPE REF TO zcl_employee.

  lo_empl = NEW #( id = 101 name = 'Hans Dampf' salary = 2500 ).

  lo_empl->display_employee_info( ).
