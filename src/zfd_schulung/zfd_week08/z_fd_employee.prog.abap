*&---------------------------------------------------------------------*
*& Report z_fd_employee
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fd_employee.

*******************************
* lokale Klasse
*******************************
CLASS lcl_employee DEFINITION.

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

CLASS lcl_employee IMPLEMENTATION.

  METHOD constructor.
    me->employee_id = id.
    me->employee_name = name.
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

*******************************
* Beginn des Reports
*******************************
START-OF-SELECTION.
  DATA lo_employee TYPE REF TO lcl_employee.
  lo_employee = New #( id = 10
                       name = 'Xaver'
                       salary = '2499.06'
                       ).
  lo_employee->display_employee_info( ).
  uline.
  lo_employee->give_raise( 1000 ).
  lo_employee->display_employee_info( ).
