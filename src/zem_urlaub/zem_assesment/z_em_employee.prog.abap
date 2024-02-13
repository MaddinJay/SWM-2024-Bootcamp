*&---------------------------------------------------------------------*
*& Report z_em_employee
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_em_employee.

class ZCL_EMPLOYEE definition.

PUBLIC SECTION.

    DATA:  employee_id       TYPE i,
               employee_name TYPE string,
               salary        TYPE p DECIMALS 2.

    METHODS:
             constructor IMPORTING id       TYPE i
                                   name TYPE string
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


Data lv_id type i value 5.
Data lv_name type string value 'Verdammt'.
Data lv_salary type p value '5.0'.



Start-of-SELECTION.

Data lo_1 type ref to ZCL_EMPLOYEE.

lo_1 = NEW #(
              id = lv_id
              name = lv_name
              salary = lv_salary ).

lo_1->give_raise( increase = '1.0' ).


lo_1->display_employee_info(  ).


End-of-SELECTION.
