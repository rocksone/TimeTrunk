// ---------------------------------------------------------------------------------------------------------------------
// UNIT          : GlobalVars_u;
// PURPOSE       : Save Variables and Constans
// CREATE AUTOR  : Robert Feick
// CO-AUTOR      :
// DATE          : 04.08.2023
// ---------------------------------------------------------------------------------------------------------------------
unit xGlobalVars_u;

interface

uses
  SysUtils,
  Windows;

const
  cAppName = '[T]ime';
  cAppNamePro = '[T]ime Pro';
  cRegistred = ' (R)';
  cUnRegistred = '- Unregistriert!';
  cAppKey = '[T]ime';
  cAppAutor = 'Robert Feick';
  cAppEmail = 'info@rocksoft.de';
  cAppUrl = 'www.rocksoft.de';
  cAppData = 'RockSoft\THETIME';
  // FIREDAC -------------------------------------------------------------------
  cDBFilename = 'THETIME.FDB';
  cDBUser = 'SYSDBA';
  cDBPass = 'R0ck#masterkey';
  cDBCharacterSet = 'UTF8';
  cDBDriverID = 'FB';
  cUserConfDir = 'USERCONF';
  cBackupDir = 'BACKUP';
  cSync = 'SYNCHRONIZE';

  // CODE CONST

 //
  cFeiertag = 1;
  cFeiertagHalb = 2;
  cArbeitstag = 3;
  cFreierTag = 4;
  cGleittag = 5;
  cKrank = 6;
  cKrankRest = 7;
  cKurzarbeit = 8;
  cKurzarbeitRest = 9;
  cUrlaubsantrag = 10;
  cUrlaubsantragHalb = 11;
  cUrlaub = 12;
  cUrlaubHalb = 13;
  cHomeoffice = 14;
  cBereitschaft = 15;
  cBenutzerLater = 16;
  cSamstag = 17;
  cSonntag = 18;

Type
  // ----------------------------------------------------------------------------
  // dd = (d)b (d)river
  // ----------------------------------------------------------------------------
  TDBDriver = (ddMySQL, ddFirebird, ddPostgress);
  // ----------------------------------------------------------------------------
  // Windows TYPE
  // ----------------------------------------------------------------------------
  TWindowsType = (wtNone, // Reset
    wtMDI, // MDI
    wtModal); // Modal

  // ----------------------------------------------------------------------------
  // Windows MODE
  // ----------------------------------------------------------------------------
  TWinMode = (WinModeNone, // Reset
    WinModeSelect, // Reine Selection
    WinModeEdit, // Nur Relevanten elementen für das editieren
    WinModeInsert, // Insert ein Neuen Record
    WinModeFull // Werden alle Steuerelemente angezeigt
    );

  TAPPVars = class
  strict private
    class var AppVar: TAPPVars;
  private
    procedure initAppVar();
    class function GetInstance: TAPPVars; static;
    constructor Create;
    class destructor Destroy;
  protected
  public
    //
    // DIRECTORY ---------------------------------------------------------------
    DIR_AppDir: String; // Application Directory
    DIR_PerAppData: String;
    // CSIDL_APPDATA          | Eigene Einstellungen 	    | C:\Users\<user>\AppData\Roaming 	Nur Benutzer <user> 	Versteckt, geeignet für Konfiguration
    DIR_PerDocuments: String; // CSIDL_PERSONAL         | Eigene Dokumente 	        | C:\Users\<user>\Documents 	Nur Benutzer <user> 	Sichtbar
    DIR_ComAppData: String; // CSIDL_COMMON_APPDATA   | Öffentliche Einstellungen | C:\ProgramData 	Alle Benutzer 	Versteckt, geeignet für Konfiguration
    DIR_ComDocuments: String; // CSIDL_COMMON_DOCUMENTS | Öffentliche Dokumente 	  | C:\Users\Public\Documents 	Alle Benutzer 	Sichtbar
    //
    // DATABASE ----------------------------------------------------------------
    DB_Server: string;
    DB_Database: string; // Database name
    DB_User: string;
    DB_Password: string;
    DB_Port: string;
    DB_Protocol: string; // 'TCPIP';
    DB_Post: Boolean;
    DB_DriverLink: string; // = 'FB';
    // ADMIN     ----------------------------------------------------------------
     IsAdmin : Boolean;
    //
    // USER     ----------------------------------------------------------------
    USER_Autoedit: Boolean;
    USER_AutoSave: Boolean;
    USER_CaseUp: Boolean;
    USER_Language: String;
    USER_AutoClose: Boolean; // Beenden ohne bestätigung
    USER_SaveChanges: Boolean; // Speichert änderung Map an/aus etc
    USER_PrioED: Integer; // USER_PrioED = USER_PrioE(dit)S(elect)  Ist eine Prio für Fenster mit Edit oder Select, PRIORITÄT = 0: Edit | 1: Select
    //
    // SESSION  ----------------------------------------------------------------
    SESS_User_ID, SESS_Initiate: Boolean;
    SESS_Exit: Boolean;
    SESS_ERROR: Boolean;
    //
    // SYSTEM   ----------------------------------------------------------------
    SYS_AppName: string;
    SYS_COUNTRY_ID, // DEFAULT = 57
    SYS_COUNTRYHOL,
    SYS_LNG_ID: Integer; // default = 32
    SYS_Type, // 1 Basic // 2 PRO
    SYS_TypeStatus: SmallInt; // 0 Keine meldung, 1 Version Downgrade, 2 Version Update
    SYS_DBVersion: String;
    SYS_AutoLogin: Byte; // 0 aus | 1 Login Fenster Aktivieren
    SYS_LastBackup: TDateTime;
    SYS_BackupInterval: Byte; // In Tage
    SYS_BackupMode: Byte; // 0 Aus, 1 beim Start, 2 beim beeden, 3 Start und End
    // STYLE & COLORS ----------------------------------------------------------
    // WINDOWS CONTROL ---------------------------------------------------------
    WIN_Type: TWindowsType;
    WIN_EditMode: TWinMode;
    WIN_Paramt: Integer;
    WIN_ID: Integer;
    WIN_Guid: Tguid;
    // EXCEL
    USERYEAR_ID: Integer;
    USER_ID: Integer;
    UYEAR: Integer;
    UMONTH: Integer;
    UVACATIONDAYSNewYEAR: variant;
    UVACATIONDAYSLASTYEAR: variant;
    ULASTYEARMINUTES: variant;
    ULASTMONTH: variant;
    UCumulativTime: Integer;
  end;

resourcestring
  rs_sysSave = 'Möchten Sie, die %s änderung speichern?';

var
  APP: TAPPVars;

implementation

constructor TAPPVars.Create;
begin
  initAppVar;
end;

procedure TAPPVars.initAppVar();
begin
  DB_Database := cDBFilename;
  DB_User := cDBUser;
  DB_Password := 'R0ck#masterkey';
  DB_Server := 'Localhost';
  DB_Port := '3050';
  DB_Protocol := 'TCPIP';
  DB_Post := False;
  //
  // CONFIG   ------------------------------------------------------------------
  //
  // USER     ------------------------------------------------------------------
  USER_Autoedit := true;
  USER_AutoSave := true;
  USER_CaseUp := true;
  //
  // SESSION  ------------------------------------------------------------------
  SESS_Initiate := true;
  SESS_Exit := False;
  SESS_ERROR := False;
  //
  // SYSTEM   ------------------------------------------------------------------
  SYS_DBVersion := '0';
  SYS_AutoLogin := 0;
  //
  // LANGUAGE -------------------------------------------------------------------
  SYS_LNG_ID := 32; // German
  SYS_COUNTRY_ID := 57; // Germany
  SYS_COUNTRYHOL := 57; // Germany

end;

class function TAPPVars.GetInstance: TAPPVars;
begin
  if not assigned(AppVar) then
    AppVar := TAPPVars.Create;
  Result := AppVar;
end;

class destructor TAPPVars.Destroy;
begin
  if assigned(AppVar) then
  begin
    FreeAndNil(AppVar);
  end;
end;

initialization

APP := TAPPVars.GetInstance;

end.
