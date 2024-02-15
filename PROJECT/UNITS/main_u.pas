unit main_u;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,
  System.JSON,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Dialogs,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
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
  cxContainer,
  dxCore,
  cxDateUtils,
  cxEditRepositoryItems,
  cxClasses,
  dxmdaset,
  cxDropDownEdit,
  cxCalendar,
  cxDBNavigator,
  cxButtons,
  cxTextEdit,
  cxMaskEdit,
  cxSpinEdit,
  cxTimeEdit,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridCustomView,
  cxGrid,
  dxForms,
  dxSkinsCore,
  dxSkinTheBezier,
  IdHTTP,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  FireDAC.Stan.StorageJSON, Vcl.Mask, cxCurrencyEdit, dxInputDialogs;

type
  TfrmMain = class(TdxForm)
    qryCalender: TdxMemData;
    qryCalenderDayNr: TSmallintField;
    qryCalenderFeiertag: TStringField;
    qryCalenderCode: TSmallintField;
    qryCalenderRest: TIntegerField;
    qryCalenderBemerkung: TStringField;
    qryCalenderSaldo: TIntegerField;
    Memo1: TMemo;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    cxTimeEdit1: TcxTimeEdit;
    cxTimeEdit2: TcxTimeEdit;
    cxTimeEdit3: TcxTimeEdit;
    cxButton1: TcxButton;
    DataSource1: TDataSource;
    cxDBNavigator1: TcxDBNavigator;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1TimeItem1: TcxEditRepositoryTimeItem;
    qryCalenderIn1: TTimeField;
    qryCalenderOut1: TTimeField;
    qryCalendertest: TTimeField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1DayName: TcxGridDBColumn;
    cxGrid1DBTableView1DayNr: TcxGridDBColumn;
    cxGrid1DBTableView1Feiertag: TcxGridDBColumn;
    cxGrid1DBTableView1Code: TcxGridDBColumn;
    cxGrid1DBTableView1Rest: TcxGridDBColumn;
    cxGrid1DBTableView1Bemerkung: TcxGridDBColumn;
    cxGrid1DBTableView1Saldo: TcxGridDBColumn;
    cxGrid1DBTableView1In1: TcxGridDBColumn;
    cxGrid1DBTableView1Out1: TcxGridDBColumn;
    cxGrid1DBTableView1test: TcxGridDBColumn;
    Panel2: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    save: TcxButton;
    qryCalenderColor: TSmallintField;
    cxGrid1DBTableView1Color: TcxGridDBColumn;
    qryCalenderDayName: TStringField;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    ClientDataSet1: TClientDataSet;
    mtHollydays: TFDMemTable;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    mtHollydaysBundesland: TStringField;
    mtHollydaysFeiertag: TStringField;
    mtHollydaysDatum: TDateField;
    mtHollydaysHinweis: TStringField;
    cxGrid1DBBandedTableView1Bundesland: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Feiertag: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Datum: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Hinweis: TcxGridDBBandedColumn;
    mtHollydaysID: TAutoIncField;
    cxGrid1DBBandedTableView1ID: TcxGridDBBandedColumn;
    cxTimeEdit4: TcxTimeEdit;
    cxTimeEdit5: TcxTimeEdit;
    cxMaskEdit1: TcxMaskEdit;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxButton4: TcxButton;
    cxButton8: TcxButton;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxCurrencyEdit3: TcxCurrencyEdit;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure qryCalenderCalcFields(DataSet: TDataSet);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses frmUebertrag_u;

procedure TfrmMain.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited;
  Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
end;

procedure TfrmMain.cxButton10Click(Sender: TObject);

var
  SModal: TfrmUebertrag;
  a, b: Integer;
begin
  SModal := TfrmUebertrag.SetStart(2, 2024, self);
  try
    if SModal.ShowModal = mrok then
    begin
      cxCurrencyEdit2.Value := SModal.wert1;
      b := SModal.wert2;
    end;
  finally
    SModal.Free;
  end;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  K1, G1, Diff: Tdatetime;
begin
  K1 := Tdatetime(cxTimeEdit1.EditValue);
  G1 := Tdatetime(cxTimeEdit2.EditValue);

  if G1 < K1 then
  begin
    G1 := G1 + 1;
    Diff := (K1 - G1);
    // Diff :=  TDateTime(24)-Diff;
  end
  else
    Diff := (G1 - K1);
  // EncodeTime
  // i:=    TDateTime(cxTimeEdit2.EditValue) - TDateTime(cxTimeEdit1.EditValue); //:= cxTimeEdit1.Text;
  cxTimeEdit3.EditValue := Diff;
end;

procedure TfrmMain.cxButton2Click(Sender: TObject);
var
  myDate, Datum: TDate;
  myYear, myMonth, myDay: Word;
begin
  Memo1.Clear;
  myDate := cxDateEdit1.EditValue;
  // calDate := EncodeDate(2024, 1, 1);
  DecodeDate(myDate, myYear, myMonth, myDay);
  Datum := EncodeDate(myYear, myMonth, 1);

  while MonthOf(Datum) = myMonth do
  begin
    qryCalender.Append;

    if (DayOfTheWeek(Datum) = DaySaturday) or (DayOfTheWeek(Datum) = DaySunday) then
    begin
      Memo1.Lines.Add(Format('%s, %d. %s #', [FormatDateTime('dddd', Datum), DayOfTheMonth(Datum), FormatDateTime('mmmm yyyy', Datum)]));
      qryCalenderDayName.AsString := FormatDateTime('dddd', Datum);
      qryCalenderDayNr.AsString := IntToStr(DayOfTheMonth(Datum));
    end
    else
    begin
      Memo1.Lines.Add(Format('%s, %d. %s', [FormatDateTime('dddd', Datum), DayOfTheMonth(Datum), FormatDateTime('mmmm yyyy', Datum)]));
      qryCalenderDayName.AsString := FormatDateTime('dddd', Datum);
      qryCalenderDayNr.AsString := IntToStr(DayOfTheMonth(Datum));
    end;

    qryCalender.Post;
    Datum := IncDay(Datum);
  end;

end;

procedure TfrmMain.cxButton3Click(Sender: TObject);
var
  Datum: TDate;
begin
  Memo1.Clear;

  // Datum für den 1. Januar 2024
  Datum := EncodeDate(2024, 1, 1);

  // Durchlaufe alle Tage im Januar 2024
  while MonthOf(Datum) = 1 do
  begin
    // Memo1.Lines.Add(FormatDateTime('dddd.mm.yyyy', Datum));
    /// Memo1.Lines.Add(Format('%s, %d. %s', [FormatDateTime('dddd', Datum), DayOfTheMonth(Datum), FormatDateTime('mmmm yyyy', Datum)]));
    if (DayOfTheWeek(Datum) = DaySaturday) or (DayOfTheWeek(Datum) = DaySunday) then
      Memo1.Lines.Add(Format('%s, %d. %s #', [FormatDateTime('dddd', Datum), DayOfTheMonth(Datum), FormatDateTime('mmmm yyyy', Datum)]))
    else
      Memo1.Lines.Add(Format('%s, %d. %s', [FormatDateTime('dddd', Datum), DayOfTheMonth(Datum), FormatDateTime('mmmm yyyy', Datum)]));

    Datum := IncDay(Datum);
  end;

end;

procedure TfrmMain.saveClick(Sender: TObject);
begin
  mtHollydays.Open;
  mtHollydays.SaveToFile('j:\feiertage.json', sfJSON);
end;

procedure TfrmMain.qryCalenderCalcFields(DataSet: TDataSet);
var
  K1, G1, Diff: Tdatetime;
begin
  if not qryCalenderIn1.IsNull and not qryCalenderOut1.IsNull then
  begin
    K1 := Tdatetime(qryCalenderIn1.AsDateTime);
    G1 := Tdatetime(qryCalenderOut1.AsDateTime);
    if G1 < K1 then
    begin
      G1 := G1 + 1;
      Diff := (K1 - G1);
    end
    else
      Diff := (G1 - K1);
    qryCalendertest.AsDateTime := Diff;
  end;
end;

function StundenUndMinutenZuMinuten(Stunden, Minuten: Integer): Integer;
begin
  Result := (Stunden * 60) + Minuten;
end;

procedure MinutenZuStundenUndMinuten(Minuten: Integer; var Stunden, RestMinuten: Integer);
begin
  Stunden := Minuten div 60;
  RestMinuten := Minuten mod 60;
end;

procedure TfrmMain.cxButton4Click(Sender: TObject);
var
  time1, time2, time3: TTime;
  i, n, r, Stunden, RestMinuten: Integer;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  a: real;
begin

  DecodeTime(cxTimeEdit3.EditValue, Hour, Min, Sec, MSec);
  i := Hour * 60 + Min;
  DecodeTime(cxTimeEdit4.EditValue, Hour, Min, Sec, MSec);
  n := Hour * 60 + Min;
  r := i - n;

  Stunden := r div 60;
  RestMinuten := r mod 60;
  ShowMessage(Format('%.2d:%.2d', [Stunden, RestMinuten]))
  // cxTimeEdit4.EditValue

end;

procedure TfrmMain.cxButton5Click(Sender: TObject);
var
  time1, time2, time3: TTime;
  a, b: string;
  t1, t2: LongInt;
begin
  cxTimeEdit5.EditValue := cxTimeEdit3.EditValue - cxTimeEdit4.EditValue;
  cxMaskEdit1.EditValue := (cxTimeEdit3.EditValue - cxTimeEdit4.EditValue) / 60;
  cxCurrencyEdit1.EditValue := cxTimeEdit3.EditValue - cxTimeEdit4.EditValue;
  cxButton5.Caption := TimeToStr(cxTimeEdit3.EditValue - cxTimeEdit4.EditValue);
  time1 := cxTimeEdit3.EditValue;
  time2 := cxTimeEdit4.EditValue;
  // a:= TimeToStr(time1) ;
  // b:= TimeToStr(time2);

  time3 := time1 - time2;
end;

procedure TfrmMain.cxButton6Click(Sender: TObject);
var
  time1, time2: TTime;

begin
  Memo1.Lines.Clear;
  time1 := StrToTime(cxTimeEdit3.Text);
  time2 := StrToTime(cxTimeEdit4.Text);
  Memo1.Lines.Add(IntToStr(CompareTime(time1, time2)));
  Memo1.Lines.Add('Hour span: ' + FloatToStr(HourSpan(time1, time2)));
  Memo1.Lines.Add('Hours between: ' + FloatToStr(HoursBetween(time1, time2)));
  Memo1.Lines.Add('Minute span: ' + FloatToStr(MinuteSpan(time1, time2)));
  Memo1.Lines.Add('Minutes between: ' + FloatToStr(MinutesBetween(time1, time2)));
  Memo1.Lines.Add('Second span: ' + FloatToStr(SecondSpan(time1, time2)));
  Memo1.Lines.Add('Seconds between: ' + FloatToStr(SecondsBetween(time1, time2)));
  Memo1.Lines.Add('Millisecond span: ' + FloatToStr(MilliSecondSpan(time1, time2)));
  Memo1.Lines.Add('Milliseconds between: ' + FloatToStr(MilliSecondsBetween(time1, time2)));
end;

procedure TfrmMain.cxButton9Click(Sender: TObject);
var
  APrompts, AValues: array of string;

begin
  SetLength(APrompts, 3);
  SetLength(AValues, 3);

  APrompts[0] := 'Das System kann keine Vorjahresübertragszeiten finden. Bitte fügen Sie sie manuell ein:' + sLineBreak +
    ' (Minuszeiten mit  Kennzeichen (-), z. B.: -17:30.' + sLineBreak + ' (Pluszeiten ohne Kennzeichen, z. B.:  17:30.' + sLineBreak + sLineBreak +
    'Übertrag Zeit 2023';
  // AValues[0]:= 'Es gibt kein registrierte übertrag, bitte manuel eintragen, bei minus stunden ein -davor scheiben ';
  APrompts[1] := 'Urlaubanspruch übertrag aus (2023) Rest Urlaub';
  APrompts[2] := 'Urlaubanspruch (2024)';
  dxInputQuery('New User', APrompts, AValues);
end;

end.
