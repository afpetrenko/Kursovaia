object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 570
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 24
    Top = 64
    Width = 929
    Height = 489
    ColCount = 8
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    ColWidths = (
      64
      106
      98
      108
      119
      99
      216
      108)
    RowHeights = (
      24
      25)
  end
  object Edit1: TEdit
    Left = 24
    Top = 18
    Width = 121
    Height = 21
    TabOrder = 1
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080
  end
  object Button1: TButton
    Left = 176
    Top = 16
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 16
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 926
    Top = 33
    Width = 27
    Height = 25
    Caption = 'X'
    TabOrder = 4
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 640
    object FileMenu: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenFile: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = OpenFileClick
      end
      object Save: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = SaveClick
      end
      object SaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        OnClick = SaveAsClick
      end
    end
    object Sort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object N1: TMenuItem
        Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072' '#8593
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072' '#8595
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1086#1080#1089#1082#1091
      OnClick = N3Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'txt|*.txt'
    Left = 680
  end
  object SaveDialog1: TSaveDialog
    Filter = 'txt|*.txt'
    Left = 720
  end
end
