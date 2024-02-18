object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'frmAdmin'
  ClientHeight = 657
  ClientWidth = 1123
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object PC: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 31
    Width = 1117
    Height = 623
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = tsCreateUserYear
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dmStyle.imlControl
    Properties.TabHeight = 35
    OnChange = PCChange
    ExplicitWidth = 1113
    ExplicitHeight = 622
    ClientRectBottom = 619
    ClientRectLeft = 4
    ClientRectRight = 1113
    ClientRectTop = 41
    object tsExcel: TcxTabSheet
      Caption = 'Benutzer Zeiten'
      ImageIndex = 21
      OnShow = tsExcelShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1105
      ExplicitHeight = 577
      object pnlLeftExcel: TdxPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 238
        Height = 572
        Margins.Right = 0
        Align = alLeft
        TabOrder = 1
        ExplicitHeight = 571
        object dxPanel11: TdxPanel
          Left = 0
          Top = 0
          Width = 236
          Height = 31
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object wpUserExcel: TdxDateTimeWheelPicker
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alClient
            ParentFont = False
            Properties.Wheels = [pwYear]
            Properties.OnChange = wpUserExcelPropertiesChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 25
            Width = 202
          end
          object cxButton5: TcxButton
            AlignWithMargins = True
            Left = 208
            Top = 3
            Width = 25
            Height = 25
            Margins.Left = 0
            Align = alRight
            Action = actAddHollidays
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 1
          end
        end
        object GDUserExcelList: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 31
          Width = 230
          Height = 536
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          ExplicitHeight = 535
          object TVUserExcelList: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsUserExcelList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVUserExcelListUSER_ID: TcxGridDBColumn
              DataBinding.FieldName = 'USER_ID'
              Visible = False
              VisibleForCustomization = False
            end
            object TVUserExcelListISO3166_1A2: TcxGridDBColumn
              Caption = 'LD'
              DataBinding.FieldName = 'ISO3166_1A2'
              HeaderHint = 'Land'
              MinWidth = 25
              Width = 25
            end
            object TVUserExcelListSTATESHORT: TcxGridDBColumn
              Caption = 'BL'
              DataBinding.FieldName = 'STATESHORT'
              HeaderHint = 'Bundesland'
              MinWidth = 25
            end
            object TVUserExcelListPERSONALNR: TcxGridDBColumn
              DataBinding.FieldName = 'PERSONALNR'
              Visible = False
            end
            object TVUserExcelListLASTFIRST: TcxGridDBColumn
              Caption = 'NAME'
              DataBinding.FieldName = 'LASTFIRST'
              HeaderHint = 'Benutzer'
            end
            object TVUserExcelListUSERYEAR_ID: TcxGridDBColumn
              DataBinding.FieldName = 'USERYEAR_ID'
            end
            object TVUserExcelListUYEAR: TcxGridDBColumn
              DataBinding.FieldName = 'UYEAR'
            end
          end
          object LVUserExcelList: TcxGridLevel
            GridView = TVUserExcelList
          end
        end
      end
      object cxSplitter4: TcxSplitter
        AlignWithMargins = True
        Left = 245
        Top = 0
        Width = 8
        Height = 578
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        HotZoneClassName = 'TcxXPTaskBarStyle'
        Control = pnlLeftExcel
        ExplicitHeight = 577
      end
    end
    object tsCreateUserYear: TcxTabSheet
      Caption = 'Jahreszeiten erzeugen'
      ImageIndex = 11
      OnShow = tsCreateUserYearShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlTVUserList: TdxPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 238
        Height = 572
        Margins.Right = 0
        Align = alLeft
        TabOrder = 0
        object dxPanel12: TdxPanel
          Left = 0
          Top = 0
          Width = 236
          Height = 31
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object wpUserYearCreate: TdxDateTimeWheelPicker
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alClient
            ParentFont = False
            Properties.Wheels = [pwYear]
            Properties.OnChange = wpUserYearCreatePropertiesChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 25
            Width = 202
          end
          object cxButton3: TcxButton
            AlignWithMargins = True
            Left = 208
            Top = 3
            Width = 25
            Height = 25
            Margins.Left = 0
            Align = alRight
            Action = actAddHollidays
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 1
          end
        end
        object GDUserList: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 31
          Width = 230
          Height = 536
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          object TVUserList: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsUserList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object cxGridDBColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'USER_ID'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = 'LD'
              DataBinding.FieldName = 'ISO3166_1A2'
              MinWidth = 25
              Width = 25
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = 'BL'
              DataBinding.FieldName = 'STATESHORT'
              MinWidth = 25
            end
            object cxGridDBColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'PERSONALNR'
              Visible = False
            end
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = 'NAME'
              DataBinding.FieldName = 'LASTFIRST'
            end
          end
          object LVUserList: TcxGridLevel
            GridView = TVUserList
          end
        end
      end
      object pnlTVUserSelet: TdxPanel
        AlignWithMargins = True
        Left = 244
        Top = 3
        Width = 865
        Height = 572
        Margins.Right = 0
        Align = alClient
        TabOrder = 1
        object dxPanel15: TdxPanel
          Left = 0
          Top = 0
          Width = 863
          Height = 31
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object Label1: TLabel
            Left = 72
            Top = 3
            Width = 500
            Height = 15
            Caption = 
              'Benutzer Zeiten f'#252'r neue mitarbeiter soll zeiten auf  0, setzen ' +
              'wenn die nicht am 01.01 anfangen'
          end
          object cxButton6: TcxButton
            AlignWithMargins = True
            Left = 31
            Top = 3
            Width = 25
            Height = 25
            Margins.Left = 0
            Align = alLeft
            Action = actAddAllUserYear
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 1
          end
          object cxButton7: TcxButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 25
            Height = 25
            Align = alLeft
            Action = actAddUserYear
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 0
          end
        end
        object GDUserSelect: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 31
          Width = 857
          Height = 536
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          object TVUserSelect: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsUserSelect
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
              end>
            DataController.Summary.SummaryGroups = <>
            EditForm.DefaultColumnCount = 8
            EditForm.ItemHotTrack = True
            EditForm.MasterRowDblClickAction = dcaShowEditForm
            EditForm.UseDefaultLayout = False
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVUserSelectUSER_ID: TcxGridDBColumn
              DataBinding.FieldName = 'USER_ID'
              LayoutItem = TVUserSelectLayoutItem1.Owner
              Width = 28
            end
            object TVUserSelectLASTNAME: TcxGridDBColumn
              DataBinding.FieldName = 'LASTNAME'
              LayoutItem = TVUserSelectLayoutItem5.Owner
              Width = 250
            end
            object TVUserSelectFIRSTNAME: TcxGridDBColumn
              DataBinding.FieldName = 'FIRSTNAME'
              LayoutItem = TVUserSelectLayoutItem4.Owner
              Width = 250
            end
            object TVUserSelectPERSONALNR: TcxGridDBColumn
              DataBinding.FieldName = 'PERSONALNR'
              LayoutItem = TVUserSelectLayoutItem2.Owner
              Width = 86
            end
            object TVUserSelectUSERNAME: TcxGridDBColumn
              DataBinding.FieldName = 'USERNAME'
              LayoutItem = TVUserSelectLayoutItem3.Owner
              Width = 127
            end
            object TVUserSelectISO3166_1A2: TcxGridDBColumn
              Caption = 'LD'
              DataBinding.FieldName = 'ISO3166_1A2'
              LayoutItem = TVUserSelectLayoutItem7.Owner
              Width = 42
            end
            object TVUserSelectSTATESHORT: TcxGridDBColumn
              Caption = 'BL'
              DataBinding.FieldName = 'STATE'
              LayoutItem = TVUserSelectLayoutItem8.Owner
              Width = 45
            end
            object TVUserSelectACTIVEX: TcxGridDBColumn
              DataBinding.FieldName = 'ACTIVEX'
              LayoutItem = TVUserSelectLayoutItem6.Owner
              Width = 27
            end
            object TVUserSelectRootGroup: TcxGridInplaceEditFormGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              CaptionOptions.Text = 'Template Layout'
              Hidden = True
              ShowBorder = False
              Index = -1
            end
            object TVUserSelectLayoutItem1: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem2: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem3: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem4: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem5: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem6: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem7: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
            object TVUserSelectLayoutItem8: TcxGridInplaceEditFormLayoutItem
              Index = -1
            end
          end
          object LVUserSelect: TcxGridLevel
            GridView = TVUserSelect
          end
        end
      end
    end
    object tsUser: TcxTabSheet
      Caption = 'Benutzer Liste'
      ImageIndex = 14
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlUser: TdxPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1106
        Height = 572
        Margins.Right = 0
        Align = alClient
        TabOrder = 0
        object dxPanel5: TdxPanel
          Left = 0
          Top = 0
          Width = 1104
          Height = 35
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object btnCopyUser: TcxButton
            AlignWithMargins = True
            Left = 146
            Top = 3
            Width = 150
            Height = 29
            Margins.Left = 0
            Align = alLeft
            Action = actUserCopy
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 1
          end
          object btnAddUser: TcxButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 140
            Height = 29
            Align = alLeft
            Action = actAddUser
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 0
          end
        end
        object GDUser: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 35
          Width = 1098
          Height = 532
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          object TVUser: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsUser
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
              end>
            DataController.Summary.SummaryGroups = <>
            EditForm.DefaultColumnCount = 8
            EditForm.ItemHotTrack = True
            EditForm.MasterRowDblClickAction = dcaShowEditForm
            EditForm.UseDefaultLayout = False
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.EditMode = emModalEditForm
            OptionsData.Appending = True
            OptionsData.DeletingConfirmation = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVUserUSER_ID: TcxGridDBColumn
              DataBinding.FieldName = 'USER_ID'
              Visible = False
            end
            object TVUserPERSONALNR: TcxGridDBColumn
              Caption = 'PERSONAL N'#176
              DataBinding.FieldName = 'PERSONALNR'
              LayoutItem = TVUserLayoutItem5.Owner
              Width = 85
            end
            object TVUserLASTNAME: TcxGridDBColumn
              Caption = 'NACHNAME'
              DataBinding.FieldName = 'LASTNAME'
              LayoutItem = TVUserLayoutItem9.Owner
              Width = 124
            end
            object TVUserFIRSTNAME: TcxGridDBColumn
              Caption = 'VORNAME'
              DataBinding.FieldName = 'FIRSTNAME'
              LayoutItem = TVUserLayoutItem8.Owner
              Width = 130
            end
            object TVUserWORKINGGROUP_ID: TcxGridDBColumn
              Caption = 'ARBEITSGRUPPE'
              DataBinding.FieldName = 'WORKINGGROUP_ID'
              RepositoryItem = dmStyle.cbWorkinggroup
              LayoutItem = TVUserLayoutItem4.Owner
              Width = 103
            end
            object TVUserUSTART: TcxGridDBColumn
              Caption = 'ANGESTELL SEIT'
              DataBinding.FieldName = 'USTART'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taRightJustify
              LayoutItem = TVUserLayoutItem12.Owner
              Width = 96
            end
            object TVUserVACATIONDAYS: TcxGridDBColumn
              Caption = 'URLAUBSTAGE'
              DataBinding.FieldName = 'VACATIONDAYS'
              LayoutItem = TVUserLayoutItem13.Owner
              Width = 92
            end
            object TVUserUSERNAME: TcxGridDBColumn
              Caption = 'BENUTZERNAME'
              DataBinding.FieldName = 'USERNAME'
              LayoutItem = TVUserLayoutItem6.Owner
              Width = 96
            end
            object TVUserEMAIL: TcxGridDBColumn
              DataBinding.FieldName = 'EMAIL'
              LayoutItem = TVUserLayoutItem10.Owner
              Width = 93
            end
            object TVUserLANGUAGE_ID: TcxGridDBColumn
              Caption = 'SPRACHE'
              DataBinding.FieldName = 'LANGUAGE_ID'
              RepositoryItem = dmStyle.cbLanguage
              LayoutItem = TVUserLayoutItem1.Owner
              Width = 78
            end
            object TVUserCOUNTRY_ID: TcxGridDBColumn
              Caption = 'LAND'
              DataBinding.FieldName = 'COUNTRY_ID'
              RepositoryItem = dmStyle.cbCountryLong
              LayoutItem = TVUserLayoutItem2.Owner
              Width = 89
            end
            object TVUserSTATE_ID: TcxGridDBColumn
              Caption = 'BUNDESLAND'
              DataBinding.FieldName = 'STATE_ID'
              RepositoryItem = dmStyle.cbState
              LayoutItem = TVUserLayoutItem3.Owner
              Width = 85
            end
            object TVUserUSERPASSWORD: TcxGridDBColumn
              DataBinding.FieldName = 'USERPASSWORD'
              Visible = False
              VisibleForExpressionEditor = bTrue
              LayoutItem = TVUserLayoutItem7.Owner
              VisibleForEditForm = bTrue
              VisibleForRowLayout = bTrue
              Width = 134
            end
            object TVUserUSER_CREATE_ID: TcxGridDBColumn
              DataBinding.FieldName = 'USER_CREATE_ID'
              Visible = False
            end
            object TVUserUSER_UPDATE_ID: TcxGridDBColumn
              DataBinding.FieldName = 'USER_UPDATE_ID'
              Visible = False
            end
            object TVUserUSER_CREATE: TcxGridDBColumn
              DataBinding.FieldName = 'USER_CREATE'
              Visible = False
            end
            object TVUserUSER_UPDATE: TcxGridDBColumn
              DataBinding.FieldName = 'USER_UPDATE'
              Visible = False
            end
            object TVUserACTIVEX: TcxGridDBColumn
              Caption = 'AKTIV'
              DataBinding.FieldName = 'ACTIVEX'
              RepositoryItem = dmStyle.icbActive
              LayoutItem = TVUserLayoutItem11.Owner
              MinWidth = 25
              Width = 25
            end
            object TVUserRootGroup: TcxGridInplaceEditFormGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              CaptionOptions.Text = 'Template Layout'
              Hidden = True
              ShowBorder = False
              Index = -1
            end
            object TVUserLayoutItem1: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              SizeOptions.Width = 333
              Index = 11
            end
            object TVUserLayoutItem2: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              Index = 12
            end
            object TVUserLayoutItem3: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              SizeOptions.Width = 344
              Index = 13
            end
            object TVUserLayoutItem4: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              Index = 3
            end
            object TVUserLayoutItem5: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              AlignVert = avTop
              SizeOptions.Width = 337
              Index = 0
            end
            object TVUserLayoutItem6: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              AlignVert = avTop
              Index = 7
            end
            object TVUserLayoutItem8: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              AlignVert = avTop
              SizeOptions.Width = 348
              Index = 2
            end
            object TVUserLayoutItem9: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignVert = avTop
              Index = 1
            end
            object TVUserLayoutItem10: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              AlignVert = avTop
              Index = 9
            end
            object TVUserLayoutItem11: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              AlignVert = avTop
              Index = 15
            end
            object TVUserLayoutItem7: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              AlignVert = avTop
              Index = 8
            end
            object TVUserLayoutItem12: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              SizeOptions.Width = 197
              Index = 4
            end
            object TVUserLayoutItem13: TcxGridInplaceEditFormLayoutItem
              Parent = TVUserRootGroup
              AlignHorz = ahClient
              Index = 5
            end
            object TVUserSeparatorItem1: TdxLayoutSeparatorItem
              Parent = TVUserRootGroup
              SizeOptions.Width = 60
              CaptionOptions.Text = 'Separator'
              Index = 14
            end
            object TVUserSeparatorItem2: TdxLayoutSeparatorItem
              Parent = TVUserRootGroup
              CaptionOptions.Text = 'Separator'
              Index = 6
            end
            object TVUserSeparatorItem3: TdxLayoutSeparatorItem
              Parent = TVUserRootGroup
              CaptionOptions.Text = 'Separator'
              Index = 10
            end
          end
          object LVUser: TcxGridLevel
            GridView = TVUser
          end
        end
      end
    end
    object tsArbeitzeit: TcxTabSheet
      Caption = 'Arbeitzeit'
      ImageIndex = 39
      OnShow = tsArbeitzeitShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object dxPanel6: TdxPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 238
        Height = 572
        Margins.Right = 0
        Align = alLeft
        TabOrder = 0
        object dxPanel7: TdxPanel
          Left = 0
          Top = 0
          Width = 236
          Height = 31
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object cxButton4: TcxButton
            AlignWithMargins = True
            Left = 208
            Top = 3
            Width = 25
            Height = 25
            Margins.Left = 0
            Align = alRight
            Action = actAddWorkingTime
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 2
          end
          object wpWT: TdxDateTimeWheelPicker
            AlignWithMargins = True
            Left = 63
            Top = 3
            Align = alClient
            ParentFont = False
            Properties.Use24HourFormat = False
            Properties.Wheels = [pwYear]
            Properties.OnChange = wpWTPropertiesChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 25
            Width = 142
          end
          object cbLanguageWT: TcxLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alLeft
            Properties.KeyFieldNames = 'COUNTRY_ID'
            Properties.ListColumns = <
              item
                FieldName = 'ISO3166_1A2'
              end>
            Properties.ListSource = dmDatabase.dsCountry
            TabOrder = 0
            ExplicitHeight = 21
            Width = 54
          end
        end
        object GDWorking: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 31
          Width = 230
          Height = 536
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          object TVWorking: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsWorkHours
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVWorkingWORKINGHOURS_ID: TcxGridDBColumn
              DataBinding.FieldName = 'WORKINGHOURS_ID'
              Visible = False
            end
            object TVWorkingCOUNTRY_ID: TcxGridDBColumn
              Caption = 'LAND'
              DataBinding.FieldName = 'COUNTRY_ID'
              RepositoryItem = dmStyle.cbCountryLong
            end
          end
          object LVWorking: TcxGridLevel
            GridView = TVWorking
          end
        end
      end
      object dxPanel8: TdxPanel
        AlignWithMargins = True
        Left = 249
        Top = 3
        Width = 857
        Height = 572
        Margins.Left = 0
        Align = alClient
        TabOrder = 2
        object dxPanel9: TdxPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 849
          Height = 31
          Margins.Bottom = 0
          Align = alTop
          TabOrder = 0
        end
        object GDWorkingDat: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 37
          Width = 849
          Height = 530
          Align = alClient
          TabOrder = 1
          object TVWorkingDat: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsWorkHoursDat
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'HDATE'
              end
              item
                Format = '0.0'
                Kind = skSum
                FieldName = 'HCOST'
                DisplayText = '0.0'
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsData.Appending = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVWorkingDatWORKINGHOURSDAT_ID: TcxGridDBColumn
              DataBinding.FieldName = 'WORKINGHOURSDAT_ID'
              Visible = False
              Width = 145
            end
            object TVWorkingDatWORKINGHOURS_ID: TcxGridDBColumn
              DataBinding.FieldName = 'WORKINGHOURS_ID'
              Visible = False
              Width = 83
            end
            object TVWorkingDatWORKINGGROUP_ID: TcxGridDBColumn
              DataBinding.FieldName = 'WORKINGGROUP_ID'
              RepositoryItem = dmStyle.cbWorkinggroup
              Visible = False
              VisibleForCustomization = False
              Width = 157
            end
            object TVWorkingDatDESCRIPTION: TcxGridDBColumn
              Caption = 'BESCHREIBUNG'
              DataBinding.FieldName = 'DESCRIPTION'
              Width = 226
            end
            object TVWorkingDatFROMDATE: TcxGridDBColumn
              Caption = 'AB DATUM'
              DataBinding.FieldName = 'FROMDATE'
              Width = 80
            end
            object TVWorkingDatDAY2: TcxGridDBColumn
              Caption = 'MONTAG'
              DataBinding.FieldName = 'DAY2'
              RepositoryItem = dmStyle.timeWorkTime
              Width = 92
            end
            object TVWorkingDatDAY3: TcxGridDBColumn
              Caption = 'DIENSTAG'
              DataBinding.FieldName = 'DAY3'
              Width = 92
            end
            object TVWorkingDatDAY4: TcxGridDBColumn
              Caption = 'MITTWOCH'
              DataBinding.FieldName = 'DAY4'
              Width = 92
            end
            object TVWorkingDatDAY5: TcxGridDBColumn
              Caption = 'DONNERSTAG'
              DataBinding.FieldName = 'DAY5'
              Width = 92
            end
            object TVWorkingDatDAY6: TcxGridDBColumn
              Caption = 'FREITAG'
              DataBinding.FieldName = 'DAY6'
              Width = 92
            end
            object TVWorkingDatDAY7: TcxGridDBColumn
              Caption = 'SAMSTAG'
              DataBinding.FieldName = 'DAY7'
              Width = 92
            end
            object TVWorkingDatDAY1: TcxGridDBColumn
              Caption = 'SONNTAG'
              DataBinding.FieldName = 'DAY1'
              RepositoryItem = dmStyle.timeWorkTime
              Width = 92
            end
          end
          object LVWorkingDat: TcxGridLevel
            GridView = TVWorkingDat
          end
        end
      end
      object cxSplitter3: TcxSplitter
        Left = 241
        Top = 0
        Width = 8
        Height = 578
        Control = dxPanel6
      end
    end
    object tsHollydays: TcxTabSheet
      Caption = 'Feiertage'
      ImageIndex = 28
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlLeft: TdxPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 238
        Height = 572
        Margins.Right = 0
        Align = alLeft
        TabOrder = 1
        object pnlLeftTop: TdxPanel
          Left = 0
          Top = 0
          Width = 236
          Height = 31
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object wpHoliday: TdxDateTimeWheelPicker
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alClient
            ParentFont = False
            Properties.Wheels = [pwYear]
            Properties.OnChange = wpHolidayPropertiesChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 25
            Width = 202
          end
          object cxButton2: TcxButton
            AlignWithMargins = True
            Left = 208
            Top = 3
            Width = 25
            Height = 25
            Margins.Left = 0
            Align = alRight
            Action = actAddHollidays
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 1
          end
        end
        object GDStatesF: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 31
          Width = 230
          Height = 536
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          object TVStatesF: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsHolidays
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
                Column = TVStatesFStates
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVStatesFHOLIDAYS_ID: TcxGridDBColumn
              DataBinding.FieldName = 'HOLIDAYS_ID'
              Visible = False
            end
            object TVStatesFHYEAR: TcxGridDBColumn
              DataBinding.FieldName = 'HYEAR'
              Visible = False
            end
            object TVStatesFCOUNTRY_ID: TcxGridDBColumn
              DataBinding.FieldName = 'COUNTRY_ID'
              Visible = False
            end
            object TVStatesFSTATE_ID: TcxGridDBColumn
              DataBinding.FieldName = 'STATE_ID'
              Visible = False
            end
            object TVStatesFCountry: TcxGridDBColumn
              Caption = 'LAND'
              DataBinding.FieldName = 'Country'
              Width = 54
            end
            object TVStatesFStates: TcxGridDBColumn
              Caption = 'BUNDESLAND'
              DataBinding.FieldName = 'States'
              Width = 174
            end
          end
          object LVStatesF: TcxGridLevel
            GridView = TVStatesF
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 241
        Top = 0
        Width = 8
        Height = 578
        Control = pnlLeft
      end
      object dxPanel18: TdxPanel
        AlignWithMargins = True
        Left = 249
        Top = 3
        Width = 857
        Height = 572
        Margins.Left = 0
        Align = alClient
        TabOrder = 2
        object dxPanel19: TdxPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 849
          Height = 31
          Margins.Bottom = 0
          Align = alTop
          TabOrder = 0
        end
        object GDHoliStatesF: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 37
          Width = 849
          Height = 530
          Align = alClient
          TabOrder = 1
          object TVHoliStatesF: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsHolidaysDat
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'HDATE'
                Column = TVHoliStatesFHDATE
              end
              item
                Format = '0.0'
                Kind = skSum
                FieldName = 'HCOST'
                Column = TVHoliStatesFHCOST
                DisplayText = '0.0'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVHoliStatesFHOLIDAYSDAT_ID: TcxGridDBColumn
              DataBinding.FieldName = 'HOLIDAYSDAT_ID'
              Visible = False
              Width = 100
            end
            object TVHoliStatesFHOLIDAYS_ID: TcxGridDBColumn
              DataBinding.FieldName = 'HOLIDAYS_ID'
              Visible = False
              Width = 78
            end
            object TVHoliStatesFHDATE: TcxGridDBColumn
              Caption = 'DATUM'
              DataBinding.FieldName = 'HDATE'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = 
                '((0?[1-9]|[12]\d|3[01])\.(0[13578]|[13578]|1[02]))|((0?[1-9]|[12' +
                ']\d|30)\.(0[13456789]|[13456789]|1[012]))|((0?[1-9]|1\d|2[0-8])\' +
                '.0?2)|(29\.0?2)'
              Width = 95
            end
            object TVHoliStatesFHNAME: TcxGridDBColumn
              Caption = 'FEIERTAG'
              DataBinding.FieldName = 'HNAME'
              Width = 421
            end
            object TVHoliStatesFHCOST: TcxGridDBColumn
              Caption = 'KOSTEN'
              DataBinding.FieldName = 'HCOST'
              DataBinding.IsNullValueType = True
              RepositoryItem = dmStyle.curCost
              MinWidth = 100
              Width = 100
            end
          end
          object LVHoliStatesF: TcxGridLevel
            GridView = TVHoliStatesF
          end
        end
      end
    end
    object tsHoliExtas: TcxTabSheet
      Caption = 'Feiertage (Extra)'
      ImageIndex = 36
      OnShow = tsHoliExtasShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlLeftFE: TdxPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 238
        Height = 572
        Margins.Right = 0
        Align = alLeft
        TabOrder = 1
        object dxPanel2: TdxPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 230
          Height = 31
          Align = alTop
          Frame.Borders = []
          LookAndFeel.Kind = lfStandard
          TabOrder = 0
          object dxDateTimeWheelPicker1: TdxDateTimeWheelPicker
            Left = 0
            Top = 0
            Align = alClient
            ParentFont = False
            Properties.Wheels = [pwYear]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 31
            Width = 205
          end
          object cxButton1: TcxButton
            Left = 205
            Top = 0
            Width = 25
            Height = 31
            Margins.Left = 0
            Align = alRight
            Action = actAddHollidays
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            TabOrder = 1
          end
        end
        object GDCountryFE: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 37
          Width = 230
          Height = 530
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          object TVCountryFE: TcxGridDBTableView
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
            DataController.DataSource = dsCountry
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'States'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVCountryFECOUNTRY_ID: TcxGridDBColumn
              DataBinding.FieldName = 'COUNTRY_ID'
              Visible = False
            end
            object TVCountryFECOUNTRY: TcxGridDBColumn
              DataBinding.FieldName = 'COUNTRY'
            end
          end
          object LVCountryFE: TcxGridLevel
            GridView = TVCountryFE
          end
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 241
        Top = 0
        Width = 8
        Height = 578
        Control = pnlLeftFE
      end
      object dxPanel1: TdxPanel
        AlignWithMargins = True
        Left = 249
        Top = 3
        Width = 857
        Height = 572
        Margins.Left = 0
        Align = alClient
        TabOrder = 2
        object pnlTVHoliExtraNav: TdxPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 849
          Height = 31
          Margins.Bottom = 0
          Align = alTop
          Frame.Borders = []
          TabOrder = 0
        end
        object GDHoliExtra: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 37
          Width = 849
          Height = 530
          Align = alClient
          TabOrder = 1
          object TVHoliExtra: TcxGridDBTableView
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
            DataController.DataSource = dmDatabase.dsHoliExtras
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'HDATE'
              end
              item
                Format = '0.0'
                Kind = skSum
                FieldName = 'HCOST'
                DisplayText = '0.0'
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.SeparatorWidth = 15
            NewItemRow.Visible = True
            OptionsData.Appending = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 25
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            Styles.StyleSheet = dmStyle.GDTV
            object TVHoliExtraHOLIEXTRAS_ID: TcxGridDBColumn
              DataBinding.FieldName = 'HOLIEXTRAS_ID'
              Visible = False
            end
            object TVHoliExtraCOUNTRY_ID: TcxGridDBColumn
              DataBinding.FieldName = 'COUNTRY_ID'
              Visible = False
            end
            object TVHoliExtraSTATE_ID: TcxGridDBColumn
              DataBinding.FieldName = 'STATE_ID'
              RepositoryItem = dmStyle.curCost
              Visible = False
            end
            object TVHoliExtraHDATE: TcxGridDBColumn
              Caption = 'DATUM'
              DataBinding.FieldName = 'HDATE'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = 
                '((0?[1-9]|[12]\d|3[01])\.(0[13578]|[13578]|1[02]))|((0?[1-9]|[12' +
                ']\d|30)\.(0[13456789]|[13456789]|1[012]))|((0?[1-9]|1\d|2[0-8])\' +
                '.0?2)|(29\.0?2)'
              Width = 75
            end
            object TVHoliExtraHNAME: TcxGridDBColumn
              Caption = 'EXTRA FEIERTAG'
              DataBinding.FieldName = 'HNAME'
              Width = 438
            end
            object TVHoliExtraFCOST: TcxGridDBColumn
              Caption = 'KOSTEN'
              DataBinding.FieldName = 'FCOST'
              RepositoryItem = dmStyle.curCost
            end
          end
          object LVHoliExtra: TcxGridLevel
            GridView = TVHoliExtra
          end
        end
      end
    end
    object tsReport: TcxTabSheet
      Caption = 'tsReport'
      ImageIndex = 37
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsConfig: TcxTabSheet
      Caption = 'Konfiguration'
      ImageIndex = 18
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'TODO'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxMemo1: TcxMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alClient
        Lines.Strings = (
          'TODO:'
          ''
          '- '#220'bertrag vor Jahr Stunden /  Urlaub'
          '- Pausenzeitenpr'#252'fung'
          '- Urlaubs Anpruch '
          '- Urlaubsantr'#228'ge'
          
            '- [x] '#220'bertragsdialog immer anzeigen auch wenn das system automa' +
            'tisch die werte ermitteln kann'
          ''
          '{USER CONFIG}'
          '[x] CODE automatisch POPUP'
          '')
        TabOrder = 0
        Height = 572
        Width = 1103
      end
    end
  end
  object bm: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 824
    Top = 184
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      28
      0)
    object bmBar1: TdxBar
      Caption = 'MainBar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 652
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarButton3: TdxBarButton
      Caption = 'MAIN FORM'
      Category = 0
      Hint = 'MAIN FORM'
      Visible = ivAlways
      OnClick = dxBarButton3Click
    end
  end
  object act: TActionList
    Images = dmStyle.imlControl
    Left = 898
    Top = 180
    object actAddHollidays: TAction
      Caption = 'actAddHollidays'
      ImageIndex = 0
      OnExecute = actAddHollidaysExecute
    end
    object actAddWorkingTime: TAction
      Caption = 'actAddWorkingTime'
      ImageIndex = 0
      OnExecute = actAddWorkingTimeExecute
    end
    object actAddUser: TAction
      Caption = 'Benutzer Anlegen'
      ImageIndex = 7
      OnExecute = actAddUserExecute
    end
    object actUserCopy: TAction
      Caption = 'Benutzer Kopieren'
      Hint = 'Es werden nur relevanten Daten Kopiert'
      ImageIndex = 8
      OnExecute = actUserCopyExecute
    end
    object actAddUserYear: TAction
      Caption = 'actAddUserYear'
      ImageIndex = 9
      OnExecute = actAddUserYearExecute
    end
    object actAddAllUserYear: TAction
      Caption = 'actAddAllUserYear'
      ImageIndex = 10
    end
  end
  object dsMtHollydays: TDataSource
    DataSet = dmDatabase.mtHolidays
    Left = 48
    Top = 516
  end
  object dsCountry: TDataSource
    DataSet = dmDatabase.qryCountry
    Left = 127
    Top = 505
  end
  object DataSource2: TDataSource
    Left = 383
    Top = 561
  end
  object DataSource3: TDataSource
    Left = 471
    Top = 561
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = GDUser
    PopupMenus = <>
    Left = 658
    Top = 548
  end
end
