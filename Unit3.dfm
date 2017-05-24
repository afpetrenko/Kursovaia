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
  object StringGrid2: TStringGrid
    Left = 16
    Top = 128
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
  object Button1: TButton
    Left = 160
    Top = 43
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 88
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 3
    Text = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1075#1088#1072#1076#1072#1084
  end
  object Edit2: TEdit
    Left = 16
    Top = 90
    Width = 121
    Height = 21
    TabOrder = 4
    Text = #1055#1086#1080#1089#1082' '#1087#1086' '#1088#1077#1078#1078#1080#1089#1105#1088#1091
  end
  object ComboBox1: TComboBox
    Left = 504
    Top = 45
    Width = 145
    Height = 21
    TabOrder = 5
    Text = 'ComboBox1'
    OnSelect = ComboBox1Select
  end
end
