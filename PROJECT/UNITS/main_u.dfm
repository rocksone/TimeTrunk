object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 775
  ClientWidth = 1235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 1235
    Height = 327
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1239
    ExplicitHeight = 328
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
      DataController.DataSource = DataSource1
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
        RepositoryItem = cxEditRepository1TimeItem1
        Width = 116
      end
      object cxGrid1DBTableView1Out1: TcxGridDBColumn
        DataBinding.FieldName = 'Out1'
        DataBinding.IsNullValueType = True
        RepositoryItem = cxEditRepository1TimeItem1
        Width = 117
      end
      object cxGrid1DBTableView1test: TcxGridDBColumn
        DataBinding.FieldName = 'test'
        DataBinding.IsNullValueType = True
        RepositoryItem = cxEditRepository1TimeItem1
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
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
        end>
      object cxGrid1DBBandedTableView1ID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'ID'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Bundesland: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Bundesland'
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Feiertag: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Feiertag'
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Datum: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Datum'
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Hinweis: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Hinweis'
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
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 1235
    Height = 350
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 426
    ExplicitWidth = 1239
    object cxTimeEdit1: TcxTimeEdit
      Left = 16
      Top = 13
      EditValue = 0.416666666666667d
      Properties.Nullstring = '00;00'
      Properties.TimeFormat = tfHourMin
      Properties.UseNullString = True
      TabOrder = 2
      Width = 57
    end
    object cxTimeEdit2: TcxTimeEdit
      Left = 79
      Top = 13
      EditValue = 0.520833333333333d
      Properties.TimeFormat = tfHourMin
      TabOrder = 3
      Width = 66
    end
    object cxTimeEdit3: TcxTimeEdit
      Left = 151
      Top = 13
      EditValue = 0.104166666666667d
      Properties.TimeFormat = tfHourMin
      TabOrder = 4
      Width = 58
    end
    object cxButton1: TcxButton
      Left = 215
      Top = 12
      Width = 34
      Height = 25
      Caption = 'Calc'
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 576
      Top = 4
      Width = 663
      Height = 342
      Align = alRight
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitLeft = 572
    end
    object cxButton5: TcxButton
      Left = 16
      Top = 73
      Width = 375
      Height = 25
      Caption = 'cxButton5'
      TabOrder = 9
      OnClick = cxButton5Click
    end
    object cxButton6: TcxButton
      Left = 16
      Top = 104
      Width = 375
      Height = 25
      Caption = 'cxButton6'
      TabOrder = 11
      OnClick = cxButton6Click
    end
    object cxTimeEdit4: TcxTimeEdit
      Left = 263
      Top = 14
      EditValue = 0.333333333333333d
      Properties.TimeFormat = tfHourMin
      TabOrder = 5
      Width = 58
    end
    object cxTimeEdit5: TcxTimeEdit
      Left = 327
      Top = 14
      Properties.TimeFormat = tfHourMin
      TabOrder = 6
      Width = 58
    end
    object cxMaskEdit1: TcxMaskEdit
      Left = 447
      Top = 15
      TabOrder = 7
      Text = 'cxMaskEdit1'
      Width = 121
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 447
      Top = 44
      TabOrder = 8
      Width = 121
    end
    object cxButton4: TcxButton
      Left = 447
      Top = 73
      Width = 120
      Height = 25
      Caption = 'decode'
      TabOrder = 10
      OnClick = cxButton4Click
    end
    object cxButton8: TcxButton
      Left = 447
      Top = 160
      Width = 75
      Height = 25
      Caption = 'cxButton8'
      TabOrder = 16
    end
    object cxCurrencyEdit2: TcxCurrencyEdit
      Left = 446
      Top = 104
      TabOrder = 12
      Width = 121
    end
    object cxCurrencyEdit3: TcxCurrencyEdit
      Left = 446
      Top = 131
      TabOrder = 13
      Width = 121
    end
    object cxButton9: TcxButton
      Left = 16
      Top = 135
      Width = 75
      Height = 25
      Caption = 'Dialog'
      TabOrder = 14
      OnClick = cxButton9Click
    end
    object cxButton10: TcxButton
      Left = 272
      Top = 152
      Width = 75
      Height = 25
      Caption = #220'bertrag'
      ModalResult = 1
      TabOrder = 15
      OnClick = cxButton10Click
    end
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 0
    Top = 400
    Width = 1235
    Height = 25
    Buttons.CustomButtons = <>
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 401
    ExplicitWidth = 1239
  end
  object Panel2: TPanel
    Left = 0
    Top = 327
    Width = 1235
    Height = 73
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 328
    ExplicitWidth = 1239
    object cxDateEdit1: TcxDateEdit
      Left = 16
      Top = 16
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 0
      Width = 121
    end
    object cxButton2: TcxButton
      Left = 119
      Top = 16
      Width = 75
      Height = 25
      Caption = 'cxButton2'
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 184
      Top = 42
      Width = 107
      Height = 25
      Caption = 'Tage im Monat'
      TabOrder = 3
      OnClick = cxButton3Click
    end
    object save: TcxButton
      Left = 103
      Top = 42
      Width = 75
      Height = 25
      Caption = 'save'
      TabOrder = 2
      OnClick = saveClick
    end
  end
  object qryCalender: TdxMemData
    Indexes = <>
    SortOptions = []
    OnCalcFields = qryCalenderCalcFields
    Left = 72
    Top = 88
    object qryCalenderDayNr: TSmallintField
      FieldName = 'DayNr'
    end
    object qryCalenderFeiertag: TStringField
      FieldName = 'Feiertag'
      Size = 30
    end
    object qryCalenderCode: TSmallintField
      FieldName = 'Code'
    end
    object qryCalenderRest: TIntegerField
      FieldName = 'Rest'
    end
    object qryCalenderBemerkung: TStringField
      FieldName = 'Bemerkung'
      Size = 30
    end
    object qryCalenderSaldo: TIntegerField
      FieldName = 'Saldo'
    end
    object qryCalenderIn1: TTimeField
      FieldName = 'In1'
    end
    object qryCalenderOut1: TTimeField
      FieldName = 'Out1'
    end
    object qryCalendertest: TTimeField
      FieldKind = fkCalculated
      FieldName = 'test'
      Calculated = True
    end
    object qryCalenderColor: TSmallintField
      FieldName = 'Color'
    end
    object qryCalenderDayName: TStringField
      FieldName = 'DayName'
    end
  end
  object DataSource1: TDataSource
    DataSet = mtHollydays
    Left = 56
    Top = 272
  end
  object cxEditRepository1: TcxEditRepository
    Left = 160
    Top = 96
    PixelsPerInch = 96
    object cxEditRepository1TimeItem1: TcxEditRepositoryTimeItem
      Properties.AutoCorrectHours = False
      Properties.Circular = True
      Properties.ShowDate = True
      Properties.TimeFormat = tfHourMin
      Properties.ZeroIncrement = True
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 152
  end
  object mtHollydays: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 216
    object mtHollydaysID: TAutoIncField
      FieldName = 'ID'
    end
    object mtHollydaysBundesland: TStringField
      FieldName = 'Bundesland'
      Size = 50
    end
    object mtHollydaysFeiertag: TStringField
      FieldName = 'Feiertag'
      Size = 50
    end
    object mtHollydaysDatum: TDateField
      FieldName = 'Datum'
    end
    object mtHollydaysHinweis: TStringField
      FieldName = 'Hinweis'
      Size = 255
    end
  end
end
