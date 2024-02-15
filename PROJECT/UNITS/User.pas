unit User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxGeometry, dxFramedControl, dxPanel,
  cxPC, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmUser = class(TForm)
    cxTabControl1: TcxTabControl;
    dxPanel1: TdxPanel;
    dxPanel2: TdxPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
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
    cxGrid1DBTableView1Color: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Bundesland: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Feiertag: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Datum: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Hinweis: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmUser: TfrmUser;

implementation

uses
  dmDatabase_u, dmStyle_u;

{$R *.dfm}

end.
