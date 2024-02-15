object frmUser: TfrmUser
  Left = 0
  Top = 0
  Caption = 'frmUser'
  ClientHeight = 568
  ClientWidth = 1058
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object cxTabControl1: TcxTabControl
    Left = 0
    Top = 47
    Width = 1058
    Height = 474
    Align = alClient
    TabOrder = 1
    Properties.CustomButtons.Buttons = <>
    Properties.TabHeight = 30
    Properties.TabIndex = 0
    Properties.TabPosition = tpBottom
    Properties.Tabs.Strings = (
      'Januar'
      'Februar'
      'M'#228'rz'
      'April'
      'Mai'
      'Juni'
      'Juli'
      'August'
      'September'
      'Oktober'
      'November'
      'Dezember')
    ExplicitWidth = 1054
    ExplicitHeight = 473
    ClientRectBottom = 438
    ClientRectLeft = 4
    ClientRectRight = 1054
    ClientRectTop = 4
    object cxGrid1: TcxGrid
      Left = 4
      Top = 4
      Width = 1050
      Height = 434
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 3
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = True
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = True
        Navigator.Buttons.GotoBookmark.Visible = True
        Navigator.Buttons.Filter.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Appending = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 25
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
        object cxGrid1DBTableView1RecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          DataBinding.IsNullValueType = True
          Visible = False
        end
        object cxGrid1DBTableView1DayName: TcxGridDBColumn
          DataBinding.FieldName = 'DayName'
          DataBinding.IsNullValueType = True
          Width = 70
        end
        object cxGrid1DBTableView1DayNr: TcxGridDBColumn
          DataBinding.FieldName = 'DayNr'
          DataBinding.IsNullValueType = True
          Width = 70
        end
        object cxGrid1DBTableView1Feiertag: TcxGridDBColumn
          DataBinding.FieldName = 'Feiertag'
          DataBinding.IsNullValueType = True
          Width = 90
        end
        object cxGrid1DBTableView1Code: TcxGridDBColumn
          DataBinding.FieldName = 'Code'
          DataBinding.IsNullValueType = True
          Width = 82
        end
        object cxGrid1DBTableView1Rest: TcxGridDBColumn
          DataBinding.FieldName = 'Rest'
          DataBinding.IsNullValueType = True
          Width = 84
        end
        object cxGrid1DBTableView1Bemerkung: TcxGridDBColumn
          DataBinding.FieldName = 'Bemerkung'
          DataBinding.IsNullValueType = True
          Width = 144
        end
        object cxGrid1DBTableView1Saldo: TcxGridDBColumn
          DataBinding.FieldName = 'Saldo'
          DataBinding.IsNullValueType = True
          Width = 75
        end
        object cxGrid1DBTableView1In1: TcxGridDBColumn
          DataBinding.FieldName = 'In1'
          DataBinding.IsNullValueType = True
          Width = 116
        end
        object cxGrid1DBTableView1Out1: TcxGridDBColumn
          DataBinding.FieldName = 'Out1'
          DataBinding.IsNullValueType = True
          Width = 117
        end
        object cxGrid1DBTableView1test: TcxGridDBColumn
          DataBinding.FieldName = 'test'
          DataBinding.IsNullValueType = True
          Width = 115
        end
        object cxGrid1DBTableView1Color: TcxGridDBColumn
          DataBinding.FieldName = 'Color'
          DataBinding.IsNullValueType = True
        end
      end
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Bands = <
          item
          end>
        object cxGrid1DBBandedTableView1ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID'
          DataBinding.IsNullValueType = True
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Bundesland: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Bundesland'
          DataBinding.IsNullValueType = True
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Feiertag: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Feiertag'
          DataBinding.IsNullValueType = True
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Datum: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Datum'
          DataBinding.IsNullValueType = True
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Hinweis: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Hinweis'
          DataBinding.IsNullValueType = True
          Width = 654
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object dxPanel1: TdxPanel
    AlignWithMargins = True
    Left = 3
    Top = 524
    Width = 1052
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 523
    ExplicitWidth = 1048
  end
  object dxPanel2: TdxPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1052
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1048
  end
end
