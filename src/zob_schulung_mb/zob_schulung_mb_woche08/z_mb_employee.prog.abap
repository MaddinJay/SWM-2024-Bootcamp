*&---------------------------------------------------------------------*
*& Report z_mb_employee
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_mb_employee.



CLASS zcl_employee DEFINITION.

  PUBLIC SECTION.
    DATA: employee_id   TYPE i,
          employee_name TYPE string,
          salary        TYPE p DECIMALS 2.

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
    WRITE: / 'Employee ID:', me->employee_id,
            / 'Employee Name:', me->employee_name,
            / 'Salary:', me->salary.
  ENDMETHOD.

  METHOD give_raise.

    me->salary = me->salary + increase.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA lo_emp TYPE REF TO zcl_employee.

  lo_emp = NEW #( id = 101 name = 'Hans Dampf' salary = 2500 ).

  lo_emp->display_employee_info( ).
