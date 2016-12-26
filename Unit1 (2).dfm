object Form1: TForm1
  Left = 307
  Top = 144
  Width = 928
  Height = 546
  Caption = #1055#1086#1083#1105#1090' '#1090#1077#1083#1072' '#1087#1086#1076' '#1091#1075#1083#1086#1084' '#1082' '#1075#1086#1088#1080#1079#1086#1085#1090#1091
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
  object Label1: TLabel
    Left = 144
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 144
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Image1: TImage
    Left = 0
    Top = 56
    Width = 905
    Height = 457
  end
  object Shape1: TShape
    Left = 0
    Top = 480
    Width = 32
    Height = 32
    ParentShowHint = False
    Pen.Mode = pmMask
    Shape = stCircle
    ShowHint = False
  end
  object ScrollBar1: TScrollBar
    Left = 8
    Top = 8
    Width = 121
    Height = 16
    Max = 90
    PageSize = 0
    Position = 45
    TabOrder = 0
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 8
    Top = 32
    Width = 121
    Height = 16
    PageSize = 0
    Position = 50
    TabOrder = 1
    OnChange = ScrollBar2Change
  end
  object Button1: TButton
    Left = 240
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1091#1089#1082
    TabOrder = 2
    OnClick = Button1Click
  end
end
