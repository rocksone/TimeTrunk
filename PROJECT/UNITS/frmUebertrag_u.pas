unit frmUebertrag_u;

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
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxGeometry,
  dxFramedControl,
  dxPanel,
  cxButtons,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxImageComboBox,
  cxGroupBox,
  cxSpinEdit,
  cxSpinButton,
  cxLabel,
  dxGDIPlusClasses,
  cxImage,
  dxFormattedLabel,
  cxCheckBox,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmUebertrag = class(TForm)
    dxPanel1: TdxPanel;
    dxPanel2: TdxPanel;
    dxPanel3: TdxPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    pnlInfo: TdxPanel;
    gbLastCheck: TcxGroupBox;
    gbUebertrag: TcxGroupBox;
    sptStunden: TcxSpinEdit;
    lbStunden: TcxLabel;
    sptMinuten: TcxSpinEdit;
    lbMinuten: TcxLabel;
    lbTotal: TcxLabel;
    imgInfo: TcxImage;
    lbInfo: TdxFormattedLabel;
    gbUrlaub: TcxGroupBox;
    lbanspruch: TcxLabel;
    sptUrlaub: TcxSpinEdit;
    lbRestUrlaub: TcxLabel;
    sptRestUrlaub: TcxSpinEdit;
    lbUrlaub: TcxLabel;
    lbResultStd: TcxLabel;
    lbResulTage: TcxLabel;
    chkboxUebernehmen: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    FDSUser: TFDStoredProc;
    lbName: TcxLabel;
    lbPersonalNr: TcxLabel;
    FDSUserData: TFDStoredProc;
    dxPanel4: TdxPanel;
    procedure FormCreate(Sender: TObject);
    procedure StundenChange(Sender: TObject);
    procedure UrlaubChange(Sender: TObject);
    procedure chkboxUebernehmenPropertiesChange(Sender: TObject);
  private
    FUSER_ID, FYear: Integer;
    procedure DisableControls(mycontrol: TWinControl; value: Boolean);
    { Private-Deklarationen }
  public
    wert1, wert2: Integer;
    constructor SetStart(USER_ID, Year: Integer; Owner: TComponent);
    { Public-Deklarationen }
  end;

var
  frmUebertrag: TfrmUebertrag;

implementation

uses
  dmStyle_u, xrsDatabase_u, dmDatabase_u;

{$R *.dfm}

constructor TfrmUebertrag.SetStart(USER_ID, Year: Integer; Owner: TComponent);
begin
  inherited Create(Owner);
  FUSER_ID := USER_ID;
  FYear := Year;
end;

procedure TfrmUebertrag.StundenChange(Sender: TObject);
var
  StundenStr, MinutenStr: string;
begin

  StundenStr := IntToStr(sptStunden.value);
  MinutenStr := IntToStr(sptMinuten.value);

  // Führende Nullen hinzufügen, falls nötig
  if Length(StundenStr) < 2 then
    StundenStr := '0' + StundenStr;
  if Length(MinutenStr) < 2 then
    MinutenStr := '0' + MinutenStr;

  lbTotal.Caption := StundenStr + ':' + MinutenStr;

  if sptStunden.value >= 0 then
    lbTotal.Style.Color := $00E1FFE1
  else
    lbTotal.Style.Color := $00E1E4FF;

end;

procedure TfrmUebertrag.UrlaubChange(Sender: TObject);
var
  value: Integer;
begin
  value := sptUrlaub.value + sptRestUrlaub.value;
  if value >= 0 then
  begin
    lbUrlaub.Caption := Format('%d Tage', [value]);
    lbUrlaub.Style.Color := $00E1FFE1;
  end
  else
  begin
    lbUrlaub.Caption := Format('%d Tage', [value]);
    lbUrlaub.Style.Color := $00E1E4FF;
  end;
end;

procedure TfrmUebertrag.DisableControls(mycontrol: TWinControl; value: Boolean);
var
  I: Integer;
begin
  for I := 0 to mycontrol.ControlCount - 1 do
    mycontrol.Controls[I].Enabled := value;
end;

procedure TfrmUebertrag.chkboxUebernehmenPropertiesChange(Sender: TObject);

begin
  gbUrlaub.Enabled := not chkboxUebernehmen.Checked;
  gbUebertrag.Enabled := not chkboxUebernehmen.Checked;
  btnOk.Enabled := chkboxUebernehmen.Checked;
  btnOk.Default := chkboxUebernehmen.Checked;
  DisableControls(gbUrlaub, chkboxUebernehmen.Checked);
  DisableControls(gbUebertrag, chkboxUebernehmen.Checked);

  // for I := 0 to gbUrlaub.ControlCount - 1 do
  // gbUrlaub.Controls[I].Enabled := not chkboxUebernehmen.Checked;
  // for I := 0 to gbUebertrag.ControlCount - 1 do
  // gbUebertrag.Controls[I].Enabled := not chkboxUebernehmen.Checked;
end;

procedure TfrmUebertrag.FormCreate(Sender: TObject);
  procedure MinutenZuStundenUndMinuten(Minuten: Integer; var Stunden, RestMinuten: Integer);
  begin
    Stunden := Minuten div 60;
    RestMinuten := Minuten mod 60;
  end;

resourcestring
  rsStunden = 'Stundenübertrag aus dem Jahr %d';
  rsUrlaub = 'Anspruch für (%d)';
  rsRest = 'Übertrag aus (%d)';
  rsResultStd = 'Übertrag in (%d)';
  rsResulTage = 'Resturlaub (%d)';
  rsError0 = 'Daten würden aus den Vorjahr übernommen, ein nach prüffung kann ja nicht schaden.';
  rsError1 = 'Das System konnte keine Übertragungszeiten aus dem[B] Vorjahr finden[/B]. Bitte fügen Sie sie manuell ein.';
  rsError2 = 'Der Benutzer hat das Jahr noch nicht abgeschloßen, neues Jahr anzulegen ist nicht möglich';
  rsError3 = 'Der Admin hat das Jahr noch nicht abgeschloßen, neues Jahr anzulegen ist nicht möglich';
var
  myDate: TDate;
  VACATIONDAYS: Integer;
  PERSONALNR, FIRSTNAME, LASTNAME: String;
  vERROR: Integer;
  VACATIONDAYSLASTYEAR: Integer;
  LASTYEARMINUTES: Integer;
  AImage: TdxSmartImage;
begin

  FDSUser.Prepare;
  FDSUser.Params[0].AsInteger := FUSER_ID;
  FDSUser.OpenOrExecute;
  PERSONALNR := FDSUser.Fields[0].AsString;
  LASTNAME := FDSUser.Fields[2].AsString;
  FIRSTNAME := FDSUser.Fields[1].AsString;
  VACATIONDAYS := FDSUser.Fields[3].AsInteger;
  FDSUser.Close;

  lbPersonalNr.Caption := ' Personal N°: ' + PERSONALNR;
  lbName.Caption := ' Benutzername: ' + LASTNAME + ', ' + FIRSTNAME;
  sptUrlaub.value := VACATIONDAYS;

  // ERROR = 0;  | Alles OK
  // ERROR = -1; | Existieren Keine Daten
  // ERROR = -2; | User hat das Jahr nicht abgeschlossen
  // ERROR = -3; | Admin hat das Jahr nicht abgeschlossen

  FDSUserData.Prepare;
  FDSUserData.Params[0].AsInteger := FUSER_ID;
  FDSUserData.Params[1].AsInteger := FYear;
  FDSUserData.OpenOrExecute;
  vERROR := FDSUserData.Fields[0].AsInteger;
  VACATIONDAYSLASTYEAR := FDSUserData.Fields[2].AsInteger;
  LASTYEARMINUTES := FDSUserData.Fields[3].AsInteger;
  FDSUserData.Close;

  sptStunden.value := LASTYEARMINUTES div 60;
  sptMinuten.value := LASTYEARMINUTES mod 60;

  AImage := TdxSmartImage.Create;
  try
    case vERROR of
      0:
        begin
          pnlInfo.Color := $00E1FFE1;
          lbInfo.Caption := rsError0;
          dmStyle.imlInfo.GetImage(0, AImage);
        end;
      1:
        begin
          pnlInfo.Color := $00E1FFE1;
          lbInfo.Caption := rsError1;
          dmStyle.imlInfo.GetImage(1, AImage);
        end;
      2:
        begin
          pnlInfo.Color := $00EEEEEE;
          lbInfo.Caption := rsError2;
          dmStyle.imlInfo.GetImage(2, AImage);
          DisableControls(gbUrlaub, False);
          DisableControls(gbUebertrag, False);
          DisableControls(gbLastCheck, False);
          btnCancel.Default := True;
        end;
      3:
        begin
          pnlInfo.Color := $00EEEEEE;
          lbInfo.Caption := rsError3;
          dmStyle.imlInfo.GetImage(2, AImage);
          DisableControls(gbUrlaub, False);
          DisableControls(gbUebertrag, False);
          DisableControls(gbLastCheck, False);
          btnCancel.Default := True;

        end;
    end;

    imgInfo.Picture.Assign(AImage);
  finally
    AImage.Free;

  end;

  gbUebertrag.Caption := Format(rsStunden, [FYear - 1]);
  lbanspruch.Caption := Format(rsUrlaub, [FYear]);
  lbRestUrlaub.Caption := Format(rsRest, [FYear - 1]);

  lbResultStd.Caption := Format(rsResultStd, [FYear]);
  lbResulTage.Caption := Format(rsResulTage, [FYear]);

  myDate := EndOfAMonth(FYear - 1, 12); // last day of the year(
  wert1 := 99;
  wert2 := 200;
end;

end.
