object dmDatabase: TdmDatabase
  OnCreate = DataModuleCreate
  Height = 647
  Width = 1181
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=J:\!PROJECTS 2024\TIME\Trunk\BUILD\DB\THETIME.FDB'
      'User_Name=SYSDBA'
      'Server=Localhost'
      'CharacterSet=UTF8'
      'Password=R0ck#masterkey'
      'Protocol=TCPIP'
      'ExtendedMetadata=True'
      'IBAdvanced=1'
      'GUIDEndian=Big'
      'DriverID=FB')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    Connected = True
    Transaction = FDTransaction
    UpdateTransaction = trsUpd
    Left = 56
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 291
    Top = 16
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = FDConnection
    Left = 526
    Top = 16
  end
  object trsUpd: TFDTransaction
    Connection = FDConnection
    Left = 409
    Top = 17
  end
  object FDEventAlerter1: TFDEventAlerter
    Connection = FDConnection
    Left = 762
    Top = 16
  end
  object FDError: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 644
    Top = 16
  end
  object FDWait: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 880
    Top = 16
  end
  object FDPhysFB: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorHome = 'J:\!PROJECTS 2023\soneTrunk\BUILD\'
    VendorLib = 'fbclient.dll'
    Left = 173
    Top = 16
  end
  object mtHolidays: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 96
    object mtHolidaysID: TAutoIncField
      FieldName = 'ID'
    end
    object mtHolidaysBundesland: TStringField
      FieldName = 'Bundesland'
      Size = 50
    end
    object mtHolidaysFeiertag: TStringField
      FieldName = 'Feiertag'
      Size = 50
    end
    object mtHolidaysDatum: TDateField
      FieldName = 'Datum'
    end
    object mtHolidaysHinweis: TStringField
      FieldName = 'Hinweis'
      Size = 255
    end
  end
  object qryHolidays: TFDQuery
    Connection = FDConnection
    UpdateOptions.KeyFields = 'HOLIDAYS_ID'
    SQL.Strings = (
      'SELECT * FROM HOLIDAYS'
      'WHERE HYEAR = :YEAR')
    Left = 55
    Top = 236
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 2024
      end>
    object qryHolidaysHOLIDAYS_ID: TFDAutoIncField
      FieldName = 'HOLIDAYS_ID'
      Origin = 'HOLIDAYS_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryHolidaysHYEAR: TSmallintField
      FieldName = 'HYEAR'
      Origin = 'HYEAR'
    end
    object qryHolidaysCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryHolidaysSTATE_ID: TIntegerField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
      Required = True
    end
    object qryHolidaysStates: TStringField
      FieldKind = fkLookup
      FieldName = 'States'
      LookupDataSet = qryState
      LookupKeyFields = 'STATE_ID'
      LookupResultField = 'STATE'
      KeyFields = 'STATE_ID'
      Size = 50
      Lookup = True
    end
    object qryHolidaysCountry: TStringField
      FieldKind = fkLookup
      FieldName = 'Country'
      LookupDataSet = qryCountry
      LookupKeyFields = 'COUNTRY_ID'
      LookupResultField = 'ISO3166_1A2'
      KeyFields = 'COUNTRY_ID'
      Size = 2
      Lookup = True
    end
  end
  object qryState: TFDQuery
    Connection = FDConnection
    UpdateOptions.KeyFields = 'STATE_ID'
    SQL.Strings = (
      'SELECT * FROM V_StatesList')
    Left = 161
    Top = 521
  end
  object qryCountry: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * From V_CountryList')
    Left = 55
    Top = 521
    object qryCountryCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryCountryISO3166_1A2: TWideStringField
      FieldName = 'ISO3166_1A2'
      Origin = 'ISO3166_1A2'
      FixedChar = True
      Size = 2
    end
    object qryCountryCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 50
    end
    object qryCountryLANGUAGE_ID: TIntegerField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
    end
  end
  object qryUser: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * From SYS_USER')
    Left = 416
    Top = 235
    object qryUserUSER_ID: TFDAutoIncField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUserLANGUAGE_ID: TIntegerField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
    end
    object qryUserCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryUserSTATE_ID: TIntegerField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
    end
    object qryUserWORKINGGROUP_ID: TIntegerField
      FieldName = 'WORKINGGROUP_ID'
      Origin = 'WORKINGGROUP_ID'
    end
    object qryUserUSERNAME: TWideStringField
      FieldName = 'USERNAME'
      Origin = 'USERNAME'
      Size = 50
    end
    object qryUserUSERPASSWORD: TWideStringField
      FieldName = 'USERPASSWORD'
      Origin = 'USERPASSWORD'
      Size = 100
    end
    object qryUserFIRSTNAME: TWideStringField
      FieldName = 'FIRSTNAME'
      Origin = '"FIRSTNAME"'
      Size = 100
    end
    object qryUserLASTNAME: TWideStringField
      FieldName = 'LASTNAME'
      Origin = '"LASTNAME"'
      Size = 100
    end
    object qryUserPERSONALNR: TWideStringField
      FieldName = 'PERSONALNR'
      Origin = 'PERSONALNR'
      Size = 30
    end
    object qryUserEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryUserACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
    end
    object qryUserUSER_CREATE_ID: TWideStringField
      FieldName = 'USER_CREATE_ID'
      Origin = 'USER_CREATE_ID'
      FixedChar = True
      Size = 16
    end
    object qryUserUSER_UPDATE_ID: TWideStringField
      FieldName = 'USER_UPDATE_ID'
      Origin = 'USER_UPDATE_ID'
      FixedChar = True
      Size = 16
    end
    object qryUserUSER_CREATE: TSQLTimeStampField
      FieldName = 'USER_CREATE'
      Origin = 'USER_CREATE'
    end
    object qryUserUSER_UPDATE: TSQLTimeStampField
      FieldName = 'USER_UPDATE'
      Origin = 'USER_UPDATE'
    end
    object qryUserUSTART: TDateField
      FieldName = 'USTART'
      Origin = 'USTART'
    end
    object qryUserVACATIONDAYS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'VACATIONDAYS'
      Origin = 'VACATIONDAYS'
    end
  end
  object qryWorkHours: TFDQuery
    Connection = FDConnection
    UpdateOptions.KeyFields = 'WORKINGHOURS_ID'
    SQL.Strings = (
      'Select * From WORKINGHOURS'
      'WHERE WYEAR = :YEAR')
    Left = 55
    Top = 378
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryWorkHoursWORKINGHOURS_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'WORKINGHOURS_ID'
      Origin = 'WORKINGHOURS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryWorkHoursCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryWorkHoursWYEAR: TSmallintField
      FieldName = 'WYEAR'
      Origin = 'WYEAR'
    end
  end
  object qryWorkHoursDat: TFDQuery
    MasterSource = dsWorkHours
    MasterFields = 'WORKINGHOURS_ID'
    Connection = FDConnection
    UpdateOptions.KeyFields = 'WORKINGHOURSDAT_ID'
    SQL.Strings = (
      'Select * From WORKINGHOURSDAT'
      'WHERE WORKINGHOURS_ID = :WORKINGHOURS_ID')
    Left = 161
    Top = 378
    ParamData = <
      item
        Name = 'WORKINGHOURS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryWorkHoursDatWORKINGHOURSDAT_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'WORKINGHOURSDAT_ID'
      Origin = 'WORKINGHOURSDAT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryWorkHoursDatWORKINGHOURS_ID: TIntegerField
      FieldName = 'WORKINGHOURS_ID'
      Origin = 'WORKINGHOURS_ID'
    end
    object qryWorkHoursDatWORKINGGROUP_ID: TIntegerField
      FieldName = 'WORKINGGROUP_ID'
      Origin = 'WORKINGGROUP_ID'
    end
    object qryWorkHoursDatDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 100
    end
    object qryWorkHoursDatDAY1: TTimeField
      FieldName = 'DAY1'
      Origin = 'DAY1'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatDAY2: TTimeField
      FieldName = 'DAY2'
      Origin = 'DAY2'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatDAY3: TTimeField
      FieldName = 'DAY3'
      Origin = 'DAY3'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatDAY4: TTimeField
      FieldName = 'DAY4'
      Origin = 'DAY4'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatDAY5: TTimeField
      FieldName = 'DAY5'
      Origin = 'DAY5'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatDAY6: TTimeField
      FieldName = 'DAY6'
      Origin = 'DAY6'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatDAY7: TTimeField
      FieldName = 'DAY7'
      Origin = 'DAY7'
      DisplayFormat = 'HH:mm'
    end
    object qryWorkHoursDatFROMDATE: TDateField
      FieldName = 'FROMDATE'
      Origin = 'FROMDATE'
    end
  end
  object FDSState: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'P_GET_STATE_ID'
    Left = 168
    Top = 104
    ParamData = <
      item
        Position = 1
        Name = 'COUNTRY_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'STATESHORT'
        DataType = ftWideString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 3
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object qryHolidaysDat: TFDQuery
    MasterSource = dsHolidays
    MasterFields = 'HOLIDAYS_ID'
    Connection = FDConnection
    UpdateOptions.KeyFields = 'HOLIDAYSDAT_ID'
    SQL.Strings = (
      'SELECT * FROM HOLIDAYSDAT'
      'WHERE HOLIDAYS_ID = :HOLIDAYS_ID'
      'ORDER BY HDATE')
    Left = 161
    Top = 236
    ParamData = <
      item
        Name = 'HOLIDAYS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryHolidaysDatHOLIDAYSDAT_ID: TFDAutoIncField
      FieldName = 'HOLIDAYSDAT_ID'
      Origin = 'HOLIDAYSDAT_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryHolidaysDatHOLIEXTRAS_ID: TIntegerField
      FieldName = 'HOLIEXTRAS_ID'
      Origin = 'HOLIEXTRAS_ID'
    end
    object qryHolidaysDatHOLIDAYS_ID: TIntegerField
      FieldName = 'HOLIDAYS_ID'
      Origin = 'HOLIDAYS_ID'
    end
    object qryHolidaysDatHDATE: TDateField
      FieldName = 'HDATE'
      Origin = 'HDATE'
    end
    object qryHolidaysDatHNAME: TWideStringField
      FieldName = 'HNAME'
      Origin = 'HNAME'
      Size = 50
    end
    object qryHolidaysDatFCOST: TCurrencyField
      FieldName = 'FCOST'
      Origin = 'FCOST'
    end
  end
  object dsHolidays: TDataSource
    DataSet = qryHolidays
    Left = 55
    Top = 307
  end
  object dsHolidaysDat: TDataSource
    DataSet = qryHolidaysDat
    Left = 161
    Top = 307
  end
  object dsCountry: TDataSource
    DataSet = qryCountry
    Left = 55
    Top = 593
  end
  object FDSCheckHolidays: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'P_CHECKHOLYDAS'
    Left = 264
    Top = 96
    ParamData = <
      item
        Position = 1
        Name = 'HYEAR'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'RESULT'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object qryHoliExtras: TFDQuery
    MasterSource = dsCountry
    MasterFields = 'COUNTRY_ID'
    Connection = FDConnection
    UpdateOptions.KeyFields = 'HOLIEXTRAS_ID'
    SQL.Strings = (
      'SELECT * FROM HOLIEXTRAS'
      'WHERE COUNTRY_ID = :COUNTRY_ID'
      'ORDER BY HDATE')
    Left = 272
    Top = 236
    ParamData = <
      item
        Name = 'COUNTRY_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryHoliExtrasHOLIEXTRAS_ID: TFDAutoIncField
      FieldName = 'HOLIEXTRAS_ID'
      Origin = 'HOLIEXTRAS_ID'
      ReadOnly = True
    end
    object qryHoliExtrasCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryHoliExtrasSTATE_ID: TIntegerField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
    end
    object qryHoliExtrasHDATE: TDateField
      FieldName = 'HDATE'
      Origin = 'HDATE'
      DisplayFormat = 'dd.mm.xxxx'
    end
    object qryHoliExtrasHNAME: TWideStringField
      FieldName = 'HNAME'
      Origin = 'HNAME'
      Size = 50
    end
    object qryHoliExtrasFCOST: TCurrencyField
      FieldName = 'FCOST'
      Origin = 'FCOST'
    end
  end
  object dsHoliExtras: TDataSource
    DataSet = qryHoliExtras
    Left = 272
    Top = 307
  end
  object dsWorkHoursDat: TDataSource
    DataSet = qryWorkHoursDat
    Left = 161
    Top = 450
  end
  object dsUserYearDat: TDataSource
    DataSet = qryUserYearDat
    Left = 608
    Top = 307
  end
  object dsWorkHours: TDataSource
    DataSet = qryWorkHours
    Left = 55
    Top = 450
  end
  object qryWorkingGroup: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * From WORKINGGROUP')
    Left = 272
    Top = 378
    object qryWorkingGroupWORKINGGROUP_ID: TFDAutoIncField
      FieldName = 'WORKINGGROUP_ID'
      Origin = 'WORKINGGROUP_ID'
      ReadOnly = True
    end
    object qryWorkingGroupDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 100
    end
  end
  object qryUserYearDat: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  USERYEARDAT_ID,'
      '  USERYEAR_ID,'
      '  UDAY,'
      '  HOLIDAY,'
      '  COMES1,'
      '  GOES1,'
      '  COMES2,'
      '  GOES2,'
      '  PAUSE,'
      '  CODE,'
      '  UHOURS,'
      '  NOTE,'
      '  DAYCODE'
      'FROM SYS_USERYEARDAT   '
      'WHERE USERYEAR_ID = :USERYEAR_ID ')
    Left = 608
    Top = 235
    ParamData = <
      item
        Name = 'USERYEAR_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
    object qryUserYearDatUSERYEARDAT_ID: TFDAutoIncField
      FieldName = 'USERYEARDAT_ID'
      Origin = 'USERYEARDAT_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUserYearDatUSERYEAR_ID: TIntegerField
      FieldName = 'USERYEAR_ID'
      Origin = 'USERYEAR_ID'
    end
    object qryUserYearDatUDAY: TDateField
      FieldName = 'UDAY'
      Origin = 'UDAY'
    end
    object qryUserYearDatCOMES1: TTimeField
      FieldName = 'COMES1'
      Origin = 'COMES1'
    end
    object qryUserYearDatGOES1: TTimeField
      FieldName = 'GOES1'
      Origin = 'GOES1'
    end
    object qryUserYearDatCOMES2: TTimeField
      FieldName = 'COMES2'
      Origin = 'COMES2'
    end
    object qryUserYearDatGOES2: TTimeField
      FieldName = 'GOES2'
      Origin = 'GOES2'
    end
    object qryUserYearDatUHOURS: TIntegerField
      FieldName = 'UHOURS'
      Origin = 'UHOURS'
    end
    object qryUserYearDatPAUSE: TTimeField
      FieldName = 'PAUSE'
      Origin = 'PAUSE'
    end
    object qryUserYearDatCODE: TSmallintField
      FieldName = 'CODE'
      Origin = 'CODE'
    end
    object qryUserYearDatNOTE: TWideStringField
      FieldName = 'NOTE'
      Origin = 'NOTE'
      Size = 75
    end
    object qryUserYearDatHOLIDAY: TWideStringField
      FieldName = 'HOLIDAY'
      Origin = 'HOLIDAY'
      Size = 50
    end
    object qryUserYearDatDAYCODE: TSmallintField
      FieldName = 'DAYCODE'
      Origin = 'DAYCODE'
    end
  end
  object qryUserYear: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '   SELECT'
      '    USERYEAR_ID,'
      '    USER_ID,'
      '    UYEAR,'
      '    LASTYEARMINUTES,'
      '    VACATIONDAYSLASTYEAR,'
      '    VACATIONDAYS'
      '  FROM SYS_USERYEAR')
    Left = 504
    Top = 235
    object qryUserYearUSERYEAR_ID: TFDAutoIncField
      FieldName = 'USERYEAR_ID'
      Origin = 'USERYEAR_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUserYearUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object qryUserYearUYEAR: TSmallintField
      FieldName = 'UYEAR'
      Origin = 'UYEAR'
    end
    object qryUserYearLASTYEARMINUTES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LASTYEARMINUTES'
      Origin = 'LASTYEARMINUTES'
    end
    object qryUserYearVACATIONDAYSLASTYEAR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'VACATIONDAYSLASTYEAR'
      Origin = 'VACATIONDAYSLASTYEAR'
    end
    object qryUserYearVACATIONDAYS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'VACATIONDAYS'
      Origin = 'VACATIONDAYS'
    end
  end
  object qryLanguage: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM V_Language')
    Left = 272
    Top = 521
  end
  object dsUserYear: TDataSource
    DataSet = qryUserYear
    Left = 504
    Top = 307
  end
  object dsUser: TDataSource
    DataSet = qryUser
    Left = 416
    Top = 307
  end
  object dsWorkingGroup: TDataSource
    DataSet = qryWorkingGroup
    Left = 272
    Top = 450
  end
  object dsState: TDataSource
    DataSet = qryState
    Left = 161
    Top = 593
  end
  object dsLanguage: TDataSource
    DataSet = qryLanguage
    Left = 272
    Top = 593
  end
  object qryHolidaysExtraList: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  HOLIEXTRAS_ID,'
      '  COUNTRY_ID,'
      '  STATE_ID,'
      '  HDATE,'
      '  HNAME,'
      '  FCOST'
      'FROM HOLIEXTRAS  '
      'WHERE COUNTRY_ID = :COUNTRY_ID')
    Left = 424
    Top = 576
    ParamData = <
      item
        Name = 'COUNTRY_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryHolidaysExtraListHOLIEXTRAS_ID: TFDAutoIncField
      FieldName = 'HOLIEXTRAS_ID'
      Origin = 'HOLIEXTRAS_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryHolidaysExtraListCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryHolidaysExtraListSTATE_ID: TIntegerField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
    end
    object qryHolidaysExtraListHDATE: TDateField
      FieldName = 'HDATE'
      Origin = 'HDATE'
    end
    object qryHolidaysExtraListHNAME: TWideStringField
      FieldName = 'HNAME'
      Origin = 'HNAME'
      Size = 50
    end
    object qryHolidaysExtraListFCOST: TCurrencyField
      FieldName = 'FCOST'
      Origin = 'FCOST'
    end
  end
  object dsHolidaysExtraList: TDataSource
    DataSet = qryHolidaysExtraList
    Left = 552
    Top = 576
  end
  object qryUserSelect: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  SYS_USER.USER_ID,'
      '  SYS_USER.PERSONALNR,'
      '  SYS_USER.USERNAME,'
      '  SYS_USER.FIRSTNAME,'
      '  SYS_USER.LASTNAME,'
      '  SYS_USER.ACTIVEX,'
      '      GEO_COUNTRY.ISO3166_1A2,'
      
        '   GEO_STATE.STATE || '#39' ('#39' ||  GEO_STATE.STATESHORT || '#39')'#39' AS ST' +
        'ATE'
      'FROM SYS_USER'
      
        '   INNER JOIN GEO_COUNTRY ON (SYS_USER.COUNTRY_ID = GEO_COUNTRY.' +
        'COUNTRY_ID)'
      
        '   INNER JOIN GEO_STATE ON (SYS_USER.STATE_ID = GEO_STATE.STATE_' +
        'ID)  '
      
        'WHERE  USER_ID NOT IN (SELECT USER_ID FROM SYS_USERYEAR where  U' +
        'YEAR =:YEAR)')
    Left = 832
    Top = 312
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 20220
      end>
    object qryUserSelectUSER_ID: TFDAutoIncField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUserSelectPERSONALNR: TWideStringField
      FieldName = 'PERSONALNR'
      Origin = 'PERSONALNR'
      Size = 30
    end
    object qryUserSelectUSERNAME: TWideStringField
      FieldName = 'USERNAME'
      Origin = 'USERNAME'
      Size = 50
    end
    object qryUserSelectFIRSTNAME: TWideStringField
      FieldName = 'FIRSTNAME'
      Origin = '"FIRSTNAME"'
      Size = 100
    end
    object qryUserSelectLASTNAME: TWideStringField
      FieldName = 'LASTNAME'
      Origin = '"LASTNAME"'
      Size = 100
    end
    object qryUserSelectACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
    end
    object qryUserSelectISO3166_1A2: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ISO3166_1A2'
      Origin = 'ISO3166_1A2'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryUserSelectSTATE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATE'
      Origin = 'STATE'
      ProviderFlags = []
      ReadOnly = True
      Size = 56
    end
  end
  object dsUserSelect: TDataSource
    DataSet = qryUserSelect
    Left = 944
    Top = 312
  end
  object qryUserList: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  USER_ID,'
      '  USERYEAR_ID,'
      '  UYEAR,'
      '  ISO3166_1A2,'
      '  STATESHORT,'
      '  PERSONALNR,'
      '  LASTFIRST'
      'FROM V_USERYEARDAYS'
      'WHERE UYEAR = :YEAR'
      'ORDER BY LASTFIRST  ')
    Left = 832
    Top = 232
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 2024
      end>
    object qryUserListUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object qryUserListUSERYEAR_ID: TIntegerField
      FieldName = 'USERYEAR_ID'
      Origin = 'USERYEAR_ID'
    end
    object qryUserListUYEAR: TSmallintField
      FieldName = 'UYEAR'
      Origin = 'UYEAR'
    end
    object qryUserListISO3166_1A2: TWideStringField
      FieldName = 'ISO3166_1A2'
      Origin = 'ISO3166_1A2'
      FixedChar = True
      Size = 2
    end
    object qryUserListSTATESHORT: TWideStringField
      FieldName = 'STATESHORT'
      Origin = 'STATESHORT'
      Size = 3
    end
    object qryUserListPERSONALNR: TWideStringField
      FieldName = 'PERSONALNR'
      Origin = 'PERSONALNR'
      Size = 30
    end
    object qryUserListLASTFIRST: TWideStringField
      FieldName = 'LASTFIRST'
      Origin = 'LASTFIRST'
      Size = 202
    end
  end
  object dsUserList: TDataSource
    DataSet = qryUserList
    OnDataChange = dsUserListDataChange
    Left = 944
    Top = 232
  end
  object qryExcel: TFDQuery
    OnCalcFields = qryExcelCalcFields
    Connection = FDConnection
    SQL.Strings = (
      'Select * From SYS_USERYEARDAT'
      'WHERE'
      ''
      'USERYEAR_ID = :USERYEAR_ID and'
      'EXTRACT(Month FROM Uday) = :Month'
      'ORDER BY Uday')
    Left = 848
    Top = 552
    ParamData = <
      item
        Name = 'USERYEAR_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 102
      end
      item
        Name = 'MONTH'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryExcelUSERYEARDAT_ID: TFDAutoIncField
      FieldName = 'USERYEARDAT_ID'
      Origin = 'USERYEARDAT_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryExcelUSERYEAR_ID: TIntegerField
      FieldName = 'USERYEAR_ID'
      Origin = 'USERYEAR_ID'
    end
    object qryExcelUDAY: TDateField
      FieldName = 'UDAY'
      Origin = 'UDAY'
      DisplayFormat = 'DD'
    end
    object qryExcelCOMES1: TTimeField
      FieldName = 'COMES1'
      Origin = 'COMES1'
    end
    object qryExcelGOES1: TTimeField
      FieldName = 'GOES1'
      Origin = 'GOES1'
    end
    object qryExcelCOMES2: TTimeField
      FieldName = 'COMES2'
      Origin = 'COMES2'
    end
    object qryExcelGOES2: TTimeField
      FieldName = 'GOES2'
      Origin = 'GOES2'
    end
    object qryExcelPAUSE: TTimeField
      FieldName = 'PAUSE'
      Origin = 'PAUSE'
    end
    object qryExcelUHOURS: TIntegerField
      FieldName = 'UHOURS'
      Origin = 'UHOURS'
      OnGetText = getTextInt2Hours
    end
    object qryExcelCODE: TSmallintField
      FieldName = 'CODE'
      Origin = 'CODE'
    end
    object qryExcelNOTE: TWideStringField
      FieldName = 'NOTE'
      Origin = 'NOTE'
      Size = 75
    end
    object qryExcelDAYNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'DAYNAME'
      Calculated = True
    end
    object qryExcelHOLIDAY_ID: TIntegerField
      FieldName = 'HOLIDAY_ID'
      Origin = 'HOLIDAY_ID'
    end
    object qryExcelHOLIDAY: TWideStringField
      FieldName = 'HOLIDAY'
      Origin = 'HOLIDAY'
      Size = 50
    end
    object qryExcelFCOST: TCurrencyField
      FieldName = 'FCOST'
      Origin = 'FCOST'
    end
    object qryExcelcalcIsTime: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calcIsTime'
      OnGetText = getTextInt2HoursTime
      Calculated = True
    end
    object qryExcelcalcHourDiff: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calcHourDiff'
      OnGetText = getTextInt2HoursPosiNega
      Calculated = True
    end
    object qryExcelcalcHourCount: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calcHourCount'
      OnGetText = getTextInt2HoursPosiNegaZero
      Calculated = True
    end
    object qryExcelDAYCODE: TSmallintField
      FieldName = 'DAYCODE'
      Origin = 'DAYCODE'
    end
    object qryExcelDayType: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDayType'
      Size = 40
      Calculated = True
    end
  end
  object dsExcel: TDataSource
    DataSet = qryExcel
    Left = 960
    Top = 552
  end
  object FDS_CreateYearDate: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'P_INS_1USERYEARDAYS'
    Left = 464
    Top = 96
    ParamData = <
      item
        Position = 1
        Name = 'USER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_YEAR_TO_INSERT'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryWorkingHourdList: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  WORKINGHOURSDAT_ID,'
      '  WORKINGHOURS_ID,'
      '  WORKINGGROUP_ID,'
      '  FROMDATE AS FROMDATE,'
      '  CASE'
      
        '    WHEN LEAD(FROMDATE) OVER(ORDER BY FROMDATE) IS NULL THEN cas' +
        't( '#39'31.12.'#39' || EXTRACT(YEAR FROM FROMDATE) AS date)'
      '    ELSE LEAD(FROMDATE-1) OVER(ORDER BY FROMDATE)'
      '  END AS TODATE,'
      '  DESCRIPTION,'
      '  DAY1,'
      '  DAY2,'
      '  DAY3,'
      '  DAY4,'
      '  DAY5,'
      '  DAY6,'
      '  DAY7'
      'FROM WORKINGHOURSDAT'
      'WHERE WORKINGHOURS_ID = :WORKINGHOURS_ID and'
      '      WORKINGGROUP_ID = :WORKINGGROUP_ID '
      '      '
      '      '
      ''
      '--SELECT FROMDATE,DAY1,DAY2,DAY3,DAY4,DAY5,DAY6,DAY7 '
      '--FROM WORKINGHOURSDAT'
      
        '--WHERE   WORKINGHOURS_ID = :WORKINGHOURS_ID AND    WORKINGGROUP' +
        '_ID  = :WORKINGGROUP_ID'
      '--ORDER BY FROMDATE'
      ''
      ''
      ''
      '')
    Left = 424
    Top = 424
    ParamData = <
      item
        Name = 'WORKINGHOURS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 8
      end
      item
        Name = 'WORKINGGROUP_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryWorkingHourdListWORKINGHOURSDAT_ID: TFDAutoIncField
      FieldName = 'WORKINGHOURSDAT_ID'
      Origin = 'WORKINGHOURSDAT_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryWorkingHourdListWORKINGHOURS_ID: TIntegerField
      FieldName = 'WORKINGHOURS_ID'
      Origin = 'WORKINGHOURS_ID'
    end
    object qryWorkingHourdListWORKINGGROUP_ID: TIntegerField
      FieldName = 'WORKINGGROUP_ID'
      Origin = 'WORKINGGROUP_ID'
    end
    object qryWorkingHourdListDAY1: TTimeField
      DefaultExpression = 'null'
      FieldName = 'DAY1'
      Origin = 'DAY1'
    end
    object qryWorkingHourdListDAY2: TTimeField
      FieldName = 'DAY2'
      Origin = 'DAY2'
    end
    object qryWorkingHourdListDAY3: TTimeField
      FieldName = 'DAY3'
      Origin = 'DAY3'
    end
    object qryWorkingHourdListDAY4: TTimeField
      FieldName = 'DAY4'
      Origin = 'DAY4'
    end
    object qryWorkingHourdListDAY5: TTimeField
      FieldName = 'DAY5'
      Origin = 'DAY5'
    end
    object qryWorkingHourdListDAY6: TTimeField
      FieldName = 'DAY6'
      Origin = 'DAY6'
    end
    object qryWorkingHourdListDAY7: TTimeField
      DefaultExpression = 'null'
      FieldName = 'DAY7'
      Origin = 'DAY7'
    end
    object qryWorkingHourdListFROMDATE: TDateField
      FieldName = 'FROMDATE'
      Origin = 'FROMDATE'
    end
    object qryWorkingHourdListTODATE: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'TODATE'
      Origin = 'TODATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryWorkingHourdListDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 100
    end
  end
  object dsWorkingHourdList: TDataSource
    DataSet = qryWorkingHourdList
    Left = 552
    Top = 424
  end
  object qryHolidaysDatList: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  HOLIDAYSDAT_ID,'
      '  HOLIEXTRAS_ID,'
      '  HOLIDAYS_ID,'
      '  HDATE,'
      '  HNAME,'
      '  FCOST'
      'FROM HOLIDAYSDAT'
      'WHERE HOLIDAYS_ID = :HOLIDAYS_ID')
    Left = 424
    Top = 496
    ParamData = <
      item
        Name = 'HOLIDAYS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 239
      end>
    object qryHolidaysDatListHOLIDAYSDAT_ID: TFDAutoIncField
      FieldName = 'HOLIDAYSDAT_ID'
      Origin = 'HOLIDAYSDAT_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryHolidaysDatListHOLIEXTRAS_ID: TIntegerField
      FieldName = 'HOLIEXTRAS_ID'
      Origin = 'HOLIEXTRAS_ID'
    end
    object qryHolidaysDatListHOLIDAYS_ID: TIntegerField
      FieldName = 'HOLIDAYS_ID'
      Origin = 'HOLIDAYS_ID'
    end
    object qryHolidaysDatListHDATE: TDateField
      FieldName = 'HDATE'
      Origin = 'HDATE'
    end
    object qryHolidaysDatListHNAME: TWideStringField
      FieldName = 'HNAME'
      Origin = 'HNAME'
      Size = 50
    end
    object qryHolidaysDatListFCOST: TCurrencyField
      FieldName = 'FCOST'
      Origin = 'FCOST'
    end
  end
  object dsHolidaysDatList: TDataSource
    DataSet = qryHolidaysDatList
    Left = 552
    Top = 496
  end
  object FDSgetIDs: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'P_GET_USER_IDS'
    Left = 656
    Top = 96
    ParamData = <
      item
        Position = 1
        Name = 'VUSER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'VYEAR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'VCOUNTRY_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'VWORKINGGROUP_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 5
        Name = 'VSTATE_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'VUSERYEAR_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object FDSADDHolidaysDat: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'P_INS_2USERHOLIDAYS'
    Left = 680
    Top = 496
    ParamData = <
      item
        Position = 1
        Name = 'VUSERYEAR_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'HDATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'HNAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = 'FCOST'
        DataType = ftBCD
        Precision = 1
        NumericScale = 1
        ParamType = ptInput
      end>
  end
  object FDSADDHolidayExtra: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'P_INS_2USERHOLIDAYS'
    Left = 680
    Top = 576
    ParamData = <
      item
        Position = 1
        Name = 'VUSERYEAR_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'HDATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'HNAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = 'FCOST'
        DataType = ftBCD
        Precision = 1
        NumericScale = 1
        ParamType = ptInput
      end>
  end
  object qryUserExcelList: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  USER_ID,'
      '  USERYEAR_ID,'
      '  UYEAR,'
      '  ISO3166_1A2,'
      '  STATESHORT,'
      '  PERSONALNR,'
      '  LASTFIRST'
      'FROM V_USERYEARDAYS'
      'WHERE UYEAR = :YEAR  and (USER_ID = :USER_ID or :USER_ID = 0)'
      'ORDER BY LASTFIRST  ')
    Left = 848
    Top = 480
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 2024
      end
      item
        Name = 'USER_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryUserExcelListUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object qryUserExcelListUSERYEAR_ID: TIntegerField
      FieldName = 'USERYEAR_ID'
      Origin = 'USERYEAR_ID'
    end
    object qryUserExcelListUYEAR: TSmallintField
      FieldName = 'UYEAR'
      Origin = 'UYEAR'
    end
    object qryUserExcelListISO3166_1A2: TWideStringField
      FieldName = 'ISO3166_1A2'
      Origin = 'ISO3166_1A2'
      FixedChar = True
      Size = 2
    end
    object qryUserExcelListSTATESHORT: TWideStringField
      FieldName = 'STATESHORT'
      Origin = 'STATESHORT'
      Size = 3
    end
    object qryUserExcelListPERSONALNR: TWideStringField
      FieldName = 'PERSONALNR'
      Origin = 'PERSONALNR'
      Size = 30
    end
    object qryUserExcelListLASTFIRST: TWideStringField
      FieldName = 'LASTFIRST'
      Origin = 'LASTFIRST'
      Size = 202
    end
  end
  object dsUserExcelList: TDataSource
    DataSet = qryUserExcelList
    OnDataChange = dsUserListDataChange
    Left = 960
    Top = 480
  end
end
