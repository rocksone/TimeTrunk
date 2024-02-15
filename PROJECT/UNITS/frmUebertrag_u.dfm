object frmUebertrag: TfrmUebertrag
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'frmUebertrag'
  ClientHeight = 479
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object dxPanel1: TdxPanel
    AlignWithMargins = True
    Left = 3
    Top = 443
    Width = 468
    Height = 33
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 442
    ExplicitWidth = 464
    object btnOk: TcxButton
      AlignWithMargins = True
      Left = 257
      Top = 3
      Width = 100
      Height = 25
      Align = alRight
      Caption = #220'bernehmen'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 253
    end
    object btnCancel: TcxButton
      AlignWithMargins = True
      Left = 363
      Top = 3
      Width = 100
      Height = 25
      Align = alRight
      Caption = '&Abbrechen'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 359
    end
  end
  object dxPanel2: TdxPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 468
    Height = 35
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 464
    object lbName: TcxLabel
      AlignWithMargins = True
      Left = 151
      Top = 5
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      AutoSize = False
      Caption = ' Benutzername'
      ParentColor = False
      Style.BorderStyle = ebsFlat
      Style.Color = clWhite
      Style.TextStyle = [fsBold]
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      ExplicitWidth = 306
      Height = 23
      Width = 310
      AnchorY = 17
    end
    object lbPersonalNr: TcxLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      AutoSize = False
      Caption = 'Personal N'#176
      ParentColor = False
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 23
      Width = 141
      AnchorX = 76
      AnchorY = 17
    end
  end
  object dxPanel3: TdxPanel
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 468
    Height = 329
    Align = alClient
    AutoSize = True
    TabOrder = 2
    ExplicitWidth = 464
    ExplicitHeight = 328
    object gbLastCheck: TcxGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 205
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Bitte best'#228'tigen Sie die Zusammenfassung.'
      TabOrder = 2
      ExplicitWidth = 442
      Height = 113
      Width = 446
      object chkboxUebernehmen: TcxCheckBox
        Left = 16
        Top = 85
        Caption = 
          'Die Daten sind korrekt. Bitte best'#228'tigen Sie mit dem Button '#39#220'be' +
          'rnehmen'#39
        Properties.OnChange = chkboxUebernehmenPropertiesChange
        Style.TransparentBorder = False
        TabOrder = 3
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 27
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Stunden'
        Style.BorderStyle = ebsFlat
        Height = 23
        Width = 161
        AnchorX = 97
        AnchorY = 39
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 56
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Stunden'
        Style.BorderStyle = ebsFlat
        Height = 23
        Width = 161
        AnchorX = 97
        AnchorY = 68
      end
      object dxPanel4: TdxPanel
        Left = 304
        Top = 32
        Width = 100
        Height = 41
        Color = 15658734
        TabOrder = 1
      end
    end
    object gbUebertrag: TcxGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 10
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Stunden'#252'bertrag aus dem Jahr %d'
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      StyleDisabled.Color = clBtnFace
      TabOrder = 0
      ExplicitWidth = 442
      Height = 87
      Width = 446
      object sptStunden: TcxSpinEdit
        Left = 142
        Top = 23
        Properties.SpinButtons.ShowFastButtons = True
        Properties.OnChange = StundenChange
        TabOrder = 1
        Width = 121
      end
      object lbStunden: TcxLabel
        Left = 15
        Top = 23
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Stunden'
        Style.BorderStyle = ebsFlat
        Height = 23
        Width = 121
        AnchorX = 76
        AnchorY = 35
      end
      object sptMinuten: TcxSpinEdit
        Left = 142
        Top = 52
        Properties.SpinButtons.ShowFastButtons = True
        Properties.OnChange = StundenChange
        TabOrder = 5
        Width = 121
      end
      object lbMinuten: TcxLabel
        Left = 15
        Top = 52
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Minuten'
        Style.BorderStyle = ebsFlat
        Height = 23
        Width = 121
        AnchorX = 76
        AnchorY = 64
      end
      object lbTotal: TcxLabel
        Left = 269
        Top = 42
        AutoSize = False
        Caption = '00:00'
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsFlat
        Style.Color = 14811105
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 2894892
        Style.Font.Height = -27
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Height = 33
        Width = 161
        AnchorX = 350
        AnchorY = 59
      end
      object lbResultStd: TcxLabel
        Left = 269
        Top = 23
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Stunden'
        ParentColor = False
        Style.BorderStyle = ebsFlat
        Style.Color = 15658734
        Style.Edges = [bLeft, bTop, bRight]
        Height = 20
        Width = 161
        AnchorX = 350
        AnchorY = 33
      end
    end
    object gbUrlaub: TcxGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 107
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Urlaubsanspruch'
      ParentBackground = False
      StyleDisabled.BorderStyle = ebsFlat
      StyleDisabled.Color = clBtnFace
      TabOrder = 1
      ExplicitWidth = 442
      Height = 88
      Width = 446
      object lbanspruch: TcxLabel
        Left = 15
        Top = 53
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Anspruch f'#252'r (2024)'
        Style.BorderStyle = ebsFlat
        Height = 23
        Width = 121
        AnchorX = 76
        AnchorY = 65
      end
      object sptUrlaub: TcxSpinEdit
        Left = 142
        Top = 53
        Properties.SpinButtons.ShowFastButtons = True
        Properties.OnChange = UrlaubChange
        TabOrder = 5
        Width = 121
      end
      object lbRestUrlaub: TcxLabel
        Left = 15
        Top = 24
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = #220'bertrag aus (2023)'
        Style.BorderStyle = ebsFlat
        Height = 23
        Width = 121
        AnchorX = 76
        AnchorY = 36
      end
      object sptRestUrlaub: TcxSpinEdit
        Left = 142
        Top = 24
        Properties.SpinButtons.ShowFastButtons = True
        Properties.OnChange = UrlaubChange
        TabOrder = 1
        Width = 121
      end
      object lbUrlaub: TcxLabel
        Left = 269
        Top = 41
        AutoSize = False
        Caption = '0'
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsFlat
        Style.Color = 14811105
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 2894892
        Style.Font.Height = -27
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Height = 35
        Width = 161
        AnchorX = 350
        AnchorY = 59
      end
      object lbResulTage: TcxLabel
        Left = 269
        Top = 24
        RepositoryItem = dmStyle.erTimeLavel
        AutoSize = False
        Caption = 'Stunden'
        ParentColor = False
        Style.BorderStyle = ebsFlat
        Style.Color = 15658734
        Style.Edges = [bLeft, bTop, bRight]
        Height = 18
        Width = 161
        AnchorX = 350
        AnchorY = 33
      end
    end
  end
  object pnlInfo: TdxPanel
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 468
    Height = 58
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 464
    object imgInfo: TcxImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Align = alLeft
      AutoSize = True
      Picture.Data = {
        0D546478536D617274496D6167653C3F786D6C2076657273696F6E3D22312E30
        2220656E636F64696E673D225554462D38223F3E0D0A3C737667207665727369
        6F6E3D22312E31222069643D224C617965725F312220786D6C6E733D22687474
        703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A78
        6C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C69
        6E6B2220783D223070782220793D22307078222076696577426F783D22302030
        20333220333222207374796C653D22656E61626C652D6261636B67726F756E64
        3A6E6577203020302033322033323B2220786D6C3A73706163653D2270726573
        65727665223E262331333B262331303B3C7374796C6520747970653D22746578
        742F6373732220786D6C3A73706163653D227072657365727665223E2E426C75
        657B66696C6C3A233131373744373B7D262331333B262331303B2623393B2E59
        656C6C6F777B66696C6C3A234646423131353B7D262331333B262331303B2623
        393B2E5265647B66696C6C3A234431314331433B7D262331333B262331303B26
        23393B2E477265656E7B66696C6C3A233033394332333B7D262331333B262331
        303B2623393B2E426C61636B7B66696C6C3A233732373237323B7D262331333B
        262331303B2623393B2E57686974657B66696C6C3A234646464646463B7D2623
        31333B262331303B2623393B2E7374307B6F7061636974793A302E353B7D2623
        31333B262331303B2623393B2E7374317B6F7061636974793A302E37353B7D26
        2331333B262331303B2623393B2E7374327B646973706C61793A6E6F6E653B7D
        262331333B262331303B2623393B2E7374337B646973706C61793A696E6C696E
        653B66696C6C3A234646423131353B7D262331333B262331303B2623393B2E73
        74347B646973706C61793A696E6C696E653B7D262331333B262331303B262339
        3B2E7374357B646973706C61793A696E6C696E653B6F7061636974793A302E37
        353B7D262331333B262331303B2623393B2E7374367B646973706C61793A696E
        6C696E653B6F7061636974793A302E353B7D262331333B262331303B2623393B
        2E7374377B646973706C61793A696E6C696E653B66696C6C3A23303339433233
        3B7D262331333B262331303B2623393B2E7374387B646973706C61793A696E6C
        696E653B66696C6C3A234431314331433B7D262331333B262331303B2623393B
        2E7374397B646973706C61793A696E6C696E653B66696C6C3A23313137374437
        3B7D262331333B262331303B2623393B2E737431307B646973706C61793A696E
        6C696E653B66696C6C3A234646464646463B7D3C2F7374796C653E0D0A3C6720
        69643D22417474656E74696F6E223E0D0A09093C7061746820636C6173733D22
        59656C6C6F772220643D224D31352E312C322E354C322E312C32362E3543312E
        382C32372E322C322E332C32382C332E312C32386832352E3963302E382C302C
        312E332D302E382C302E392D312E354C31362E392C322E3520202623393B2623
        393B4331362E352C312E382C31352E352C312E382C31352E312C322E357A222F
        3E0D0A09093C7061746820636C6173733D22426C61636B2220643D224D31362C
        323063312E312C302C322C302E392C322C32732D302E392C322D322C32732D32
        2D302E392D322D325331342E392C32302C31362C32307A204D31342C31306834
        7638682D345631307A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      Properties.PopupMenuLayout.MenuItems = []
      Properties.ShowFocusRect = False
      Style.BorderStyle = ebsNone
      Style.ReadOnly = True
      StyleReadOnly.BorderStyle = ebsNone
      TabOrder = 0
      Transparent = True
    end
    object lbInfo: TdxFormattedLabel
      AlignWithMargins = True
      Left = 52
      Top = 10
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      AutoSize = False
      Caption = 
        'Das System konnte keine '#220'bertragungszeiten aus dem[B] Vorjahr fi' +
        'nden[/B]. Bitte f'#252'gen Sie sie manuell ein.'
      Properties.WordWrap = True
      ExplicitWidth = 400
      Height = 36
      Width = 404
    end
  end
  object FDSUser: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'P_GETUSERDATA'
    Left = 14
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
        Name = 'PERSONALNR'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 30
      end
      item
        Position = 3
        Name = 'LASTNAME'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 100
      end
      item
        Position = 4
        Name = 'FIRSTNAME'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 100
      end
      item
        Position = 5
        Name = 'VACATIONDAYS'
        DataType = ftSmallint
        ParamType = ptOutput
      end>
  end
  object FDSUserData: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'P_CHECK_PREVIOUS_YEAR'
    Left = 54
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
end
