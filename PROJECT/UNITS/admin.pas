unit admin;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  System.DateUtils,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Menus,
  Vcl.ActnList,
  cxClasses,
  dxBar,
  dxBarBuiltInMenu,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxGeometry,
  dxFramedControl,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  cxDBData,
  cxGridLevel,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  cxSplitter,
  dxPanel,
  cxPC,
  cxContainer,
  dxWheelPicker,
  dxNumericWheelPicker,
  dxDateTimeWheelPicker,
  cxButtons,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.Stan.StorageJSON,
  FireDAC.Comp.Client,
  cxSpinEdit,
  cxCurrencyEdit,
  cxDBLookupComboBox,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  dxLayoutContainer,
  cxGridViewLayoutContainer,
  cxGridLayoutView,
  cxGridDBLayoutView,
  cxGridCustomLayoutView,
  cxGridInplaceEditForm,
  cxGridCustomPopupMenu,
  cxGridPopupMenu,
  JvComponentBase,
  JvEnterTab,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  dxScreenTip,
  dxCustomHint,
  cxHint,
  cxCheckBox,
  cxMemo,
  User_u,
  cxCalendar;

const
  UM_MYMESSAGE = WM_USER + 100;

type
  TcxGridDBTableViewAccess = class(TcxGridDBTableView);

  TfrmAdmin = class(TForm)
    bm: TdxBarManager;
    bmBar1: TdxBar;
    PC: TcxPageControl;
    tsExcel: TcxTabSheet;
    tsUser: TcxTabSheet;
    tsReport: TcxTabSheet;
    tsHoliExtas: TcxTabSheet;
    tsHollydays: TcxTabSheet;
    tsConfig: TcxTabSheet;
    pnlLeft: TdxPanel;
    cxSplitter1: TcxSplitter;
    TVHoliStatesF: TcxGridDBTableView;
    LVHoliStatesF: TcxGridLevel;
    GDHoliStatesF: TcxGrid;
    wpHoliday: TdxDateTimeWheelPicker;
    pnlLeftTop: TdxPanel;
    cxButton2: TcxButton;
    act: TActionList;
    actAddHollidays: TAction;
    GDStatesF: TcxGrid;
    TVStatesF: TcxGridDBTableView;
    LVStatesF: TcxGridLevel;
    dsMtHollydays: TDataSource;
    dsCountry: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    TVStatesFHOLIDAYS_ID: TcxGridDBColumn;
    TVStatesFHYEAR: TcxGridDBColumn;
    TVStatesFCOUNTRY_ID: TcxGridDBColumn;
    TVStatesFSTATE_ID: TcxGridDBColumn;
    TVHoliStatesFHOLIDAYSDAT_ID: TcxGridDBColumn;
    TVHoliStatesFHOLIDAYS_ID: TcxGridDBColumn;
    TVHoliStatesFHDATE: TcxGridDBColumn;
    TVHoliStatesFHNAME: TcxGridDBColumn;
    TVStatesFStates: TcxGridDBColumn;
    TVStatesFCountry: TcxGridDBColumn;
    TVHoliStatesFHCOST: TcxGridDBColumn;
    pnlLeftFE: TdxPanel;
    dxPanel2: TdxPanel;
    dxDateTimeWheelPicker1: TdxDateTimeWheelPicker;
    cxButton1: TcxButton;
    GDCountryFE: TcxGrid;
    TVCountryFE: TcxGridDBTableView;
    LVCountryFE: TcxGridLevel;
    GDHoliExtra: TcxGrid;
    TVHoliExtra: TcxGridDBTableView;
    LVHoliExtra: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    dxPanel1: TdxPanel;
    pnlTVHoliExtraNav: TdxPanel;
    TVCountryFECOUNTRY_ID: TcxGridDBColumn;
    TVCountryFECOUNTRY: TcxGridDBColumn;
    TVHoliExtraHOLIEXTRAS_ID: TcxGridDBColumn;
    TVHoliExtraCOUNTRY_ID: TcxGridDBColumn;
    TVHoliExtraSTATE_ID: TcxGridDBColumn;
    TVHoliExtraHDATE: TcxGridDBColumn;
    TVHoliExtraHNAME: TcxGridDBColumn;
    pnlUser: TdxPanel;
    dxPanel5: TdxPanel;
    btnCopyUser: TcxButton;
    GDUser: TcxGrid;
    TVUser: TcxGridDBTableView;
    LVUser: TcxGridLevel;
    tsArbeitzeit: TcxTabSheet;
    dxPanel6: TdxPanel;
    dxPanel7: TdxPanel;
    cxButton4: TcxButton;
    GDWorking: TcxGrid;
    TVWorking: TcxGridDBTableView;
    LVWorking: TcxGridLevel;
    dxPanel8: TdxPanel;
    dxPanel9: TdxPanel;
    GDWorkingDat: TcxGrid;
    TVWorkingDat: TcxGridDBTableView;
    LVWorkingDat: TcxGridLevel;
    TVWorkingWORKINGHOURS_ID: TcxGridDBColumn;
    TVWorkingCOUNTRY_ID: TcxGridDBColumn;
    TVWorkingDatWORKINGHOURSDAT_ID: TcxGridDBColumn;
    TVWorkingDatWORKINGHOURS_ID: TcxGridDBColumn;
    TVWorkingDatDESCRIPTION: TcxGridDBColumn;
    TVWorkingDatDAY1: TcxGridDBColumn;
    TVWorkingDatDAY2: TcxGridDBColumn;
    TVWorkingDatDAY3: TcxGridDBColumn;
    TVWorkingDatDAY4: TcxGridDBColumn;
    TVWorkingDatDAY5: TcxGridDBColumn;
    TVWorkingDatDAY6: TcxGridDBColumn;
    TVWorkingDatDAY7: TcxGridDBColumn;
    TVWorkingDatWORKINGGROUP_ID: TcxGridDBColumn;
    wpWT: TdxDateTimeWheelPicker;
    actAddWorkingTime: TAction;
    cbLanguageWT: TcxLookupComboBox;
    pnlLeftExcel: TdxPanel;
    dxPanel11: TdxPanel;
    wpUserExcel: TdxDateTimeWheelPicker;
    cxButton5: TcxButton;
    GDUserExcelList: TcxGrid;
    TVUserExcelList: TcxGridDBTableView;
    LVUserExcelList: TcxGridLevel;
    TVUserUSER_ID: TcxGridDBColumn;
    TVUserLANGUAGE_ID: TcxGridDBColumn;
    TVUserCOUNTRY_ID: TcxGridDBColumn;
    TVUserSTATE_ID: TcxGridDBColumn;
    TVUserUSERNAME: TcxGridDBColumn;
    TVUserUSERPASSWORD: TcxGridDBColumn;
    TVUserFIRSTNAME: TcxGridDBColumn;
    TVUserLASTNAME: TcxGridDBColumn;
    TVUserPERSONALNR: TcxGridDBColumn;
    TVUserEMAIL: TcxGridDBColumn;
    TVUserACTIVEX: TcxGridDBColumn;
    TVUserUSER_CREATE_ID: TcxGridDBColumn;
    TVUserUSER_UPDATE_ID: TcxGridDBColumn;
    TVUserUSER_CREATE: TcxGridDBColumn;
    TVUserUSER_UPDATE: TcxGridDBColumn;
    TVUserWORKINGGROUP_ID: TcxGridDBColumn;
    btnAddUser: TcxButton;
    actAddUser: TAction;
    actUserCopy: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    TVWorkingDatFROMDATE: TcxGridDBColumn;
    TVUserExcelListUSER_ID: TcxGridDBColumn;
    TVUserExcelListISO3166_1A2: TcxGridDBColumn;
    TVUserExcelListSTATESHORT: TcxGridDBColumn;
    TVUserExcelListPERSONALNR: TcxGridDBColumn;
    TVUserExcelListLASTFIRST: TcxGridDBColumn;
    tsCreateUserYear: TcxTabSheet;
    pnlTVUserList: TdxPanel;
    dxPanel12: TdxPanel;
    wpUserYearCreate: TdxDateTimeWheelPicker;
    cxButton3: TcxButton;
    GDUserList: TcxGrid;
    TVUserList: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    LVUserList: TcxGridLevel;
    pnlTVUserSelet: TdxPanel;
    dxPanel15: TdxPanel;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    GDUserSelect: TcxGrid;
    TVUserSelect: TcxGridDBTableView;
    TVUserSelectRootGroup: TcxGridInplaceEditFormGroup;
    LVUserSelect: TcxGridLevel;
    TVUserSelectUSER_ID: TcxGridDBColumn;
    TVUserSelectPERSONALNR: TcxGridDBColumn;
    TVUserSelectUSERNAME: TcxGridDBColumn;
    TVUserSelectFIRSTNAME: TcxGridDBColumn;
    TVUserSelectLASTNAME: TcxGridDBColumn;
    TVUserSelectACTIVEX: TcxGridDBColumn;
    actAddUserYear: TAction;
    actAddAllUserYear: TAction;
    TVUserSelectISO3166_1A2: TcxGridDBColumn;
    TVUserSelectSTATESHORT: TcxGridDBColumn;
    dxPanel18: TdxPanel;
    dxPanel19: TdxPanel;
    cxSplitter3: TcxSplitter;
    cxSplitter4: TcxSplitter;
    TVHoliExtraFCOST: TcxGridDBColumn;
    cxTabSheet1: TcxTabSheet;
    cxMemo1: TcxMemo;
    Label1: TLabel;
    TVUserUSTART: TcxGridDBColumn;
    TVUserVACATIONDAYS: TcxGridDBColumn;
    TVUserExcelListUSERYEAR_ID: TcxGridDBColumn;
    TVUserExcelListUYEAR: TcxGridDBColumn;
    dxBarButton3: TdxBarButton;
    procedure actAddHollidaysExecute(Sender: TObject);
    procedure actAddUserExecute(Sender: TObject);
    procedure actAddUserYearExecute(Sender: TObject);
    procedure actAddWorkingTimeExecute(Sender: TObject);
    procedure actUserCopyExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure tsArbeitzeitShow(Sender: TObject);
    procedure tsHoliExtasShow(Sender: TObject);
    procedure wpHolidayPropertiesChange(Sender: TObject);
    procedure wpWTPropertiesChange(Sender: TObject);
    procedure wpUserExcelPropertiesChange(Sender: TObject);
    procedure wpUserYearCreatePropertiesChange(Sender: TObject);

    procedure tsCreateUserYearShow(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure tsExcelShow(Sender: TObject);
  private
    procedure ADDWorkingHours(VUSERYEAR_ID, WORKINGHOURS_ID, WORKINGGROUP_ID: Integer; VUSTART: Tdate);
    procedure AddHolidays(VUSERYEAR_ID, HOLIDAYS_ID, VCOUNTRY_ID, Year: Integer);
    procedure CreateExcel;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    aUserForm: TfrmUser;
    procedure ChageExcelUser;
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses
  dmDatabase_u, dmStyle_u, main_u, xGlobalVars_u;

{$R *.dfm}

procedure TfrmAdmin.FormCreate(Sender: TObject);
begin
  if wpWT.EditValue = null then
    wpWT.EditValue := now;
  if wpHoliday.EditValue = null then
    wpHoliday.EditValue := now;

  if wpUserYearCreate.EditValue = null then
    wpUserYearCreate.EditValue := Date;

  dmDatabase.qryUser.open;
  dmDatabase.qryWorkingGroup.open;
  dmDatabase.qryCountry.open();
  dmDatabase.qryState.open;
  dmDatabase.qryLanguage.open;
  APP.IsAdmin := True;
  CreateExcel;
end;

// -----------------------------------------------------------------------------
// ACTIONEN
// -----------------------------------------------------------------------------
procedure TfrmAdmin.actAddHollidaysExecute(Sender: TObject);
var
  // Count,
  Year: Integer;
begin
  Year := FormatDateTime('yyyy', wpHoliday.EditValue).ToInteger;
  dmDatabase.FDSCheckHolidays.Prepare;
  dmDatabase.FDSCheckHolidays.Params[0].AsInteger := Year;
  dmDatabase.FDSCheckHolidays.OpenOrExecute;
  dmDatabase.FDSCheckHolidays.Close;
  dmDatabase.getHollydays(Year, APP.SYS_COUNTRYHOL);
end;

procedure TfrmAdmin.actAddUserExecute(Sender: TObject);
begin
  TVUser.DataController.Append;
  if TVUser.Controller.FocusedRow is TcxGridDataRow then
    TcxGridDataRow(TVUser.Controller.FocusedRow).EditFormVisible := True;
end;

procedure TfrmAdmin.actAddWorkingTimeExecute(Sender: TObject);
begin
  dmDatabase.qryWorkHours.Append;
  dmDatabase.qryWorkHoursCOUNTRY_ID.AsInteger := cbLanguageWT.EditValue;
  dmDatabase.qryWorkHoursWYEAR.AsInteger := FormatDateTime('yyyy', wpWT.EditValue).ToInteger;
  dmDatabase.qryWorkHours.post;
end;

procedure TfrmAdmin.actUserCopyExecute(Sender: TObject);
begin
  dmDatabase.DuplicateCurrentRecord(dmDatabase.qryUser);
  dmDatabase.ClearDbFields(dmDatabase.qryUser, ['USERNAME', 'USERPASSWORD', 'FIRSTNAME', 'LASTNAME', 'PERSONALNR', 'EMAIL', 'USTART','VACATIONDAYS']);
  if TVUser.Controller.FocusedRow is TcxGridDataRow then
    TcxGridDataRow(TVUser.Controller.FocusedRow).EditFormVisible := True;
end;

procedure TfrmAdmin.actAddUserYearExecute(Sender: TObject);
var
  Year, USER_ID, VUSERYEAR_ID, VSTATE_ID, VWORKINGGROUP_ID, VCOUNTRY_ID, VWORKINGHOURS_ID, VHOLIDAYS_ID: Integer;
  VUSTART: Tdate; // User Start To Work
begin
  USER_ID := dmDatabase.qryUserSelectUSER_ID.AsInteger;
  Year := StrToInt(FormatDateTime('yyyy', wpUserYearCreate.EditValue));
  // CREATE YEARDAYS ------------------------------------------------------------
  dmDatabase.qryUserYear.open;
  VUSERYEAR_ID := dmDatabase.CreateYearDates(USER_ID, Year); // P_INS_1USERYEARDAYS
  dmDatabase.qryUserList.Refresh;
  dmDatabase.qryUserSelect.Refresh;

  // GET IDS
  dmDatabase.FDSgetIDs.Prepare;
  dmDatabase.FDSgetIDs.Params[0].AsInteger := USER_ID;
  dmDatabase.FDSgetIDs.Params[1].AsInteger := Year;
  dmDatabase.FDSgetIDs.OpenOrExecute;

  VUSERYEAR_ID := dmDatabase.FDSgetIDs.Fields[0].AsInteger;
  VSTATE_ID := dmDatabase.FDSgetIDs.Fields[1].AsInteger;
  VWORKINGGROUP_ID := dmDatabase.FDSgetIDs.Fields[2].AsInteger;
  VCOUNTRY_ID := dmDatabase.FDSgetIDs.Fields[3].AsInteger;
  VWORKINGHOURS_ID := dmDatabase.FDSgetIDs.Fields[4].AsInteger;
  VUSTART := dmDatabase.FDSgetIDs.Fields[5].AsDateTime; // User Start To Work
  VHOLIDAYS_ID := dmDatabase.FDSgetIDs.Fields[6].AsInteger;
  dmDatabase.FDSgetIDs.Close;

  // ADD WorkingsHours 365 /366 Days
  ADDWorkingHours(VUSERYEAR_ID, VWORKINGHOURS_ID, VWORKINGGROUP_ID, VUSTART);
  AddHolidays(VUSERYEAR_ID, VHOLIDAYS_ID, VCOUNTRY_ID, Year);
end;

procedure TfrmAdmin.ADDWorkingHours(VUSERYEAR_ID, WORKINGHOURS_ID, WORKINGGROUP_ID: Integer; VUSTART: Tdate);
  function ConvertTime2Min(Stunden: Tdatetime): Integer;
  var
    Hour, Min, Sec, MSec: Word;
    MinComes, MinGoes: Integer;
  begin
    DecodeTime(Stunden, Hour, Min, Sec, MSec);
    Result := Hour * 60 + Min;
  end;

var
  UDAY, FromDate, ToDate: Tdatetime;
  i: Integer;
  v: Variant;
begin
  // SCHREIBEN
  dmDatabase.qryWorkingHourdList.Close;
  dmDatabase.qryWorkingHourdList.Prepare;
  dmDatabase.qryWorkingHourdList.Params[0].AsInteger := WORKINGHOURS_ID; // WORKINGHOURS_ID
  dmDatabase.qryWorkingHourdList.Params[1].AsInteger := WORKINGGROUP_ID; // WORKINGGROUP_ID
  dmDatabase.qryWorkingHourdList.open;
  dmDatabase.qryWorkingHourdList.First;

  dmDatabase.qryUserYearDat.Close;
  dmDatabase.qryUserYearDat.Prepare;
  dmDatabase.qryUserYearDat.Params[0].AsInteger := VUSERYEAR_ID; // USERYEAR_ID
  dmDatabase.qryUserYearDat.open;
  dmDatabase.qryUserYearDat.First;

  FromDate := dmDatabase.qryWorkingHourdListFROMDATE.AsDateTime;
  ToDate := dmDatabase.qryWorkingHourdListTODATE.AsDateTime;
  /// ----
  dmDatabase.qryUserYearDat.DisableControls;
  while not dmDatabase.qryUserYearDat.EOF do
  begin
    UDAY := dmDatabase.qryUserYearDatUDAY.AsDateTime;
    if UDAY >= ToDate then
    begin
      dmDatabase.qryWorkingHourdList.Next;
      FromDate := dmDatabase.qryWorkingHourdListFROMDATE.AsDateTime;
      ToDate := dmDatabase.qryWorkingHourdListTODATE.AsDateTime;
    end;
        dmDatabase.qryUserYearDat.Edit;

    i := DayOfWeek(UDAY); // 1 Son, 7 Sams
    case i of
      1: dmDatabase.qryUserYearDatDAYCODE.AsInteger := cSamstag;
      7: dmDatabase.qryUserYearDatDAYCODE.AsInteger := cSonntag;
    end;


    // Hier neue Mitarbeiter { TODO -cIgnore : Neue mitarbeiter }
    if UDAY >= VUSTART then
    begin


      v := dmDatabase.qryWorkingHourdList.FieldByName('DAY' + i.ToString).Value;

      if v <> null then
      begin
        // ARBEITSTAG HAT STUNDEN
        dmDatabase.qryUserYearDatUHOURS.AsInteger := ConvertTime2Min(dmDatabase.qryWorkingHourdList.FieldByName('DAY' + i.ToString).AsDateTime);
        dmDatabase.qryUserYearDatDAYCODE.AsInteger := cArbeitstag; //Arbeitstag
      end
      else
      begin
        // FREIERTAG
        if not (i in [1, 7]) then
          dmDatabase.qryUserYearDatDAYCODE.AsInteger := cFreierTag //Freier Tag (SA/SO)
      end;
    end
    else
    begin
     // dmDatabase.qryUserYearDat.Edit;
      dmDatabase.qryUserYearDatDAYCODE.AsInteger := cBenutzerLater; //Benutzer würde später eingestellt
      // ###rock

    end;



    dmDatabase.qryUserYearDat.post;
    dmDatabase.qryUserYearDat.Next;
  end;
  dmDatabase.qryUserYearDat.EnableControls;
  // mydate := EndOfADay(2025, 12, 31);
  // i := DayOfWeek(mydate);
end;

procedure TfrmAdmin.AddHolidays(VUSERYEAR_ID, HOLIDAYS_ID, VCOUNTRY_ID, Year: Integer);
begin
  //
  // HOLIDAYS
  dmDatabase.qryHolidaysDatList.Close;
  dmDatabase.qryHolidaysDatList.Prepare;
  dmDatabase.qryHolidaysDatList.Params[0].AsInteger := HOLIDAYS_ID;
  dmDatabase.qryHolidaysDatList.open;
  dmDatabase.qryHolidaysDatList.First;

  while not dmDatabase.qryHolidaysDatList.EOF do
  begin
    dmDatabase.FDSADDHolidaysDat.Prepare;
    dmDatabase.FDSADDHolidaysDat.Params[0].AsInteger := VUSERYEAR_ID;
    dmDatabase.FDSADDHolidaysDat.Params[1].AsDate := dmDatabase.qryHolidaysDatListHDATE.AsDateTime;
    dmDatabase.FDSADDHolidaysDat.Params[2].AsString := dmDatabase.qryHolidaysDatListHNAME.AsString;
    dmDatabase.FDSADDHolidaysDat.Params[3].Value := dmDatabase.qryHolidaysDatListFCOST.Value;
    dmDatabase.FDSADDHolidaysDat.Params[4].AsInteger := 1;
    dmDatabase.FDSADDHolidaysDat.ExecProc;
    dmDatabase.FDSADDHolidaysDat.Close;
    dmDatabase.qryHolidaysDatList.Next;
  end;
  //
  // EXTRA HOLIDAYS
  dmDatabase.qryHolidaysExtraList.Close;
  dmDatabase.qryHolidaysExtraList.Prepare;
  dmDatabase.qryHolidaysExtraList.Params[0].AsInteger := VCOUNTRY_ID;
  dmDatabase.qryHolidaysExtraList.open;
  dmDatabase.qryHolidaysExtraList.First;
  while not dmDatabase.qryHolidaysExtraList.EOF do
  begin
    dmDatabase.FDSADDHolidaysDat.Prepare;
    dmDatabase.FDSADDHolidaysDat.Params[0].AsInteger := VUSERYEAR_ID;
    dmDatabase.FDSADDHolidaysDat.Params[1].AsDate := RecodeYear(dmDatabase.qryHolidaysExtraListHDATE.AsDateTime, Year);
    dmDatabase.FDSADDHolidaysDat.Params[2].AsString := dmDatabase.qryHolidaysExtraListHNAME.AsString;
    dmDatabase.FDSADDHolidaysDat.Params[3].Value := dmDatabase.qryHolidaysExtraListFCOST.Value;
    dmDatabase.FDSADDHolidaysDat.Params[4].AsInteger := 2;
    dmDatabase.FDSADDHolidaysDat.ExecProc;
    dmDatabase.FDSADDHolidaysDat.Close;
    dmDatabase.qryHolidaysExtraList.Next;
  end;
end;

procedure TfrmAdmin.CreateExcel;
var
  ts: TcxTabSheet;

begin

  if tsExcel.ControlCount = 2 then
  begin
    ts := tsExcel;
    aUserForm := TfrmUser.Create(ts);
    aUserForm.Parent := ts;
    aUserForm.Align := alClient;
    aUserForm.BorderStyle := bsNone;
    aUserForm.AlignWithMargins := True;
    aUserForm.Visible := True;
  end;
  if wpUserExcel.EditValue = null then
    wpUserExcel.EditValue := now;
end;

procedure TfrmAdmin.dxBarButton3Click(Sender: TObject);
begin
  frmMain.show;
end;

procedure TfrmAdmin.PCChange(Sender: TObject);
begin
  case PC.ActivePageIndex of
    0:
      ;
    1:
      begin
        if wpUserYearCreate.EditValue = null then
          wpUserYearCreate.EditValue := Date;
      end;
  end;
end;

procedure TfrmAdmin.tsHoliExtasShow(Sender: TObject);
begin
  dmDatabase.qryHoliExtras.open();
end;

procedure TfrmAdmin.ChageExcelUser();
begin
  // dmDatabase.qryexcel.Close;
  // dmDatabase.qryexcel.Prepare;
  // dmDatabase.qryexcel.Params[0].AsInteger := dmDatabase.qryUserExcelListUSERYEAR_ID.AsInteger;
  // dmDatabase.qryexcel.Params[1].AsInteger := 1;
  // dmDatabase.qryexcel.open;
  // APP.USERYEAR_ID := dmDatabase.qryUserExcelListUSERYEAR_ID.AsInteger;
end;

// -----------------------------------------------------------------------------
// TABSHEET
// -----------------------------------------------------------------------------

procedure TfrmAdmin.tsCreateUserYearShow(Sender: TObject);
begin

  if dmDatabase.qryUserSelect.Active then
    dmDatabase.qryUserSelect.Refresh;
  if  dmDatabase.qryUserList.Active then
  dmDatabase.qryUserList.Refresh;
end;

procedure TfrmAdmin.tsArbeitzeitShow(Sender: TObject);
begin
  if wpWT.EditValue = null then
    wpWT.EditValue := now;
  dmDatabase.qryCountry.open();
  if cbLanguageWT.ItemIndex = -1 then
    cbLanguageWT.ItemIndex := 0;

  // dmDatabase.qryWorkHours.open;
  // dmDatabase.qryWorkHoursDat.open;

end;

procedure TfrmAdmin.tsExcelShow(Sender: TObject);
begin
dmDatabase.qryUserExcelList.Refresh
end;

// -----------------------------------------------------------------------------
// WP YEAR
// -----------------------------------------------------------------------------
procedure TfrmAdmin.wpUserExcelPropertiesChange(Sender: TObject);
begin
  // TS 1 wpUserExcel
  dmDatabase.qryUserExcelList.Close();
  dmDatabase.qryUserExcelList.Params[0].AsInteger := StrToInt(FormatDateTime('yyyy', wpUserExcel.EditValue));
  dmDatabase.qryUserExcelList.Params[1].AsInteger := 0; // Zeige alle
  dmDatabase.qryUserExcelList.open();

  APP.USER_ID := dmDatabase.qryUserExcelListUSER_ID.AsInteger;
  APP.UYEAR := StrToInt(FormatDateTime('yyyy', wpUserExcel.EditValue));
end;

procedure TfrmAdmin.wpUserYearCreatePropertiesChange(Sender: TObject);
begin
  // TS 2  wpUserYearCreate
  dmDatabase.qryUserList.Close;
  dmDatabase.qryUserList.Params[0].AsInteger := StrToInt(FormatDateTime('yyyy', wpUserYearCreate.EditValue));
  dmDatabase.qryUserList.open();
  dmDatabase.qryUserSelect.Close;

  dmDatabase.qryUserSelect.Params[0].AsInteger := StrToInt(FormatDateTime('yyyy', wpUserYearCreate.EditValue));
  dmDatabase.qryUserSelect.open();

end;

procedure TfrmAdmin.wpWTPropertiesChange(Sender: TObject);
begin
  // TS 3
  dmDatabase.qryWorkHours.Close();
  dmDatabase.qryWorkHours.Params[0].AsInteger := StrToInt(FormatDateTime('yyyy', wpWT.EditValue));
  dmDatabase.qryWorkHours.open();
  dmDatabase.qryWorkHoursDat.open();
  actAddWorkingTime.Visible := dmDatabase.qryWorkHours.IsEmpty;
end;

procedure TfrmAdmin.wpHolidayPropertiesChange(Sender: TObject);
begin
  // TS 4
  dmDatabase.qryHolidays.Close();
  dmDatabase.qryHolidays.Params[0].AsInteger := StrToInt(FormatDateTime('yyyy', wpHoliday.EditValue));
  dmDatabase.qryHolidays.open();
  dmDatabase.qryHolidaysDat.open();
  actAddHollidays.Visible := dmDatabase.qryHolidays.IsEmpty;
end;

end.
