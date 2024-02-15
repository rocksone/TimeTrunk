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
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);

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
    procedure TVExcelcalcDayTypeCustomDrawCell(Sender: TcxCustomGridTableView;
        ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone:
        Boolean);
    procedure TVExcelCODEPropertiesEditValueChanged(Sender: TObject);
    procedure TVExcelCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas:
        TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
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
  dmDatabase_u, dmStyle_u, xGlobalVars_u,dxGDIPlusClasses;

{$R *.dfm}

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

procedure TfrmUser.TVExcelcalcDayTypeCustomDrawCell(Sender:
    TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
    var
      APainter: TcxPainterAccess;
begin


     with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + dmStyle.imlCodes.Width + 1;

///    DrawContent;
  //   if <your condition> then
       ACanvas.FillRect(AViewInfo.Bounds, cldefault);  // red cell's background

  //   if <your condition> then
       ACanvas.Font.Color := clYellow;             // yellow text color
     ACanvas.DrawTexT(AViewInfo.Text, TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect, cxAlignLeft or cxAlignVCenter);

  //   DrawBorders;
        with AViewInfo.ClientBounds do
        dmStyle.imlCodes.Draw(ACanvas.Canvas, Left + 1, Top + 1, 2);
          ADone := True;
end;

procedure TfrmUser.TVExcelCODEPropertiesEditValueChanged(Sender: TObject);
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

    i := Values[FocusedRecordIndex, TVExcelCODE.Index];
    if i = NULL then
    begin
      getHoursForAday(dmDatabase.qryExcelUDAY.AsDateTime, APP.USERYEAR_ID)
    end
    else
      case i of
        6, 8, 10, 12:
          dmDatabase.qryExcelUHOURS.Clear; // Krank  | Kurzarbeit |  Urlaubsantrag Tag | Urlaub

        11, 13:
          begin // Urlaubsantrag ½ Tag | Urlaub ½ Tag
            if {(dmDatabase.qryExcelFCOST.AsFloat > 0) and} ((dmDatabase.qryExcelUHOURS.AsInteger > 0)) then
              dmDatabase.qryExcelFCOST.AsCurrency :=  dmDatabase.qryExcelFCOST.AsCurrency + 0.5
              //dmDatabase.qryExcelUHOURS.AsInteger -
              //  Trunc(dmDatabase.qryExcelUHOURS.AsInteger * dmDatabase.qryExcelFCOST.AsFloat) * 2;
            // else
            // dmDatabase.qryExcelUHOURS.AsInteger := dmDatabase.qryExcelUHOURS.AsInteger - Trunc(dmDatabase.qryExcelUHOURS.AsInteger * dmDatabase.qryExcelFCOST.AsFloat)*2
          end;
        7, 9:
          begin   //Krank Restzeit Kurzarbeit Restzeit

           if  dmDatabase.qryExcelcalcIsTime.AsInteger > 0 then
            dmDatabase.qryExcelUHOURS.AsInteger := dmDatabase.qryExcelcalcIsTime.AsInteger;
          end;

        // dmDatabase.qryExcelNOTE.AsString :='sda';
      end;
  end;
end;

procedure TfrmUser.TVExcelCustomDrawCell(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone:
    Boolean);

    //var
//  AImage: TdxSmartImage;
//    APainter: TcxPainterAccess;
    begin
//
//     if (AViewInfo.Item <> TVExcelcalcDayType) or
//    not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
//      Exit;
//  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
//  with APainter do
//  begin
//
//      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
//        Left := Left + dmStyle.imlCodes.Width + 1;
//      DrawContent;
//      DrawBorders;
//
//       AImage := TdxSmartImage.Create;
//  try
// dmStyle.imlCodes.GetImage(0, AImage);
//  cxImage1.Picture.Assign(AImage);
//
//   with AViewInfo.ClientBounds do
//        ACanvas.DrawGlyph(Left + 1, Top + 1, cxImage1.Picture.Bitmap);
//
//
//  finally
//    AImage.Free;
//  end;
//
//
//
//
//
//
//    end;
end;


  procedure TfrmUser.TVExcelStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
    var AStyle: TcxStyle);
  var
    i: Integer;
  begin
    // TAG: ARBEITS TAG; FEIERTAG,
    if ((AItem.Index = TVExcelCOMES1.Index) or (AItem.Index = TVExcelGOES1.Index) or (AItem.Index = TVExcelCOMES2.Index) or (AItem.Index = TVExcelGOES2.Index)
      or (AItem.Index = TVExcelPAUSE.Index) or (AItem.Index = TVExcelCODE.Index)) and (not VarIsNull(ARecord.Values[TVExcelDAYCODE.Index])) then
    begin
      i := (ARecord.Values[TVExcelDAYCODE.Index]);
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
    else if not VarIsNull(ARecord.Values[TVExcelDAYCODE.Index]) then
    begin
      i := (ARecord.Values[TVExcelDAYCODE.Index]);
      case i of

        cFeiertag:
          AStyle := dmStyle.cxFreeDay;
      end;
    end;

    if ((AItem.Index = TVExcelCOMES1.Index) or (AItem.Index = TVExcelGOES1.Index) or (AItem.Index = TVExcelCOMES2.Index) or (AItem.Index = TVExcelGOES2.Index)
      or (AItem.Index = TVExcelPAUSE.Index) or (AItem.Index = TVExcelCODE.Index)) and (not VarIsNull(ARecord.Values[TVExcelCODE.Index])) then
    begin
      i := (ARecord.Values[TVExcelCODE.Index]);
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

    if (AItem.Index = TVExcelcalcHourDiff.Index) then
    begin
      if (ARecord.Values[TVExcelcalcHourDiff.Index]) > 0 then

        AStyle := dmStyle.cxPlus
      else if (ARecord.Values[TVExcelcalcHourDiff.Index]) < 0 then
        AStyle := dmStyle.cxminus
    end;

    // WOCHEN ENDE SA/SO
    if not VarIsNull(ARecord.Values[TVExcelUDAY.Index]) then
    begin
      i := DayOfWeek(ARecord.Values[TVExcelUDAY.Index]);
      case i of
        1:
          AStyle := dmStyle.cxSonday;
        7:
          AStyle := dmStyle.cxSaturday;

      end;
    end;

    if not VarIsNull(ARecord.Values[TVExcelDAYCODE.Index]) then
    begin
      i := (ARecord.Values[TVExcelDAYCODE.Index]);
      case i of
        cFeiertag:
          AStyle := dmStyle.cxHoliday;
        cFeiertagHalb:
          AStyle := dmStyle.cxHoliExtra;
        cBenutzerLater:
          AStyle := dmStyle.cxNoActive;
      end;
    end;

    if not VarIsNull(ARecord.Values[TVExcelCODE.Index]) then
    begin
      i := (ARecord.Values[TVExcelCODE.Index]);
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
