*&---------------------------------------------------------------------*
*& Report z_tw_employee
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_tw_employee.

CLASS lcl_employee DEFINITION.
  PUBLIC SECTION.
    DATA: employee_id   TYPE i,
          employee_name TYPE string,
          salary        TYPE i.
          METHODS:
             constructor IMPORTING id       TYPE i
                                                     name TYPE string
                                                     salary TYPE p,

             display_employee_info,

             give_raise    IMPORTING increase TYPE p.

          ENDCLASS.
CLASS lcl_employee IMPLEMENTATION.
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
  DATA: lo_employee TYPE REF TO lcl_employee.

  CREATE OBJECT lo_employee
    EXPORTING
      id     = 101
      name   = 'Hans Dampf'
      salary = 2500.

  lo_employee->display_employee_info( ).
