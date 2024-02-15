// ---------------------------------------------------------------------------------------------------------------------
//  UNIT          : GlobalVars_u;
//  PURPOSE       : Management for Style & Images
//  CREATE AUTOR  : Robert Feick & Göksel Yücel
//  CO-AUTOR      :
//  DATE          : 04.08.2023
// ---------------------------------------------------------------------------------------------------------------------
unit dmStyle_u;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Controls, dxCore, dxSpellCheckerCore, dxScreenTip, cxLookAndFeelPainters, cxGraphics, cxImageList, dxAlertWindow,
  cxEdit, cxContainer, dxCustomHint, cxHint, dxSpellChecker, cxLookAndFeels, dxSkinsForm, cxLocalization, cxClasses,
  cxStyles, cxEditRepositoryItems, cxGridTableView, cxGridBandedTableView,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, cxImageComboBox, cxLabel, dxSkinsCore, dxSkinTheBezier, cxDBEditRepository, cxExtEditRepositoryItems;

type
  TdmStyle = class(TDataModule)
    sr: TcxStyleRepository;
    str: TdxScreenTipRepository;
    localizer: TcxLocalizer;
    skincontroll: TdxSkinController;
    spell: TdxSpellChecker;
    hsc: TcxHintStyleController;
    er: TcxEditRepository;
    awm: TdxAlertWindowManager;
    imlButtons: TcxImageList;
    stylecEditReq: TcxEditStyleController;
    stylecEdit: TcxEditStyleController;
    styleLabel: TcxEditStyleController;
    styleTitle: TcxEditStyleController;
    stySone_FormBC: TcxStyle;
    imlControl: TcxImageList;
    stEditROnly: TcxEditStyleController;
    cxEditStyleController1: TcxEditStyleController;
    styleDevelop: TcxEditStyleController;
    GDTV: TcxGridTableViewStyleSheet;
    gdBackground: TcxStyle;
    gdContent: TcxStyle;
    gdContentEven: TcxStyle;
    gdContenOdd: TcxStyle;
    gdFilterBox: TcxStyle;
    gdFooter: TcxStyle;
    gdGroup: TcxStyle;
    gdGroupByBox: TcxStyle;
    gdHeader: TcxStyle;
    gdInavtive: TcxStyle;
    gdIncSearch: TcxStyle;
    gdIndicator: TcxStyle;
    gdPreview: TcxStyle;
    gdSelection: TcxStyle;
    GDBandedTV: TcxGridBandedTableViewStyleSheet;
    GridViewRepository: TcxGridViewRepository;
    TVconClientList: TcxGridDBTableView;
    TVconClientListContactArt: TcxGridDBColumn;
    TVconClientListMatchCode: TcxGridDBColumn;
    TVconClientListContactNr: TcxGridDBColumn;
    TVconClientListExternNr: TcxGridDBColumn;
    TVconClientListClient: TcxGridDBColumn;
    TVconClientListCounty: TcxGridDBColumn;
    TVconClientListPC: TcxGridDBColumn;
    TVconClientListCity: TcxGridDBColumn;
    TVconClientListVatIDNr: TcxGridDBColumn;
    TVconClientListTaxNumber: TcxGridDBColumn;
    icbStatus: TcxEditRepositoryImageComboBoxItem;
    TVconClientListStatus: TcxGridDBColumn;
    TVconClientListProcess: TcxGridDBColumn;
    TVconVendorList: TcxGridDBTableView;
    TVconVendorListContactArt: TcxGridDBColumn;
    TVconVendorListMatchCode: TcxGridDBColumn;
    TVconVendorListContactNr: TcxGridDBColumn;
    TVconVendorListExternNr: TcxGridDBColumn;
    TVconVendorListClient: TcxGridDBColumn;
    TVconVendorListCounty: TcxGridDBColumn;
    TVconVendorListPC: TcxGridDBColumn;
    TVconVendorListCity: TcxGridDBColumn;
    TVconVendorListVatIDNr: TcxGridDBColumn;
    TVconVendorListTaxNumber: TcxGridDBColumn;
    TVconVendorListProcess: TcxGridDBColumn;
    TVconVendorListStatus: TcxGridDBColumn;
    stySone_TopPanel_BC: TcxStyle;
    stySone_BotPanel_BC: TcxStyle;
    icbActive: TcxEditRepositoryImageComboBoxItem;
    DateNoYear: TcxEditRepositoryDateItem;
    curCost: TcxEditRepositoryCurrencyItem;
    cbCountryShort: TcxEditRepositoryLookupComboBoxItem;
    cbCountryLong: TcxEditRepositoryLookupComboBoxItem;
    cbWorkinggroup: TcxEditRepositoryLookupComboBoxItem;
    timeWorkTime: TcxEditRepositoryTimeItem;
    cbStateShort: TcxEditRepositoryLookupComboBoxItem;
    cbLanguage: TcxEditRepositoryLookupComboBoxItem;
    cbState: TcxEditRepositoryLookupComboBoxItem;
    cxSonday: TcxStyle;
    cxSaturday: TcxStyle;
    imlCodes: TcxImageList;
    HoursCount: TcxEditRepositoryTimeItem;
    cxWorkDay: TcxStyle;
    curCostNullString: TcxEditRepositoryCurrencyItem;
    cxHoliday: TcxStyle;
    cxHoliExtra: TcxStyle;
    erTimeLabel: TcxEditRepositoryLabel;
    cxPlus: TcxStyle;
    cxMinus: TcxStyle;
    icbPlusMinus: TcxEditRepositoryImageComboBoxItem;
    imlInfo: TcxImageList;
    cxNoActive: TcxStyle;
    cxFreeDay: TcxStyle;
    icbCodes: TcxEditRepositoryImageComboBoxItem;
    icbDayCode: TcxEditRepositoryImageComboBoxItem;
    cxGleitTag: TcxStyle;
    cxUrlaub: TcxStyle;
    cxUrlaubHalb: TcxStyle;
    cxKrank: TcxStyle;
    cxKrankRest: TcxStyle;
    cxKurzArbeit: TcxStyle;
    cxUrlaubAntrag: TcxStyle;
    cxUrlaubAntragHalb: TcxStyle;
    cxBereitschaft: TcxStyle;
    cxHomeOffice: TcxStyle;
    cxKurzArbeitRest: TcxStyle;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  dmStyle: TdmStyle;

implementation

//uses
//--  dmDatabase_u;

{$R *.dfm}

end.
