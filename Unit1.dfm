object FGame: TFGame
  Left = 0
  Top = 0
  Caption = 'JEU : Bulls and Cows'
  ClientHeight = 409
  ClientWidth = 402
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
  object SplitterTop2: TSplitter
    Left = 0
    Top = 85
    Width = 402
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 79
  end
  object SplitterBottom1: TSplitter
    Left = 0
    Top = 321
    Width = 402
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 88
    ExplicitWidth = 280
  end
  object SplitterBottom2: TSplitter
    Left = 0
    Top = 365
    Width = 402
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -8
    ExplicitTop = 398
  end
  object SplitterTop3: TSplitter
    Left = 0
    Top = 129
    Width = 402
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 83
  end
  object SplitterTop4: TSplitter
    Left = 0
    Top = 173
    Width = 402
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 35
  end
  object SplitterTop1: TSplitter
    Left = 0
    Top = 41
    Width = 402
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 33
  end
  object PMotATrouver: TPanel
    Left = 0
    Top = 324
    Width = 402
    Height = 41
    Align = alBottom
    TabOrder = 0
    Visible = False
    object LMotATrouver: TLabel
      Left = 1
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Alignment = taCenter
      Caption = 'Mot '#224' trouver :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 16
    end
    object EMotATrouver: TEdit
      Left = 101
      Top = 1
      Width = 300
      Height = 39
      TabStop = False
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 24
    end
  end
  object PNbBonnePos: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 41
    Align = alTop
    TabOrder = 1
    object LNbBonnePos: TLabel
      Left = 1
      Top = 1
      Width = 153
      Height = 39
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'Nombre de lettres '#224' la bonne position :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 64
      ExplicitTop = 6
      ExplicitHeight = 33
    end
    object ENbBonnePos: TEdit
      Left = 154
      Top = 1
      Width = 247
      Height = 39
      TabStop = False
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 24
    end
  end
  object PNbLettres: TPanel
    Left = 0
    Top = 44
    Width = 402
    Height = 41
    Align = alTop
    TabOrder = 2
    object LNbLettres: TLabel
      Left = 1
      Top = 1
      Width = 126
      Height = 39
      Align = alLeft
      Alignment = taCenter
      Caption = 'Nombre de lettres :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 16
    end
    object ENbLettres: TEdit
      Left = 127
      Top = 1
      Width = 274
      Height = 39
      TabStop = False
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 24
    end
  end
  object PPrincipal: TPanel
    Left = 0
    Top = 176
    Width = 402
    Height = 145
    Align = alClient
    TabOrder = 3
    ExplicitTop = 208
    ExplicitHeight = 113
    object LChoix: TLabel
      Left = 1
      Top = 1
      Width = 400
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'ENTREZ VOTRE CHOIX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 134
    end
    object EChoix: TEdit
      Left = 1
      Top = 17
      Width = 400
      Height = 31
      Align = alTop
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object MListeMots: TMemo
      Left = 16
      Top = 88
      Width = 49
      Height = 33
      Lines.Strings = (
        'jeu'
        'pas'
        'ravi'
        'lobe'
        'notre'
        'carte'
        'tampon'
        'jambon'
        'judokas'
        'trouble')
      TabOrder = 1
      Visible = False
    end
  end
  object PBouton: TPanel
    Left = 0
    Top = 368
    Width = 402
    Height = 41
    Align = alBottom
    TabOrder = 4
    object BValider: TButton
      Left = 1
      Top = 1
      Width = 400
      Height = 39
      Align = alClient
      Caption = 'Validez votre choix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BValiderClick
    end
  end
  object PNbBonneLettre: TPanel
    Left = 0
    Top = 88
    Width = 402
    Height = 41
    Align = alTop
    TabOrder = 5
    object LNbBonneLettre: TLabel
      Left = 1
      Top = 1
      Width = 177
      Height = 39
      Align = alLeft
      Alignment = taCenter
      Caption = 'Nombre de bonnes lettres :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 16
    end
    object ENbBonneLettre: TEdit
      Left = 178
      Top = 1
      Width = 223
      Height = 39
      TabStop = False
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 24
    end
  end
  object PNbVies: TPanel
    Left = 0
    Top = 132
    Width = 402
    Height = 41
    Align = alTop
    TabOrder = 6
    ExplicitLeft = 120
    ExplicitTop = 208
    ExplicitWidth = 185
    object LNbVies: TLabel
      Left = 1
      Top = 1
      Width = 108
      Height = 39
      Align = alLeft
      Alignment = taCenter
      Caption = 'Nombre de vies :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 16
    end
    object ENbVies: TEdit
      Left = 109
      Top = 1
      Width = 292
      Height = 39
      TabStop = False
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 380
      ExplicitWidth = 21
      ExplicitHeight = 24
    end
  end
end
