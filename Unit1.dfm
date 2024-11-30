object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Topographix'
  ClientHeight = 623
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 604
    Width = 834
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Text = 'Axe points:'
        Width = 70
      end
      item
        Width = 70
      end
      item
        Alignment = taRightJustify
        Text = 'Topo Points:'
        Width = 70
      end
      item
        Width = 70
      end
      item
        Alignment = taRightJustify
        Text = 'Made By Soheyb 2024'
        Width = 50
      end>
  end
  object ListView1: TListView
    Left = 0
    Top = 176
    Width = 834
    Height = 411
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'PK'
        Width = 100
      end
      item
        Caption = 'X Axe'
        Width = 100
      end
      item
        Caption = 'Y Axe'
        Width = 100
      end
      item
        Caption = 'Point Name'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'DISTANCE'
        Width = 100
      end
      item
        Caption = 'Point X'
        Width = 100
      end
      item
        Caption = 'Point Y'
        Width = 100
      end
      item
        Caption = 'Point Z'
        Width = 100
      end>
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnCompare = ListView1Compare
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 825
    Height = 121
    Caption = 'Source Files'
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 23
      Width = 100
      Height = 15
      Caption = 'Select Axe TXT File:'
    end
    object Label2: TLabel
      Left = 12
      Top = 69
      Width = 113
      Height = 15
      Caption = 'Select Points TXT File:'
    end
    object Edit1: TEdit
      Left = 8
      Top = 40
      Width = 721
      Height = 23
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 8
      Top = 85
      Width = 721
      Height = 23
      TabOrder = 1
      OnChange = Edit2Change
    end
    object Button1: TButton
      Left = 748
      Top = 40
      Width = 53
      Height = 23
      Caption = '...'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 748
      Top = 85
      Width = 53
      Height = 23
      Caption = '...'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object Button3: TButton
    Left = 12
    Top = 135
    Width = 75
    Height = 25
    Caption = '[ Sort ]'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 96
    Top = 408
    Width = 329
    Height = 137
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 4
    Visible = False
    OnChange = Memo1Change
  end
  object Memo2: TMemo
    Left = 446
    Top = 408
    Width = 355
    Height = 137
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssBoth
    TabOrder = 5
    Visible = False
    OnChange = Memo2Change
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 587
    Width = 834
    Height = 17
    Align = alBottom
    TabOrder = 6
  end
  object Button4: TButton
    Left = 718
    Top = 135
    Width = 102
    Height = 25
    Caption = 'Export To File ...'
    Enabled = False
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 592
    Top = 135
    Width = 109
    Height = 25
    Caption = 'Copy To Clipboard'
    Enabled = False
    TabOrder = 8
    OnClick = Button5Click
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'TXT|*.txt|All|*.*'
    Left = 712
    Top = 448
  end
  object MainMenu1: TMainMenu
    Left = 712
    Top = 352
    object Files1: TMenuItem
      Caption = 'Files'
      object SelectAxeFile1: TMenuItem
        Caption = 'Select Axe File ...'
        OnClick = SelectAxeFile1Click
      end
      object SelectTopgraphicFile1: TMenuItem
        Caption = 'Select Topo Points File ...'
        OnClick = SelectTopgraphicFile1Click
      end
    end
    object Edit3: TMenuItem
      Caption = 'Options'
      object Export2: TMenuItem
        Caption = 'Export option'
        OnClick = Export2Click
      end
    end
    object heme1: TMenuItem
      Caption = 'Theme'
      object Light1: TMenuItem
        Caption = 'Light'
        Checked = True
        GroupIndex = 1
        OnClick = Light1Click
      end
      object Dark1: TMenuItem
        Caption = 'Dark'
        GroupIndex = 1
        OnClick = Dark1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object App1: TMenuItem
        Caption = 'Github'
        OnClick = App1Click
      end
    end
  end
end
