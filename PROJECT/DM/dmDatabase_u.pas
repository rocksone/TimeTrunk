// ---------------------------------------------------------------------------------------------------------------------
// UNIT          : GlobalVars_u;
// PURPOSE       : The First Connect intance
// CREATE AUTOR  : Robert Feick
// CO-AUTOR      :
// DATE          : 08.01.2024 Start on the Proyect
// ---------------------------------------------------------------------------------------------------------------------
unit dmDatabase_u;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Phys,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Stan.Param,
  FireDAC.VCLUI.Error,
  FireDAC.VCLUI.Wait,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Stan.StorageJSON,
  FireDAC.DApt,
  System.JSON, IdHTTP, System.DateUtils,System.Variants, Vcl.Dialogs;

type
  TdmDatabase = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDUpdateSQL1: TFDUpdateSQL;
    trsUpd: TFDTransaction;
    FDEventAlerter1: TFDEventAlerter;
    FDError: TFDGUIxErrorDialog;
    FDWait: TFDGUIxWaitCursor;
    FDPhysFB: TFDPhysFBDriverLink;
    mtHolidays: TFDMemTable;
    mtHolidaysID: TAutoIncField;
    mtHolidaysBundesland: TStringField;
    mtHolidaysFeiertag: TStringField;
    mtHolidaysDatum: TDateField;
    mtHolidaysHinweis: TStringField;
    qryHolidays: TFDQuery;
    qryState: TFDQuery;
    qryCountry: TFDQuery;
    qryUser: TFDQuery;
    qryWorkHours: TFDQuery;
    qryWorkHoursDat: TFDQuery;
    FDSState: TFDStoredProc;
    qryHolidaysHOLIDAYS_ID: TFDAutoIncField;
    qryHolidaysHYEAR: TSmallintField;
    qryHolidaysCOUNTRY_ID: TIntegerField;
    qryHolidaysSTATE_ID: TIntegerField;
    qryHolidaysDat: TFDQuery;
    dsHolidays: TDataSource;
    dsHolidaysDat: TDataSource;
    dsCountry: TDataSource;
    qryHolidaysStates: TStringField;
    FDSCheckHolidays: TFDStoredProc;
    qryHolidaysCountry: TStringField;
    qryCountryCOUNTRY_ID: TIntegerField;
    qryCountryISO3166_1A2: TWideStringField;
    qryCountryCOUNTRY: TWideStringField;
    qryCountryLANGUAGE_ID: TIntegerField;
    qryHoliExtras: TFDQuery;
    dsHoliExtras: TDataSource;
    qryHolidaysDatHOLIDAYSDAT_ID: TFDAutoIncField;
    qryHolidaysDatHOLIEXTRAS_ID: TIntegerField;
    qryHolidaysDatHOLIDAYS_ID: TIntegerField;
    qryHolidaysDatHDATE: TDateField;
    qryHolidaysDatHNAME: TWideStringField;
    qryHoliExtrasHOLIEXTRAS_ID: TFDAutoIncField;
    qryHoliExtrasCOUNTRY_ID: TIntegerField;
    qryHoliExtrasSTATE_ID: TIntegerField;
    qryHoliExtrasHDATE: TDateField;
    qryHoliExtrasHNAME: TWideStringField;
    qryWorkHoursWORKINGHOURS_ID: TIntegerField;
    qryWorkHoursCOUNTRY_ID: TIntegerField;
    qryWorkHoursWYEAR: TSmallintField;
    qryWorkHoursDatWORKINGHOURSDAT_ID: TIntegerField;
    qryWorkHoursDatWORKINGHOURS_ID: TIntegerField;
    qryWorkHoursDatDESCRIPTION: TWideStringField;
    qryWorkHoursDatDAY1: TTimeField;
    qryWorkHoursDatDAY2: TTimeField;
    qryWorkHoursDatDAY3: TTimeField;
    qryWorkHoursDatDAY4: TTimeField;
    qryWorkHoursDatDAY5: TTimeField;
    qryWorkHoursDatDAY6: TTimeField;
    qryWorkHoursDatDAY7: TTimeField;
    dsWorkHoursDat: TDataSource;
    dsUserYearDat: TDataSource;
    dsWorkHours: TDataSource;
    qryWorkingGroup: TFDQuery;
    qryUserYearDat: TFDQuery;
    qryUserYear: TFDQuery;
    qryLanguage: TFDQuery;
    dsUserYear: TDataSource;
    dsUser: TDataSource;
    dsWorkingGroup: TDataSource;
    qryWorkingGroupWORKINGGROUP_ID: TFDAutoIncField;
    qryWorkingGroupDESCRIPTION: TWideStringField;
    qryWorkHoursDatWORKINGGROUP_ID: TIntegerField;
    qryUserUSER_ID: TFDAutoIncField;
    qryUserLANGUAGE_ID: TIntegerField;
    qryUserCOUNTRY_ID: TIntegerField;
    qryUserSTATE_ID: TIntegerField;
    qryUserUSERNAME: TWideStringField;
    qryUserUSERPASSWORD: TWideStringField;
    qryUserFIRSTNAME: TWideStringField;
    qryUserLASTNAME: TWideStringField;
    qryUserPERSONALNR: TWideStringField;
    qryUserEMAIL: TWideStringField;
    qryUserACTIVEX: TSmallintField;
    qryUserUSER_CREATE_ID: TWideStringField;
    qryUserUSER_UPDATE_ID: TWideStringField;
    qryUserUSER_CREATE: TSQLTimeStampField;
    qryUserUSER_UPDATE: TSQLTimeStampField;
    qryUserYearUSERYEAR_ID: TFDAutoIncField;
    qryUserYearUSER_ID: TIntegerField;
    qryUserYearUYEAR: TSmallintField;
    qryUserWORKINGGROUP_ID: TIntegerField;
    dsState: TDataSource;
    dsLanguage: TDataSource;
    qryHolidaysExtraList: TFDQuery;
    dsHolidaysExtraList: TDataSource;
    qryUserSelect: TFDQuery;
    dsUserSelect: TDataSource;
    qryWorkHoursDatFROMDATE: TDateField;
    qryUserList: TFDQuery;
    dsUserList: TDataSource;
    qryUserListUSER_ID: TIntegerField;
    qryUserListUYEAR: TSmallintField;
    qryUserListISO3166_1A2: TWideStringField;
    qryUserListSTATESHORT: TWideStringField;
    qryUserListPERSONALNR: TWideStringField;
    qryUserListLASTFIRST: TWideStringField;
    qryUserSelectUSER_ID: TFDAutoIncField;
    qryUserSelectPERSONALNR: TWideStringField;
    qryUserSelectUSERNAME: TWideStringField;
    qryUserSelectFIRSTNAME: TWideStringField;
    qryUserSelectLASTNAME: TWideStringField;
    qryUserSelectACTIVEX: TSmallintField;
    qryExcel: TFDQuery;
    dsExcel: TDataSource;
    qryExcelUSERYEARDAT_ID: TFDAutoIncField;
    qryExcelUSERYEAR_ID: TIntegerField;
    qryExcelUDAY: TDateField;
    qryExcelCOMES1: TTimeField;
    qryExcelGOES1: TTimeField;
    qryExcelCOMES2: TTimeField;
    qryExcelGOES2: TTimeField;
    qryExcelPAUSE: TTimeField;
    qryExcelCODE: TSmallintField;
    qryExcelNOTE: TWideStringField;
    qryExcelDAYNAME: TStringField;
    FDS_CreateYearDate: TFDStoredProc;
    qryWorkingHourdList: TFDQuery;
    dsWorkingHourdList: TDataSource;
    qryHolidaysDatList: TFDQuery;
    dsHolidaysDatList: TDataSource;
    qryWorkingHourdListWORKINGHOURSDAT_ID: TFDAutoIncField;
    qryWorkingHourdListWORKINGHOURS_ID: TIntegerField;
    qryWorkingHourdListWORKINGGROUP_ID: TIntegerField;
    qryWorkingHourdListDAY1: TTimeField;
    qryWorkingHourdListDAY2: TTimeField;
    qryWorkingHourdListDAY3: TTimeField;
    qryWorkingHourdListDAY4: TTimeField;
    qryWorkingHourdListDAY5: TTimeField;
    qryWorkingHourdListDAY6: TTimeField;
    qryWorkingHourdListDAY7: TTimeField;
    qryWorkingHourdListFROMDATE: TDateField;
    qryWorkingHourdListTODATE: TDateField;
    qryWorkingHourdListDESCRIPTION: TWideStringField;
    qryUserYearDatUSERYEARDAT_ID: TFDAutoIncField;
    qryUserYearDatUSERYEAR_ID: TIntegerField;
    qryUserYearDatUDAY: TDateField;
    qryUserYearDatCOMES1: TTimeField;
    qryUserYearDatGOES1: TTimeField;
    qryUserYearDatCOMES2: TTimeField;
    qryUserYearDatGOES2: TTimeField;
    qryUserYearDatPAUSE: TTimeField;
    qryUserYearDatCODE: TSmallintField;
    qryUserYearDatNOTE: TWideStringField;
    qryUserSelectISO3166_1A2: TWideStringField;
    qryUserSelectSTATE: TWideStringField;
    FDSgetIDs: TFDStoredProc;
    qryUserListUSERYEAR_ID: TIntegerField;
    qryHolidaysDatListHOLIDAYSDAT_ID: TFDAutoIncField;
    qryHolidaysDatListHOLIEXTRAS_ID: TIntegerField;
    qryHolidaysDatListHOLIDAYS_ID: TIntegerField;
    qryHolidaysDatListHDATE: TDateField;
    qryHolidaysDatListHNAME: TWideStringField;
    FDSADDHolidaysDat: TFDStoredProc;
    qryExcelHOLIDAY_ID: TIntegerField;
    qryExcelHOLIDAY: TWideStringField;
    qryUserYearDatHOLIDAY: TWideStringField;
    qryHolidaysDatFCOST: TCurrencyField;
    qryHoliExtrasFCOST: TCurrencyField;
    qryHolidaysDatListFCOST: TCurrencyField;
    qryExcelFCOST: TCurrencyField;
    FDSADDHolidayExtra: TFDStoredProc;
    qryHolidaysExtraListHOLIEXTRAS_ID: TFDAutoIncField;
    qryHolidaysExtraListCOUNTRY_ID: TIntegerField;
    qryHolidaysExtraListSTATE_ID: TIntegerField;
    qryHolidaysExtraListHDATE: TDateField;
    qryHolidaysExtraListHNAME: TWideStringField;
    qryHolidaysExtraListFCOST: TCurrencyField;
    qryUserExcelList: TFDQuery;
    dsUserExcelList: TDataSource;
    qryUserExcelListUSER_ID: TIntegerField;
    qryUserExcelListUSERYEAR_ID: TIntegerField;
    qryUserExcelListUYEAR: TSmallintField;
    qryUserExcelListISO3166_1A2: TWideStringField;
    qryUserExcelListSTATESHORT: TWideStringField;
    qryUserExcelListPERSONALNR: TWideStringField;
    qryUserExcelListLASTFIRST: TWideStringField;
    qryExcelcalcIsTime: TIntegerField;
    qryExcelcalcHourDiff: TIntegerField;
    qryExcelUHOURS: TIntegerField;
    qryUserYearDatUHOURS: TIntegerField;
    qryExcelcalcHourCount: TIntegerField;
    qryUserUSTART: TDateField;
    qryUserVACATIONDAYS: TSmallintField;
    qryUserYearLASTYEARMINUTES: TIntegerField;
    qryUserYearVACATIONDAYSLASTYEAR: TSmallintField;
    qryUserYearVACATIONDAYS: TSmallintField;
    qryExcelDAYCODE: TSmallintField;
    qryUserYearDatDAYCODE: TSmallintField;
    qryExcelDayType: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsUserListDataChange(Sender: TObject; Field: TField);
    procedure qryExcelCalcFields(DataSet: TDataSet);
    procedure getTextInt2HoursPosiNega(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure getTextInt2Hours(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure getTextInt2HoursPosiNegaZero(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure getTextInt2HoursTime(Sender: TField; var Text: string;
        DisplayText: Boolean);
  private

    procedure SetDriverLink(i: integer);
    procedure SetConnect(TestMode: Boolean = False);

    procedure LoadDataIntoMemTable(Year, Country: integer; JSONResponse: TJSONObject);
    procedure Holiday(Year, Country: integer);
    // procedure getTextInt2Time(Sender: TField; var Text: string; DisplayText: Boolean);
    function Int2Time(F: TField; Positiv: Boolean = True; ShowZero: Boolean = False;  FCost:Currency =0): String;

    { Private-Deklarationen }
  public

    monatWert: integer;
    procedure DuplicateCurrentRecord(aDataSet: TDataSet);
    procedure ClearTaggedDbFields(ds: TDataSet; mask: integer);
    procedure ClearDbFields(ds: TDataSet; feldliste: array of string);
    procedure getHollydays(Year, Country: integer; State: String = '');
    function CreateYearDates(User_ID, Year: integer): integer;
    { Public-Deklarationen }
  end;

var
  dmDatabase: TdmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses

  xGlobalVars_u,
  xrsFiles_u, admin, User_u;

{$R *.dfm}

procedure TdmDatabase.DataModuleCreate(Sender: TObject);
var
  driverLinkNr: integer;
begin

  FDConnection.Connected := False;
  APP.DIR_AppDir := GetApplicationDirectory();
  // APP.DB_Database := ExtractFilePath(ExcludeTrailingPathDelimiter(APP.DIR_AppDir)) + 'DB' + PathDelim + cDBFilename;
  //
  // AUS KONFIG LADEN WELCHER DRIVER
  // 0 MySQL
  driverLinkNr := 1;
  SetDriverLink(driverLinkNr);
  try
    SetConnect();
    // FDConnection.Connected := True;
  except
    on E: EFDDBEngineException do
    begin
      APP.SESS_Exit := True;
      // message Terminate
      // Halt;
    end;
  end;

end;

procedure TdmDatabase.SetDriverLink(i: integer);
begin
  case i of
    0: // MySQL
      begin
        // FDPhysMySQL.Release;
        // FDPhysMySQL.VendorHome := APP.DIR_AppDir;
        // // FDPhysMySQL.VendorLib := 'libmysql.dll';
        // FDPhysMySQL.VendorLib := 'libmariadb.dll';
        // APP.DB_DriverLink := 'MySQL'
      end;
    1: // FIREBIRD
      begin
        FDPhysFB.Release;
        FDPhysFB.VendorHome := APP.DIR_AppDir;

        FDPhysFB.VendorLib := 'fbclient.dll';
        APP.DB_DriverLink := 'FB'
      end;

  end;
end;

procedure TdmDatabase.SetConnect(TestMode: Boolean = False);
// var
// dir: string;
begin
  FDConnection.Params.Clear;
  FDConnection.Params.Add('ApplicationName=' + cAppName);
  FDConnection.Params.Add('User_Name=' + APP.DB_User);
  FDConnection.Params.Add('Password=' + APP.DB_Password);
  FDConnection.Params.Add('OSAuthent=' + 'No');
  FDConnection.Params.Add('CharacterSet=' + cDBCharacterSet);
  FDConnection.Params.Add('IBAdvanced=' + '1');
  FDConnection.Params.Add('ExtendedMetadata=' + 'True');
  FDConnection.Params.Add('Database=' + APP.DIR_AppDir + 'DB' + PathDelim + cDBFilename);
  FDConnection.Params.Add('DriverID=' + APP.DB_DriverLink);
  FDConnection.Params.Add('Port=' + APP.DB_Port);
  FDConnection.Params.Add('PageSize=' + '16384');
  FDConnection.Params.Add('Server=' + APP.DB_Server);
  FDConnection.Params.Add('Protocol=' + APP.DB_Protocol);
  FDConnection.Params.Add('GUIDEndian=' + 'Big');
end;

procedure TdmDatabase.getHollydays(Year, Country: integer; State: String = '');
var
  URL: string;
  IdHTTP1: TIdHTTP;
  JSONResponse: TJSONObject;
begin
  IdHTTP1 := TIdHTTP.Create(nil);
  try
    if State.IsEmpty then
      URL := 'https://feiertage-api.de/api/?jahr=' + IntToStr(Year)
    else
      URL := 'https://feiertage-api.de/api/?jahr=' + IntToStr(Year) + '&nur_land=' + State;
    JSONResponse := TJSONObject.ParseJSONValue(IdHTTP1.Get(URL)) as TJSONObject;
    try
      if Assigned(JSONResponse) then
        LoadDataIntoMemTable(Year, Country, JSONResponse);
    finally
      JSONResponse.Free;
    end;
  finally
    IdHTTP1.Free;
  end;
end;

procedure TdmDatabase.LoadDataIntoMemTable(Year, Country: integer; JSONResponse: TJSONObject);
var
  BundeslandPair, FeiertagPair: TJSONPair;
  Bundesland, FeiertagName, Hinweis: string;
  FeiertagObj: TJSONObject;
  Datum: Tdatetime;
begin
  mtHolidays.Close;
  mtHolidays.Open;
  for BundeslandPair in JSONResponse do
  begin
    Bundesland := BundeslandPair.JsonString.Value;

    for FeiertagPair in (BundeslandPair.JsonValue as TJSONObject) do
    begin
      if Bundesland <> 'NATIONAL' then
      begin
        FeiertagName := FeiertagPair.JsonString.Value;
        FeiertagObj := FeiertagPair.JsonValue as TJSONObject;
        Datum := ISO8601ToDate(FeiertagObj.GetValue<string>('datum'));
        Hinweis := FeiertagObj.GetValue<string>('hinweis');
        mtHolidays.Append;
        mtHolidays.FieldByName('Bundesland').AsString := UpperCase(Bundesland);
        mtHolidays.FieldByName('Feiertag').AsString := FeiertagName;
        mtHolidays.FieldByName('Datum').AsDateTime := (Datum);
        mtHolidays.FieldByName('Hinweis').AsString := Hinweis;
        mtHolidays.Post;
      end;
    end;
  end;
  Holiday(Year, Country);
end;

procedure TdmDatabase.Holiday(Year, Country: integer);
var
  BL: String;
  BL_ID: integer;

begin
  qryHolidays.Open;
  qryHolidaysDat.Open;
  mtHolidays.First;

  // INSERT IN DB
  while not mtHolidays.EOF do
    try
      qryHolidays.DisableControls;
      qryHolidaysDat.DisableControls;
      if (BL <> mtHolidaysBundesland.AsString) then
      begin
        BL := mtHolidaysBundesland.AsString;
        FDSState.Prepare;
        FDSState.Params[0].AsInteger := Country;
        FDSState.Params[1].AsString := BL;
        FDSState.OpenOrExecute;
        BL_ID := FDSState.Fields[0].AsInteger;
        FDSState.Close;
        // Insert Holidays
        qryHolidays.Append;
        qryHolidaysHYEAR.AsInteger := Year;
        qryHolidaysCOUNTRY_ID.AsInteger := Country; // LAND DE = 57
        qryHolidaysSTATE_ID.AsInteger := BL_ID;
        qryHolidays.Post;
        //
      end;
      // Insert HolidaysDat
      qryHolidaysDat.Append;
      qryHolidaysDatHOLIDAYS_ID.AsInteger := qryHolidaysHOLIDAYS_ID.AsInteger;
      qryHolidaysDatHDATE.AsDateTime := mtHolidaysDatum.AsDateTime;
      qryHolidaysDatHNAME.AsString := mtHolidaysFeiertag.AsString;
      qryHolidaysDatFCOST.AsFloat := 0;
      qryHolidaysDat.Post;
      mtHolidays.Next
    finally
      qryHolidays.EnableControls;
      qryHolidaysDat.EnableControls;
    end;
end;

procedure TdmDatabase.ClearTaggedDbFields(ds: TDataSet; mask: integer);
var
  i: integer;
  F: TField;
begin
  for i := 0 to ds.Fields.Count - 1 do
  begin
    F := ds.Fields[i];
    if (F.Tag and mask) <> 0 then
      F.Clear;
  end;
end;

procedure TdmDatabase.ClearDbFields(ds: TDataSet; feldliste: array of string);
var
  i: integer;
  F: TField;
begin
  for i := Low(feldliste) to High(feldliste) do
  begin
    F := ds.FindField(feldliste[i]);
    if Assigned(F) then
      F.Clear; // Set Field to NULL
  end;
end;

procedure TdmDatabase.DuplicateCurrentRecord(aDataSet: TDataSet);
var
  Data: array of variant;
  aRecord: array of TVarRec;
  i: integer;
  max: integer;
begin
  max := aDataSet.Fields.Count - 1;
  // set the lenghth of the arecord array to be the same as the number of
  // elements in the data array
  SetLength(aRecord, max + 1);
  SetLength(Data, max + 1);

  // set the variant type pointers to the data array
  for i := 0 to max do
  begin
    aRecord[i].VType := vtVariant;
    aRecord[i].VVariant := @Data[i];
  end;

  // Copy the Record to the Array
  for i := 1 to max do
    Data[i] := aDataSet.Fields[i].Value;

  aDataSet.Append;
  aDataSet.SetFields(aRecord);
end;

function TdmDatabase.Int2Time(F: TField;  Positiv: Boolean = True; ShowZero: Boolean = False; FCOST:Currency =0): String;
var
  Stunden, RestMinuten, Hours : integer;
begin
  Hours := F.AsInteger;
  if (Hours = 0) and not ShowZero then
    Result := ''
  else
  begin
     if FCOST > 0 then
      Hours := F.AsInteger + Trunc(F.AsInteger *  -abs(FCOST));
    Stunden := Hours div 60;
    RestMinuten := Hours mod 60;

    if not Positiv Then
      Result := Format('%.2d:%.2d', [Stunden, abs(RestMinuten)])
    else
    begin
      if Hours > 0 then

        Result := Format('+%.2d:%.2d', [Stunden, abs(RestMinuten)])
      else
        Result := Format('%.2d:%.2d', [Stunden, abs(RestMinuten)]);
    end;
  end;

end;

procedure TdmDatabase.getTextInt2HoursPosiNega(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Int2Time(Sender, True);
   // Text := Int2Time(Sender, True,False,  qryExcelFCOST.AsCurrency);
end;

procedure TdmDatabase.qryExcelCalcFields(DataSet: TDataSet);
resourcestring
  rs_Feiertag       = 'Feiertag: ';
  rs_FeiertagHalb   = 'Feiertag  ½ Tag: ';
  rs_Arbeitstag     = 'Arbeitstag';
  rs_FreierTag	    = 'Freier Tag';
  rs_Wochenende	    = 'Wochenend';
  rs_Inaktiv        = 'Inaktiver Benutzer';

function VarToIntDef(const V: Variant; const ADefault: Integer = 0): Integer;
begin
  if V = NULL then
    Result := ADefault
  else
    Result := V;
end;

  function ConvertTime2Min(Pause: Tdatetime): integer;
  var
    Hour, Min, Sec, MSec: Word;
    MinComes, MinGoes: integer;
  begin
    DecodeTime(Pause, Hour, Min, Sec, MSec);
    Result := Hour * 60 + Min;
  end;

  function ConvertDiffTime2Min(Comes, Goes: Tdatetime): integer;
  var
    K1, G1, Diff: Tdatetime;
    Hour, Min, Sec, MSec: Word;
    MinComes, MinGoes: integer;
  begin
    DecodeTime(Comes, Hour, Min, Sec, MSec);
    MinComes := Hour * 60 + Min;

    DecodeTime(Goes, Hour, Min, Sec, MSec);
    MinGoes := Hour * 60 + Min;

    Result := MinGoes - MinComes;
  end;

var
  Hours1, Hours2, Pause, SollHours: integer;
  // Diff: Tdatetime;
  // DT: Tdatetime;
  i: integer;
begin
  Hours1 := 0;
  Hours2 := 0;
  Pause := 0;
  SollHours := 0;

  if qryExcelDAYCODE.OldValue <> qryExcelDAYCODE.Value then
  case qryExcelDAYCODE.AsInteger of
   1:  qryExcelDayType.AsString := rs_Feiertag +  qryExcelHOLIDAY.AsString;
   2:  qryExcelDayType.AsString := rs_FeiertagHalb +  qryExcelHOLIDAY.AsString;
   3:  qryExcelDayType.AsString := rs_Arbeitstag;
   4:  qryExcelDayType.AsString := rs_FreierTag;
   16: qryExcelDayType.AsString := rs_Inaktiv;
  end;

  //
  // DAY NAME
  qryExcelDAYNAME.AsString := FormatDateTime('dddd', qryExcelUDAY.AsDateTime); // DayOfWeek(qryExcelUDAY.AsDateTime);
  //
  // VALIDATE PAUSE AND CONVERT TIME 2 MINUTES
  if not qryExcelPAUSE.IsNull then
    Pause := ConvertTime2Min(qryExcelPAUSE.AsDateTime);
  //
  // VALIDATE COMES, GOES AND CONVERT TIME 2 MINUTES
  if not qryExcelCOMES1.IsNull and not qryExcelCOMES1.IsNull then
  begin
    Hours1 := ConvertDiffTime2Min(qryExcelCOMES1.AsDateTime, qryExcelGOES1.AsDateTime);
    qryExcelcalcIsTime.AsInteger := Hours1 + Hours2 - Pause;
  end;
  if not qryExcelCOMES2.IsNull and not qryExcelCOMES2.IsNull then
  begin
    Hours2 := ConvertDiffTime2Min(qryExcelCOMES2.AsDateTime, qryExcelGOES2.AsDateTime);
    qryExcelcalcIsTime.AsInteger := Hours1 + Hours2 - Pause;

  end;
  //
  // CALC DIFFERENCE
  // SollHours := ConvertTime2Min(qryExcelUHOURS.AsDateTime);
  if qryExcelFCOST.AsCurrency > 0 then
  qryExcelcalcHourDiff.AsInteger := (qryExcelcalcIsTime.AsInteger -  qryExcelUHOURS.AsInteger - Trunc(qryExcelUHOURS.AsInteger * -abs(qryExcelFCOST.AsCurrency)))

  else
  qryExcelcalcHourDiff.AsInteger := (qryExcelcalcIsTime.AsInteger - qryExcelUHOURS.AsInteger);

  //
  //-------------------------------------------------------------------------------------------
  i := DayOf(qryExcelUDAY.AsDateTime);
  if i = 1 then
  begin
    qryExcelcalcHourCount.AsInteger := VarToIntDef(APP.ULASTYEARMINUTES) + VarToIntDef(APP.ULASTMONTH) +qryExcelcalcHourDiff.AsInteger;
    APP.UCumulativTime := qryExcelcalcHourCount.AsInteger;
  end
  else
  begin
    qryExcelcalcHourCount.AsInteger := qryExcelcalcHourDiff.AsInteger + APP.UCumulativTime  ;
    APP.UCumulativTime := qryExcelcalcHourCount.AsInteger;
  end;
end;

function TdmDatabase.CreateYearDates(User_ID, Year: integer): integer;
begin
  dmDatabase.FDS_CreateYearDate.Prepare;
  dmDatabase.FDS_CreateYearDate.Params[0].AsInteger := User_ID;
  dmDatabase.FDS_CreateYearDate.Params[1].AsInteger := Year;
  dmDatabase.FDS_CreateYearDate.OpenOrExecute;
  Result := dmDatabase.FDS_CreateYearDate.Fields[0].AsInteger;
  dmDatabase.FDS_CreateYearDate.Close;
end;

procedure TdmDatabase.dsUserListDataChange(Sender: TObject; Field: TField);
begin
 // frmAdmin.ChageExcelUser;
  dmDatabase.qryexcel.Close;
  dmDatabase.qryexcel.Prepare;
  dmDatabase.qryexcel.Params[0].AsInteger := dmDatabase.qryUserExcelListUSERYEAR_ID.AsInteger;
  dmDatabase.qryexcel.Params[1].AsInteger := APP.UMONTH;

  dmDatabase.qryexcel.open;
  APP.USERYEAR_ID := dmDatabase.qryUserExcelListUSERYEAR_ID.AsInteger;
  APP.USER_ID  := dmDatabase.qryUserExcelListUSER_ID.AsInteger;
  APP.UYEAR  := dmDatabase.qryUserExcelListUYear.AsInteger;
  APP.UVACATIONDAYSLASTYEAR := NULL;
  APP.ULASTYEARMINUTES := NULL;
  APP.UCumulativTime := 0;
    if Assigned(frmAdmin.aUserForm) then
  frmAdmin.aUserForm.ChangeMonth;
end;

procedure TdmDatabase.getTextInt2Hours(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Int2Time(Sender, False,False,  qryExcelFCOST.AsCurrency);
end;

procedure TdmDatabase.getTextInt2HoursPosiNegaZero(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if qryExcel.State in [dsEdit, dsInsert] then
    Text := 'Wait'
  else
    Text := Int2Time(Sender, True, True);
end;

procedure TdmDatabase.getTextInt2HoursTime(Sender: TField; var Text:
    string; DisplayText: Boolean);
begin
  Text := Int2Time(Sender, False);
end;

end.
