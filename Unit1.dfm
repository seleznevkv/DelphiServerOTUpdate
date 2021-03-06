object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SiteOT_Update'
  ClientHeight = 659
  ClientWidth = 798
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 814
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  DesignSize = (
    798
    659)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 8
    Top = 239
    Width = 782
    Height = 395
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = dm.OTSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1number: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'number'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 50
      end
      object cxGrid1DBTableView1fileCaption: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'fileCaption'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 300
      end
      object cxGrid1DBTableView1fileName: TcxGridDBColumn
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
        DataBinding.FieldName = 'fileName'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 200
      end
      object cxGrid1DBTableView1keyName: TcxGridDBColumn
        Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'keyName'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 8
    Width = 778
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object RazdLabel: TLabel
      Left = 13
      Top = 13
      Width = 36
      Height = 13
      Caption = #1056#1072#1079#1076#1077#1083
    end
    object OboznLabel: TLabel
      Left = 17
      Top = 157
      Width = 67
      Height = 13
      Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object TextLabel: TLabel
      Left = 11
      Top = 46
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object RazdelList: TComboBox
      Left = 90
      Top = 10
      Width = 307
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = #1055#1088#1072#1074#1080#1083#1072' '#1087#1086' '#1054#1058
      OnChange = RazdelListChange
      Items.Strings = (
        #1055#1088#1072#1074#1080#1083#1072' '#1087#1086' '#1054#1058
        #1048#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1087#1086' '#1054#1058
        #1048#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1087#1086' '#1054#1058' '#1050#1050#1062
        #1048#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1087#1086' '#1055#1041
        #1048#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1087#1086' '#1041#1069
        #1048#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1087#1086' '#1041#1069' '#1050#1050#1062
        #1055#1086#1083#1086#1078#1077#1085#1080#1103' '#1087#1086' '#1054#1058)
    end
    object NaimMemo: TDBMemo
      Left = 90
      Top = 42
      Width = 307
      Height = 100
      DataField = 'fileCaption'
      DataSource = dm.OTSource
      TabOrder = 1
    end
    object KeyEdit: TcxDBTextEdit
      Left = 90
      Top = 154
      DataBinding.DataField = 'keyName'
      DataBinding.DataSource = dm.OTSource
      TabOrder = 2
      Width = 307
    end
    object AddButton: TButton
      Left = 90
      Top = 189
      Width = 91
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 3
      OnClick = AddButtonClick
    end
    object SaveButton: TButton
      Left = 411
      Top = 189
      Width = 91
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 6
      OnClick = SaveButtonClick
    end
    object DeleteButton: TButton
      Left = 187
      Top = 189
      Width = 91
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      OnClick = DeleteButtonClick
    end
    object PageEdit: TcxDBTextEdit
      Left = 624
      Top = 169
      DataBinding.DataField = 'PageName'
      DataBinding.DataSource = dm.OTSource
      TabOrder = 8
      Visible = False
      Width = 121
    end
    object numedit: TcxDBSpinEdit
      Left = 624
      Top = 196
      DataBinding.DataField = 'number'
      DataBinding.DataSource = dm.OTSource
      TabOrder = 9
      Visible = False
      Width = 121
    end
    object FileGrpBox: TGroupBox
      Left = 411
      Top = 35
      Width = 322
      Height = 140
      Caption = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      TabOrder = 5
      object FileLabel: TLabel
        Left = 20
        Top = 26
        Width = 54
        Height = 13
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
      end
      object Label2: TLabel
        Left = 19
        Top = 62
        Width = 79
        Height = 13
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
      end
      object FileStatus: TLabel
        Left = 111
        Top = 105
        Width = 3
        Height = 13
      end
      object FileButton: TButton
        Left = 190
        Top = 57
        Width = 56
        Height = 25
        Caption = #1055#1050
        TabOrder = 1
        OnClick = FileButtonClick
      end
      object FServButton: TButton
        Left = 252
        Top = 57
        Width = 54
        Height = 25
        Caption = #1057#1077#1088#1074#1077#1088
        TabOrder = 2
        OnClick = FServButtonClick
      end
      object FileEdit: TcxDBTextEdit
        Left = 121
        Top = 23
        DataBinding.DataField = 'fileName'
        DataBinding.DataSource = dm.OTSource
        Enabled = False
        TabOrder = 0
        Width = 185
      end
    end
    object RefButton: TButton
      Left = 508
      Top = 189
      Width = 91
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 7
      OnClick = RefButtonClick
    end
  end
  object CapsBar: TStatusBar
    Left = 0
    Top = 640
    Width = 798
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #1042#1077#1088#1089#1080#1103'  v1.0161018'
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object PCDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' PDF (*.pdf)|*.pdf'
    InitialDir = 'c:\'
    Left = 336
    Top = 104
  end
  object SerDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' PDF (*.pdf)|*.pdf'
    InitialDir = 'c:\'
    Left = 336
    Top = 56
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 536
    Top = 8
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 456
    Top = 608
  end
end
