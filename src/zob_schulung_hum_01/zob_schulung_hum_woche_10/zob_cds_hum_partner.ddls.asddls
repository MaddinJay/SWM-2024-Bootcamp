@AbapCatalog.sqlViewName: 'ZOB_CDS_PARTNER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Partner'
define view ZOB_CDS_HUM_PARTNER
  with parameters
    p_date : abap.dats,
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang : spras


  as select from but050
    inner join   but000 as but1 on but050.partner1 = but1.partner
    inner join   but000 as but2 on but050.partner2 = but2.partner
    inner join   tbz9a          on but050.reltyp = tbz9a.reltyp
{
  key but1.partner          as Partner,
  key but050.relnr          as Relnr,
  key but050.partner1       as Partner1,
  key but050.partner2       as Partner2,
  key but050.date_to        as DateTo,
  key tbz9a.spras           as Spras,
  key tbz9a.reltyp          as Reltyp,
  key tbz9a.xrf             as Xrf,
      but1.type             as Type,
      but1.bpkind           as Bpkind,
      but1.bu_group         as BuGroup,
      but1.bpext            as Bpext,
      but1.bu_sort1         as BuSort1,
      but1.bu_sort2         as BuSort2,
      but1.source           as Source,
      but1.title            as Title,
      but1.xdele            as Xdele,
      but1.xblck            as Xblck,
      but1.augrp            as Augrp,
      but1.title_let        as TitleLet,
      but1.bu_logsys        as BuLogsys,
      but1.contact          as Contact,
      but1.not_released     as NotReleased,
      but1.not_lg_competent as NotLgCompetent,
      but1.print_mode       as PrintMode,
      but1.bp_eew_dummy     as BpEewDummy,
      but1.rate             as Rate,
      but1.name_org1        as NameOrg1,
      but1.name_org2        as NameOrg2,
      but1.name_org3        as NameOrg3,
      but1.name_org4        as NameOrg4,
      but1.legal_enty       as LegalEnty,
      but1.ind_sector       as IndSector,
      but1.legal_org        as LegalOrg,
      but1.found_dat        as FoundDat,
      but1.liquid_dat       as LiquidDat,
      but1.location_1       as Location1,
      but1.location_2       as Location2,
      but1.location_3       as Location3,
      but1.name_last        as NameLast,
      but1.name_first       as NameFirst,
      but1.name_lst2        as NameLst2,
      but1.name_last2       as NameLast2,
      but1.namemiddle       as Namemiddle,
      but1.title_aca1       as TitleAca1,
      but1.title_aca2       as TitleAca2,
      but1.title_royl       as TitleRoyl,
      but1.prefix1          as Prefix1,
      but1.prefix2          as Prefix2,
      but1.name1_text       as Name1Text,
      but1.nickname         as Nickname,
      but1.initials         as Initials,
      but1.nameformat       as Nameformat,
      but1.namcountry       as Namcountry,
      but1.langu_corr       as LanguCorr,
      but1.xsexm            as Xsexm,
      but1.xsexf            as Xsexf,
      but1.birthpl          as Birthpl,
      but1.marst            as Marst,
      but1.emplo            as Emplo,
      but1.jobgr            as Jobgr,
      but1.natio            as Natio,
      but1.cntax            as Cntax,
      but1.cndsc            as Cndsc,
      but1.persnumber       as Persnumber,
      but1.xsexu            as Xsexu,
      but1.xubname          as Xubname,
      but1.bu_langu         as BuLangu,
      but1.gender           as Gender,
      but1.birthdt          as Birthdt,
      but1.deathdt          as Deathdt,
      but1.perno            as Perno,
      but1.children         as Children,
      but1.mem_house        as MemHouse,
      but1.birthdt_status   as BirthdtStatus,
      but1.partgrptyp       as Partgrptyp,
      but1.name_grp1        as NameGrp1,
      but1.name_grp2        as NameGrp2,
      but1.mc_name1         as McName1,
      but1.mc_name2         as McName2,
      but1.crusr            as Crusr,
      but1.crdat            as Crdat,
      but1.crtim            as Crtim,
      but1.chusr            as Chusr,
      but1.chdat            as Chdat,
      but1.chtim            as Chtim,
      but1.partner_guid     as PartnerGuid,
      but1.addrcomm         as Addrcomm,
      but1.td_switch        as TdSwitch,
      but1.is_org_centre    as IsOrgCentre,
      but1.db_key           as DbKey,
      but1.valid_from       as ValidFrom,
      but1.valid_to         as ValidTo,
      but1.xpcpt            as Xpcpt,
      but1.bank_area        as BankArea,
      but1.natpers          as Natpers,
      but1.milve            as Milve,
      but1.nuc_sec          as NucSec,
      but1.par_rel          as ParRel,
      but1.bp_sort          as BpSort,
      but1.kbanks           as Kbanks,
      but1.kbankl           as Kbankl,
      but050.date_from      as DateFrom,
      but050.dftval         as Dftval,
      but050.rltyp          as Rltyp,
      but050.relkind        as Relkind,
      but050.xdfrel         as Xdfrel,
      but050.xdfrel2        as Xdfrel2,
      but050.db_key_td      as DbKeyTd,
      tbz9a.bez50           as Bez50,
      tbz9a.bez50_2         as Bez502,
      tbz9a.rtitl           as Rtitl
}
where
      tbz9a.spras      = $parameters.p_lang and but050.date_to >= $parameters.p_date
