*&---------------------------------------------------------------------*
*& Include zfd_if_wheel
*&---------------------------------------------------------------------*

INTERFACE lif_wheel.
  METHODS check_wheel.
  CLASS-DATA kv_no_of_wheels TYPE i READ-ONLY.
  class-Methods get_no_of_wheels RETURNING VALUE(rv_no_of_wheels) type i.

ENDINTERFACE.
