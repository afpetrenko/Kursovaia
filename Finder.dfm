object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 477
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RewardLabel: TLabel
    Left = 384
    Top = 70
    Width = 189
    Height = 16
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1085#1072#1075#1088#1072#1076#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ProducerLabel: TLabel
    Left = 384
    Top = 70
    Width = 206
    Height = 16
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1088#1077#1078#1080#1089#1089#1105#1088#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid2: TStringGrid
    Left = 16
    Top = 104
    Width = 945
    Height = 329
    ColCount = 8
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      64
      124
      103
      106
      138
      150
      140
      109)
  end
  object RewardBox: TComboBox
    Left = 16
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 1
    Text = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1075#1088#1072#1076#1072#1084
    OnSelect = RewardBoxSelect
  end
  object ProducerBox: TComboBox
    Left = 16
    Top = 69
    Width = 145
    Height = 21
    TabOrder = 2
    Text = #1055#1086#1080#1089#1082' '#1087#1086' '#1088#1077#1078#1080#1089#1105#1088#1072#1084
    OnSelect = ProducerBoxSelect
  end
  object ClearStringGrid: TButton
    Left = 936
    Top = 73
    Width = 25
    Height = 25
    Caption = 'X'
    TabOrder = 3
    OnClick = ClearStringGridClick
  end
end
