CLASS zob5_cl_check1_car DEFINITION INHERITING FROM zob5_cl_check_car
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: car_check REDEFINITION.
    METHODS: car_reparieren REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
      DATA gt_other_owners TYPE table of zobtl_t_owner_tl.
ENDCLASS.



CLASS zob5_cl_check1_car IMPLEMENTATION.

  METHOD car_check.
    super->car_check( ). " Zusatz 6. (Aufruf der Muttermethode)
    select                " Zusatz 6. Hier werden alleanderen Owner ausgelesen und in eine Tabelle geschrieben
    from zobtl_t_owner_tl
    Fields *
    where owner_name <> @gs_owner-owner_name
    into table @gt_other_owners.

    Loop at gt_other_owners into Data(gs_other_owner). " Zusatz 6. ERhöhung von leservice
      update zobtl_t_owner_tl
        set leservice = leservice + 100
        where owner_name = @gs_other_owner-owner_name.
    endloop.
  ENDMETHOD.

  METHOD car_reparieren.
    UPDATE zobtl_t_owner_tl
      SET leservice = 1 , fin = 'ZYXWVU00000000098'
*      set leservice = 20001 , fin = 'ABCDEFGHIJ0000006'
      WHERE owner_name = @gs_owner-owner_name.

  ENDMETHOD.



ENDCLASS.
