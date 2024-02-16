object frmUser: TfrmUser
  Left = 0
  Top = 0
  Caption = 'frmUser'
  ClientHeight = 563
  ClientWidth = 1437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlMain: TdxPanel
    Left = 0
    Top = 0
    Width = 1437
    Height = 563
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1433
    ExplicitHeight = 562
    object pnlTop: TdxPanel
      Left = 0
      Top = 0
      Width = 1435
      Height = 31
      Align = alTop
      Frame.Borders = []
      TabOrder = 0
      ExplicitWidth = 1431
      object cxButton7: TcxButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 25
        Height = 25
        Align = alLeft
        PaintStyle = bpsGlyph
        SpeedButtonOptions.CanBeFocused = False
        TabOrder = 0
        OnClick = cxButton7Click
      end
    end
    object pnlBtn: TdxPanel
      AlignWithMargins = True
      Left = 3
      Top = 527
      Width = 1429
      Height = 31
      Align = alBottom
      TabOrder = 2
      Visible = False
      ExplicitTop = 526
      ExplicitWidth = 1425
    end
    object tcMonths: TcxTabControl
      Left = 0
      Top = 31
      Width = 1435
      Height = 493
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
        'Dezember'
        'Jahres'#252'bersicht')
      OnChange = tcMonthsChange
      ExplicitWidth = 1431
      ExplicitHeight = 492
      ClientRectBottom = 457
      ClientRectLeft = 4
      ClientRectRight = 1431
      ClientRectTop = 4
      object GDExcel: TcxGrid
        Left = 4
        Top = 4
        Width = 1427
        Height = 453
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1423
        ExplicitHeight = 452
        object TVExcel: TcxGridDBTableView
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
          DataController.DataSource = dmDatabase.dsExcel
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 24
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderHeight = 45
          Styles.OnGetContentStyle = TVExcelStylesGetContentStyle
          object TVExcelUSERYEARDAT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'USERYEARDAT_ID'
            Visible = False
            VisibleForCustomization = False
            Width = 99
          end
          object TVExcelUSERYEAR_ID: TcxGridDBColumn
            DataBinding.FieldName = 'USERYEAR_ID'
            Visible = False
            VisibleForCustomization = False
            Width = 83
          end
          object TVExcelDAYNAME: TcxGridDBColumn
            Caption = 'WOCHEN TAG'
            DataBinding.FieldName = 'DAYNAME'
            MinWidth = 90
            Options.Editing = False
            Options.Focusing = False
            Width = 90
          end
          object TVExcelUDAY: TcxGridDBColumn
            Caption = 'TAG'
            DataBinding.FieldName = 'UDAY'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 35
            Options.Editing = False
            Options.Focusing = False
            Width = 35
          end
          object TVExcelDAYCODE: TcxGridDBColumn
            DataBinding.FieldName = 'DAYCODE'
            RepositoryItem = dmStyle.icbDayCode
            MinWidth = 105
          end
          object TVExcelcalcDayType: TcxGridDBColumn
            DataBinding.FieldName = 'calcDayType'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.AutoSelect = False
            Properties.HideSelection = False
            Properties.ReadOnly = True
            OnCustomDrawCell = TVExcelcalcDayTypeCustomDrawCell
            Options.Editing = False
            Options.Focusing = False
          end
          object TVExcelHOLLYDAY: TcxGridDBColumn
            Caption = 'FEIERTAG'
            DataBinding.FieldName = 'HOLIDAY'
            MinWidth = 100
            Options.Editing = False
            Options.Focusing = False
            Width = 100
          end
          object TVExcelCOMES1: TcxGridDBColumn
            Caption = 'KOMMT 1'
            DataBinding.FieldName = 'COMES1'
            RepositoryItem = dmStyle.timeWorkTime
            HeaderAlignmentHorz = taCenter
            MinWidth = 66
            Width = 66
          end
          object TVExcelGOES1: TcxGridDBColumn
            Caption = 'GEHT 1'
            DataBinding.FieldName = 'GOES1'
            RepositoryItem = dmStyle.timeWorkTime
            HeaderAlignmentHorz = taCenter
            MinWidth = 66
            Width = 66
          end
          object TVExcelCOMES2: TcxGridDBColumn
            Caption = 'KOMMT 2'
            DataBinding.FieldName = 'COMES2'
            RepositoryItem = dmStyle.timeWorkTime
            HeaderAlignmentHorz = taCenter
            MinWidth = 66
            Width = 66
          end
          object TVExcelGOES2: TcxGridDBColumn
            Caption = 'GEHT 2'
            DataBinding.FieldName = 'GOES2'
            RepositoryItem = dmStyle.timeWorkTime
            HeaderAlignmentHorz = taCenter
            MinWidth = 66
            Width = 66
          end
          object TVExcelPAUSE: TcxGridDBColumn
            DataBinding.FieldName = 'PAUSE'
            RepositoryItem = dmStyle.timeWorkTime
            HeaderAlignmentHorz = taCenter
            MinWidth = 66
            Width = 66
          end
          object TVExcelCODE: TcxGridDBColumn
            DataBinding.FieldName = 'CODE'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.ImmediatePost = True
            Properties.Items = <>
            Properties.OnEditValueChanged = TVExcelCODEPropertiesEditValueChanged
            RepositoryItem = dmStyle.icbCodes
            MinWidth = 100
            Styles.Header = dmStyle.cxPlus
            Width = 100
          end
          object TVExcelcalcIsTime: TcxGridDBColumn
            Caption = 'IST ARBEITSZEIT'
            DataBinding.FieldName = 'calcIsTime'
            PropertiesClassName = 'TcxLabelProperties'
            RepositoryItem = dmStyle.erTimeLabel
            HeaderAlignmentHorz = taCenter
            MinWidth = 90
            Options.Editing = False
            Options.Focusing = False
            Width = 90
          end
          object TVExcelUHOURS: TcxGridDBColumn
            Caption = 'SOLL ARBEITZEIT'
            DataBinding.FieldName = 'UHOURS'
            RepositoryItem = dmStyle.erTimeLabel
            HeaderAlignmentHorz = taCenter
            MinWidth = 90
            Options.Editing = False
            Options.Focusing = False
            Width = 90
          end
          object TVExcelcalcHourDiff: TcxGridDBColumn
            Caption = '+/-'
            DataBinding.FieldName = 'calcHourDiff'
            RepositoryItem = dmStyle.erTimeLabel
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.Editing = False
            Options.Focusing = False
          end
          object TVExcelNOTE: TcxGridDBColumn
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 236
          end
          object TVExcelHOLIDAY_ID: TcxGridDBColumn
            DataBinding.FieldName = 'HOLIDAY_ID'
            Visible = False
            VisibleForCustomization = False
          end
          object TVExcelFCOST: TcxGridDBColumn
            DataBinding.FieldName = 'FCOST'
            Visible = False
            VisibleForCustomization = False
          end
          object TVExcelcalcHourCount: TcxGridDBColumn
            Caption = 'AKTUELL +/-'
            DataBinding.FieldName = 'calcHourCount'
            RepositoryItem = dmStyle.erTimeLabel
            HeaderAlignmentHorz = taCenter
            MinWidth = 75
            Options.Editing = False
            Options.Focusing = False
          end
        end
        object cxGridDBBandedTableView1: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
          object cxGridDBBandedColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            DataBinding.IsNullValueType = True
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Bundesland'
            DataBinding.IsNullValueType = True
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Feiertag'
            DataBinding.IsNullValueType = True
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Datum'
            DataBinding.IsNullValueType = True
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGridDBBandedColumn5: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Hinweis'
            DataBinding.IsNullValueType = True
            Width = 654
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object LVExcel: TcxGridLevel
          GridView = TVExcel
        end
      end
    end
  end
  object FDSHours: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'P_GET_DIFF_USER'
    Left = 30
    Top = 432
    ParamData = <
      item
        Position = 1
        Name = 'VDAY'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'VUSERYEAR_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'RESULT'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object FDSUserData: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'P_CHECK_PREVIOUS_YEAR'
    Left = 102
    Top = 432
    ParamData = <
      item
        Position = 1
        Name = 'VUSER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'VYEAR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'ERROR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'VACATIONDAYS'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 5
        Name = 'VACATIONDAYSLASTYEAR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'LASTYEARMINUTES'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object FDgetDay: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'P_GETHOURSFROMDATE_TEST'
    Left = 206
    Top = 432
    ParamData = <
      item
        Position = 1
        Name = 'VDATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'VUSERYEAR_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'FCOST'
        DataType = ftBCD
        Precision = 1
        NumericScale = 1
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'RHOURS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
end
