*&---------------------------------------------------------------------*
*& Report z_uh_employee
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uh_employee.

CLASS zcl_employee DEFINITION.

  PUBLIC SECTION.
    DATA: employee_id   TYPE i,
          employee_name TYPE string,
          salary        TYPE p DECIMALS 0.  " die 2 wurde mit 0 ersetzt, weil im Ergebnis die 2500 auch ohne Dezimalstellen stet

    METHODS:
      constructor IMPORTING id     TYPE i
                            name   TYPE string
                            salary TYPE p,

      display_employee_info,

      give_raise    IMPORTING increase TYPE p.

ENDCLASS.

CLASS zcl_employee IMPLEMENTATION.

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

START-OF-SELECTION.

  DATA lo_mitarbeiter TYPE REF TO zcl_employee.
  lo_mitarbeiter = NEW zcl_employee( id = 101 name = 'Hans Dampf' salary = 2500 ).
  lo_mitarbeiter->display_employee_info( ).
*  cl_demo_output=>display( lo_mitarbeiter ).
