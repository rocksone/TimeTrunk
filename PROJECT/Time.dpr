program Time;

uses
  Vcl.Forms,
  main_u in 'UNITS\main_u.pas' {frmMain},
  dmDatabase_u in 'DM\dmDatabase_u.pas' {dmDatabase: TDataModule},
  dmStyle_u in 'DM\dmStyle_u.pas' {dmStyle: TDataModule},
  xrsDatabase_u in 'COM\xrsDatabase_u.pas',
  xrsDevExp_u in 'COM\xrsDevExp_u.pas',
  xrsFiles_u in 'COM\xrsFiles_u.pas',
  xrsResourcestring_u in 'COM\xrsResourcestring_u.pas',
  xrsSystem_u in 'COM\xrsSystem_u.pas',
  xrsWin_u in 'COM\xrsWin_u.pas',
  admin in 'UNITS\admin.pas' {frmAdmin},
  xGlobalVars_u in 'UNITS\xGlobalVars_u.pas',
  User_u in 'UNITS\User_u.pas' {frmUser},
  fmSplashScreen_u in 'UNITS\fmSplashScreen_u.pas' {fmSplashScreen},
  frmUebertrag_u in 'UNITS\frmUebertrag_u.pas' {frmUebertrag},
  xrsMath_u in 'COM\xrsMath_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TdmStyle, dmStyle);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
