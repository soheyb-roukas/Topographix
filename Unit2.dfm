object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Export data'
  ClientHeight = 244
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 25
    Top = 174
    Width = 107
    Height = 25
    Caption = 'Export To File..'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 25
    Top = 205
    Width = 107
    Height = 25
    Caption = 'Copy to clipboard'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 72
    Width = 100
    Height = 17
    Caption = 'PK Name'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 32
    Top = 95
    Width = 100
    Height = 17
    Caption = 'Axe X'
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 32
    Top = 118
    Width = 100
    Height = 17
    Caption = 'Axe Y'
    TabOrder = 4
  end
  object CheckBox4: TCheckBox
    Left = 32
    Top = 141
    Width = 100
    Height = 17
    Caption = 'Point Name'
    TabOrder = 5
  end
  object CheckBox5: TCheckBox
    Left = 184
    Top = 72
    Width = 100
    Height = 17
    Caption = 'Distance'
    TabOrder = 6
  end
  object CheckBox6: TCheckBox
    Left = 184
    Top = 95
    Width = 100
    Height = 17
    Caption = 'Point X'
    TabOrder = 7
  end
  object CheckBox7: TCheckBox
    Left = 184
    Top = 118
    Width = 100
    Height = 17
    Caption = 'Point Y'
    TabOrder = 8
  end
  object CheckBox8: TCheckBox
    Left = 184
    Top = 141
    Width = 100
    Height = 17
    Caption = 'Point z'
    TabOrder = 9
  end
  object Button3: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Check ALL'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 104
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Reverse Selected'
    TabOrder = 11
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 224
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 12
    OnClick = Button5Click
  end
  object Memo1: TMemo
    Left = 384
    Top = 64
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 13
    Visible = False
  end
  object Button6: TButton
    Left = 168
    Top = 205
    Width = 116
    Height = 25
    Caption = 'Close'
    TabOrder = 14
    OnClick = Button6Click
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '*.txt'
    FileName = 'Data.txt'
    Filter = 'TXT|*.txt|All|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 112
    Top = 48
  end
end
