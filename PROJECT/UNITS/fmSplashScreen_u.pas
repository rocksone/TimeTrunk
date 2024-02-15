unit fmSplashScreen_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxGeometry, dxFramedControl, cxContainer, cxEdit,
  dxGDIPlusClasses, cxImage, cxLabel, dxPanel;

type
  TfmSplashScreen = class(TForm)
    pnClient: TdxPanel;
    pnLogoArea: TdxPanel;
    cxlbAppName: TcxLabel;
    cxlbAppComent: TcxLabel;
    imLogoCompany: TcxImage;
    cxlbCopyRightYears: TcxLabel;
    cxlbInitializeMessage: TcxLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  fmSplashScreen: TfmSplashScreen;

implementation

{$R *.dfm}

end.
