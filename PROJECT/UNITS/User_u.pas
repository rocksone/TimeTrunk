unit User_u;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.StdCtrls,
  dxBarBuiltInMenu,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxGeometry,
  dxFramedControl,
  dxPanel,
  cxPC,
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
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  cxButtons,
  cxContainer,
  cxTextEdit,
  cxMaskEdit,
  cxSpinEdit,
  cxTimeEdit,
  cxLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxImageComboBox, cxImage;

type
  TfrmUser = class(TForm)
    tcMonths: TcxTabControl;
    pnlBtn: TdxPanel;
    pnlTop: TdxPanel;
    GDExcel: TcxGrid;
    TVExcel: TcxGridDBTableView;
    TVExcelUSERYEARDAT_ID: TcxGridDBColumn;
    TVExcelUSERYEAR_ID: TcxGridDBColumn;
    TVExcelDAYNAME: TcxGridDBColumn;
    TVExcelUDAY: TcxGridDBColumn;
    TVExcelHOLLYDAY: TcxGridDBColumn;
    TVExcelCOMES1: TcxGridDBColumn;
    TVExcelGOES1: TcxGridDBColumn;
    TVExcelCOMES2: TcxGridDBColumn;
    TVExcelGOES2: TcxGridDBColumn;
    TVExcelPAUSE: TcxGridDBColumn;
    TVExcelCODE: TcxGridDBColumn;
    TVExcelcalcIsTime: TcxGridDBColumn;
    TVExcelUHOURS: TcxGridDBColumn;
    TVExcelcalcHourDiff: TcxGridDBColumn;
    TVExcelNOTE: TcxGridDBColumn;
    TVExcelHOLIDAY_ID: TcxGridDBColumn;
    TVExcelFCOST: TcxGridDBColumn;
    TVExcelcalcHourCount: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    LVExcel: TcxGridLevel;
    pnlMain: TdxPanel;
    cxButton7: TcxButton;
    FDSHours: TFDStoredProc;
    FDSUserData: TFDStoredProc;
    TVExcelDAYCODE: TcxGridDBColumn;
    TVExcelcalcDayType: TcxGridDBColumn;
    FDgetDay: TFDStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure tcMonthsChange(Sender: TObject);
    procedure TVExcelStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxButton7Click(Sender: TObject);
    procedure TVExcelcalcDayTypeCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure TVExcelCODEEdit(Sender: TObject);
    procedure TVExcelDAYCODEEdit(Sender: TObject);
  private
    FUserID, FYear: Integer;

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure ChangeMonth;
    constructor SetStart(AOwner: TComponent; UserID, Year: Integer);
  end;

var
  frmUser: TfrmUser;

implementation

uses
  dmDatabase_u, dmStyle_u, xGlobalVars_u, dxGDIPlusClasses, xrsMath_u;

{$R *.dfm}

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);
  TcxImageComboBoxPropertiesAccess = class(TcxImageComboBoxProperties);

procedure TfrmUser.FormCreate(Sender: TObject);
begin
  // ChangeMonth;
  APP.UMONTH := tcMonths.TabIndex + 1;
end;

constructor TfrmUser.SetStart(AOwner: TComponent; UserID, Year: Integer);
begin
  inherited Create(AOwner);
  FUserID := UserID;
  FYear := Year;
end;

procedure TfrmUser.ChangeMonth();
var
  myDate: TDate;
  vERROR: Integer;
begin
  if assigned(tcMonths) then
  begin
    // Holle REST JAHRES MINUTES
    // AKTUELLER JAHR = 2024
    // P_GET_DIFF_USER -- HOLT
    APP.UCumulativTime := 0;
    APP.ULASTMONTH := 0;
    // APP.ULASTYEARMINUTES
    if tcMonths.TabIndex < 12 then
    begin
      APP.UMONTH := tcMonths.TabIndex + 1;
      // Holle DIFF FÜR MONAT
      // SOLLTE 1.1 SEIN HOLLE AUS ÜBERTRAG TABELLE

      { TODO : HIER WEITER MACHEN }

      // if tcMonths.TabIndex = 0 then
      // begin
      // SOLLTE 1.1 SEIN HOLLE AUS ÜBERTRAG TABELLE
      // dmDatabase.RestZeitVorJahr := 120;
      // if tcMonths.TabIndex = 0 then
      // myDate := EndOfAMonth( APP.UYEAR, 12);
      // 1   myDate := EndOfAMonth(FYear, tcMonths.TabIndex- 1); // last day of the year(
      if (APP.UVACATIONDAYSLASTYEAR = NULL) and (APP.ULASTYEARMINUTES = NULL) then
      begin

        FDSUserData.Prepare;
        FDSUserData.Params[0].AsInteger := APP.USER_ID;
        FDSUserData.Params[1].AsInteger := APP.UYEAR;
        FDSUserData.Params[2].AsBoolean := True;
        FDSUserData.OpenOrExecute;
        // vERROR := FDSUserData.Fields[0].AsInteger;
        APP.UVACATIONDAYSLASTYEAR := FDSUserData.Fields[2].AsInteger;
        APP.ULASTYEARMINUTES := FDSUserData.Fields[3].AsInteger;
        FDSUserData.Close;
      end;

      // dmDatabase.monatWert := 11 + mDatabase.vorWert ;
      // end
      // else
      if ((tcMonths.TabIndex > 0) and (tcMonths.TabIndex < 12)) and (tcMonths.TabIndex < 12) then
      begin
        // Holle DIFF FÜR MONAT LAUFENDES JAHR
        if APP.UYEAR <> 0 then
        begin
          myDate := EndOfAMonth(APP.UYEAR, tcMonths.TabIndex);

          FDSHours.Prepare;
          FDSHours.Params[0].AsDate := myDate;
          FDSHours.Params[1].AsInteger := APP.USERYEAR_ID;
          FDSHours.OpenOrExecute;
          APP.ULASTMONTH := FDSHours.Fields[0].AsInteger;
          FDSHours.Close;
        end;

      end;

      dmDatabase.qryexcel.Close;
      dmDatabase.qryexcel.Prepare;
      dmDatabase.qryexcel.Params[0].AsInteger := dmDatabase.qryUserExcelListUSERYEAR_ID.AsInteger;
      dmDatabase.qryexcel.Params[1].AsInteger := tcMonths.TabIndex + 1;
      dmDatabase.qryexcel.open;
    end
    else
    begin

    end;
  end;
end;

procedure TfrmUser.tcMonthsChange(Sender: TObject);
begin
  ChangeMonth;
end;

procedure TfrmUser.cxButton7Click(Sender: TObject);
begin
  dmDatabase.qryexcel.Refresh;
end;

procedure TfrmUser.TVExcelcalcDayTypeCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);

  function VarToIntDef(const V: Variant; const ADefault: Integer = 0): Integer;
begin
  if V = NULL then
    Result := ADefault
  else
    Result := V;
end;


var
  APainter: TcxPainterAccess;
  AItem: TcxImageComboBoxItem;
  v: Variant;
  i:integer;
begin
  if (AViewInfo.Item <> TVExcelcalcDayType) or not(AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;
  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
      begin
        Left := Left + dmStyle.imlCodes.Width + 5;
      DrawContent;
      DrawBorders;
      end;
      v := TVExcel.DataController.Values[AViewInfo.GridRecord.RecordIndex, TVExcelDAYCODE.index];
      if (VarToIntDef(v) in [cFeiertag, cFeiertagHalb, cArbeitstag, cFreierTag, cBenutzerLater, cSamstag,cSonntag]) then
      begin
        AItem := TcxImageComboBoxPropertiesAccess(dmStyle.icbDayCode.Properties).FindItemByValue(v);
        with AViewInfo.ClientBounds do
          dmStyle.imlCodes.Draw(ACanvas.Canvas, Left + 4, Top + 3, AItem.ImageIndex);
      end;
    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmUser.TVExcelDAYCODEEdit(Sender: TObject);
  procedure getHoursForAday(aDate: TDate; aUserYear_ID: Integer);
  begin
//    if (dmDatabase.qryExcelDAYCODE.AsInteger in [1, 4]) then
//      dmDatabase.qryExcelUHOURS.Clear
//    else
    begin
      FDgetDay.Prepare;
      FDgetDay.Params[0].AsDate := aDate;
      FDgetDay.Params[1].AsInteger := aUserYear_ID;
      FDgetDay.OpenOrExecute;
      dmDatabase.qryExcelUHOURS.AsInteger := FDgetDay.Fields[0].AsInteger;
      dmDatabase.qryExcelFCOST.AsFloat := FDgetDay.Fields[1].AsFloat;
      FDgetDay.Close;
    end;
  end;
var
  AImageComboBox: TcxImageComboBox;
  i: variant;
begin
  AImageComboBox := TcxImageComboBox(Sender);
  with TVExcel.DataController do
  begin
    i := Values[FocusedRecordIndex, TVExcelDAYCODE.index];
//    if i = NULL then
//    begin
//      getHoursForAday(dmDatabase.qryExcelUDAY.AsDateTime, APP.USERYEAR_ID)
//    end
//    else
      case i of
        cFeiertag,cFreierTag,cBenutzerLater,cSamstag,cSonntag:  //1 Feiertag; 4 Freier Tag; 16 Inaktiver Benutzer; 17 Wochende
          dmDatabase.qryExcelUHOURS.Clear;
        cFeiertagHalb,cArbeitstag:  getHoursForAday(dmDatabase.qryExcelUDAY.AsDateTime, APP.USERYEAR_ID);
      end;
  end;
end;

procedure TfrmUser.TVExcelCODEEdit(Sender: TObject);
  procedure getHoursForAday(aDate: TDate; aUserYear_ID: Integer);
  begin
    if (dmDatabase.qryExcelDAYCODE.AsInteger in [1, 4]) then
      dmDatabase.qryExcelUHOURS.Clear
    else
    begin
      FDgetDay.Prepare;
      FDgetDay.Params[0].AsDate := aDate;
      FDgetDay.Params[1].AsInteger := aUserYear_ID;
      FDgetDay.OpenOrExecute;
      dmDatabase.qryExcelUHOURS.AsInteger := FDgetDay.Fields[0].AsInteger;
      dmDatabase.qryExcelFCOST.AsFloat := FDgetDay.Fields[1].AsFloat;
      FDgetDay.Close;
    end;
  end;

var
  AImageComboBox: TcxImageComboBox;
  i: variant;
begin
  AImageComboBox := TcxImageComboBox(Sender);
  with TVExcel.DataController do
  begin

    i := Values[FocusedRecordIndex, TVExcelCODE.index];
    if (i = NULL) or (i=0) then
    begin
      getHoursForAday(dmDatabase.qryExcelUDAY.AsDateTime, APP.USERYEAR_ID);
       dmDatabase.qryExcelCODE.AsInteger := 0;
    end
    else
    begin
//     i := dmDatabase.qryExcelCODE.NewValue;
  if (VarToIntDef(dmDatabase.qryExcelCODE.NewValue) in [cKrank,cKrankRest,cKurzarbeit,cKurzarbeitRest,cUrlaubsantrag,cUrlaubsantragHalb,cUrlaub, cUrlaubHalb]) then  //cBereitschaft kläreung
    getHoursForAday(dmDatabase.qryExcelUDAY.AsDateTime, APP.USERYEAR_ID);
      case i of
        cKrank, cKurzarbeit, cUrlaubsantrag, cUrlaub:
          dmDatabase.qryExcelUHOURS.Clear; // Krank  | Kurzarbeit |  Urlaubsantrag Tag | Urlaub

        cUrlaubsantragHalb, cUrlaubHalb:
          begin // Urlaubsantrag ½ Tag | Urlaub ½ Tag
            if  ((dmDatabase.qryExcelUHOURS.AsInteger > 0)) then
              dmDatabase.qryExcelFCOST.AsCurrency := dmDatabase.qryExcelFCOST.AsCurrency + 0.5




          end;
        cKrankRest, cKurzarbeitRest:
          begin // Krank Restzeit Kurzarbeit Restzeit

            if dmDatabase.qryExcelcalcIsTime.AsInteger > 0 then
              dmDatabase.qryExcelUHOURS.AsInteger := dmDatabase.qryExcelcalcIsTime.AsInteger;
          end;

        // dmDatabase.qryExcelNOTE.AsString :='sda';
      end;
  end;

  end;
end;





procedure TfrmUser.TVExcelStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
var
  i: Integer;
begin
  // TAG: ARBEITS TAG; FEIERTAG,
  if ((AItem.index = TVExcelCOMES1.index) or (AItem.index = TVExcelGOES1.index) or (AItem.index = TVExcelCOMES2.index) or (AItem.index = TVExcelGOES2.index) or
    (AItem.index = TVExcelPAUSE.index) or (AItem.index = TVExcelCODE.index)) and (not VarIsNull(ARecord.Values[TVExcelDAYCODE.index])) then
  begin
    i := (ARecord.Values[TVExcelDAYCODE.index]);
    case i of
      cArbeitstag:
        AStyle := dmStyle.cxWorkDay;
      cFreierTag:
        AStyle := dmStyle.cxFreeDay;
      cKurzarbeit:
        AStyle := dmStyle.cxKurzArbeit;
      cKurzarbeitRest:
        AStyle := dmStyle.cxKurzArbeitRest;
    end;
  end
  else if not VarIsNull(ARecord.Values[TVExcelDAYCODE.index]) then
  begin
    i := (ARecord.Values[TVExcelDAYCODE.index]);
    case i of

      cFeiertag:
        AStyle := dmStyle.cxFreeDay;
    end;
  end;

  if ((AItem.index = TVExcelCOMES1.index) or (AItem.index = TVExcelGOES1.index) or (AItem.index = TVExcelCOMES2.index) or (AItem.index = TVExcelGOES2.index) or
    (AItem.index = TVExcelPAUSE.index) or (AItem.index = TVExcelCODE.index)) and (not VarIsNull(ARecord.Values[TVExcelCODE.index])) then
  begin
    i := (ARecord.Values[TVExcelCODE.index]);
    case i of
      cGleittag:
        AStyle := dmStyle.cxGleitTag;
      cKurzarbeit:
        AStyle := dmStyle.cxKurzArbeit;
      cKurzarbeitRest:
        AStyle := dmStyle.cxKurzArbeitRest;
      cUrlaubsantrag:
        AStyle := dmStyle.cxUrlaubAntrag;
      cUrlaubsantragHalb:
        AStyle := dmStyle.cxUrlaubAntragHalb;
      cHomeoffice:
        AStyle := dmStyle.cxHomeOffice;

    end;
  end;

  if (AItem.index = TVExcelcalcHourDiff.index) then
  begin
    if (ARecord.Values[TVExcelcalcHourDiff.index]) > 0 then

      AStyle := dmStyle.cxPlus
    else if (ARecord.Values[TVExcelcalcHourDiff.index]) < 0 then
      AStyle := dmStyle.cxminus
  end;

  // WOCHEN ENDE SA/SO
  if not VarIsNull(ARecord.Values[TVExcelUDAY.index]) then
  begin
    i := DayOfWeek(ARecord.Values[TVExcelUDAY.index]);
    case i of
      1:
        AStyle := dmStyle.cxSonday;
      7:
        AStyle := dmStyle.cxSaturday;

    end;
  end;

  if not VarIsNull(ARecord.Values[TVExcelDAYCODE.index]) then
  begin
    i := (ARecord.Values[TVExcelDAYCODE.index]);
    case i of
      cFeiertag:
        AStyle := dmStyle.cxHoliday;
      cFeiertagHalb:
        AStyle := dmStyle.cxHoliExtra;
      cBenutzerLater:
        AStyle := dmStyle.cxNoActive;
    end;
  end;

  if not VarIsNull(ARecord.Values[TVExcelCODE.index]) then
  begin
    i := (ARecord.Values[TVExcelCODE.index]);
    case i of
      cKrank:
        AStyle := dmStyle.cxKrank;
      cKrankRest:
        AStyle := dmStyle.cxKrankRest;
      cUrlaub:
        AStyle := dmStyle.cxUrlaub;
      cUrlaubHalb:
        AStyle := dmStyle.cxUrlaubHalb;
    end;
  end;

end;

end.
