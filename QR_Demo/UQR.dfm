object frmQRGen: TfrmQRGen
  AlignWithMargins = True
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'KC Tech'#39's QR Generator'
  ClientHeight = 584
  ClientWidth = 819
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    819
    584)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaster: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 801
    Height = 569
    Anchors = [akLeft, akTop, akRight, akBottom]
    UseDockManager = False
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    DesignSize = (
      801
      569)
    object pgcInput: TPageControl
      AlignWithMargins = True
      Left = 26
      Top = 78
      Width = 338
      Height = 239
      ActivePage = tabSMS
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Palatino Linotype'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tabText: TTabSheet
        Caption = 'Text'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Palatino Linotype'
        Font.Style = [fsBold]
        ParentFont = False
        object edtText: TEdit
          Left = 16
          Top = 24
          Width = 265
          Height = 26
          Color = clInfoBk
          TabOrder = 0
          Text = 'Enter Your Text Here'
        end
        object btnTextGenerate: TButton
          Left = 104
          Top = 67
          Width = 75
          Height = 25
          Caption = 'Generate'
          TabOrder = 1
          OnClick = btnTextGenerateClick
        end
      end
      object tabPhone: TTabSheet
        Caption = 'Phone'
        ImageIndex = 1
        object edtContact: TEdit
          Left = 16
          Top = 25
          Width = 265
          Height = 26
          Color = clInfoBk
          TabOrder = 0
          OnKeyPress = edtContactKeyPress
        end
        object btnGeneratePhone: TButton
          Left = 104
          Top = 67
          Width = 75
          Height = 25
          Caption = 'Generate'
          TabOrder = 1
          OnClick = btnGeneratePhoneClick
        end
      end
      object tabEmail: TTabSheet
        AlignWithMargins = True
        Caption = 'Email'
        ImageIndex = 2
        object btnGenerateEmail: TButton
          Left = 104
          Top = 67
          Width = 75
          Height = 25
          Caption = 'Generate'
          TabOrder = 0
          OnClick = btnGenerateEmailClick
        end
        object edtEmail: TEdit
          Left = 16
          Top = 24
          Width = 261
          Height = 26
          TabStop = False
          Color = clInfoBk
          TabOrder = 1
          StyleElements = [seBorder]
        end
      end
      object tabSMS: TTabSheet
        Caption = 'SMS'
        ImageIndex = 3
        object lblPhone_No: TLabel
          Left = 14
          Top = 24
          Width = 69
          Height = 18
          Caption = 'Phone_No:'
        end
        object lblMSG: TLabel
          Left = 16
          Top = 83
          Width = 33
          Height = 18
          Caption = 'SMS:'
        end
        object edtPhone: TEdit
          Left = 16
          Top = 48
          Width = 265
          Height = 26
          Color = clInfoBk
          TabOrder = 0
          OnKeyPress = edtContactKeyPress
        end
        object btnGenerateSMS: TButton
          Left = 120
          Top = 163
          Width = 75
          Height = 25
          Caption = 'Generate'
          TabOrder = 1
          OnClick = btnGenerateSMSClick
        end
        object edtSMS: TEdit
          Left = 16
          Top = 107
          Width = 265
          Height = 26
          Color = clInfoBk
          TabOrder = 2
        end
      end
    end
    object pnlPreview: TPanel
      AlignWithMargins = True
      Left = 400
      Top = 78
      Width = 361
      Height = 466
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Palatino Linotype'
      Font.Style = [fsBold, fsUnderline]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        361
        466)
      object lblPreview: TLabel
        Left = 137
        Top = 8
        Width = 73
        Height = 26
        Anchors = []
        Caption = 'Preview'
        ExplicitTop = 9
      end
      object pnlQR: TPanel
        AlignWithMargins = True
        Left = -6
        Top = 114
        Width = 367
        Height = 356
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clMedGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Palatino Linotype'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          367
          356)
        object PaintBox1: TPaintBox
          Left = 40
          Top = 20
          Width = 294
          Height = 275
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clInfoBk
          ParentColor = False
          OnPaint = PaintBox1Paint
        end
        object btnSave: TButton
          Left = 146
          Top = 323
          Width = 80
          Height = 28
          Anchors = []
          Caption = 'Save QR'
          TabOrder = 0
          OnClick = btnSaveClick
        end
      end
    end
    object pnlProperties: TPanel
      AlignWithMargins = True
      Left = 27
      Top = 326
      Width = 337
      Height = 218
      Color = clWhite
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Palatino Linotype'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object lblEncoding: TLabel
        Left = 28
        Top = 32
        Width = 58
        Height = 18
        Caption = 'Encoding'
      end
      object lblQuietZone: TLabel
        Left = 196
        Top = 36
        Width = 67
        Height = 18
        Caption = 'Quiet zone'
      end
      object edtQuietZone: TEdit
        Left = 196
        Top = 55
        Width = 89
        Height = 26
        Color = clInfoBk
        TabOrder = 0
        Text = '4'
        OnChange = edtQuietZoneChange
      end
      object cmbEncoding: TComboBox
        Left = 28
        Top = 52
        Width = 133
        Height = 26
        Style = csDropDownList
        Color = clInfoBk
        ItemIndex = 0
        TabOrder = 1
        Text = 'Auto'
        OnChange = cmbEncodingChange
        Items.Strings = (
          'Auto'
          'Numeric'
          'Alphanumeric'
          'ISO-8859-1'
          'UTF-8 without BOM'
          'UTF-8 with BOM')
      end
    end
    object pnlTitle: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 789
      Height = 41
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      TabOrder = 3
      DesignSize = (
        789
        41)
      object lblKCTech: TLabel
        Left = 256
        Top = 4
        Width = 228
        Height = 26
        Anchors = []
        Caption = 'KC Techs'#39's QR Generator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Palatino Linotype'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 768
    Top = 552
  end
end
