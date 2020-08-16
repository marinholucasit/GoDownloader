object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'GoDownloader'
  ClientHeight = 112
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 66
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 447
    object edtUrl: TLabeledEdit
      Left = 0
      Top = 26
      Width = 462
      Height = 21
      EditLabel.Width = 144
      EditLabel.Height = 19
      EditLabel.Caption = 'Url para Download: '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 0
    end
    object pbProgress: TProgressBar
      Left = 1
      Top = 48
      Width = 461
      Height = 17
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 53
      ExplicitWidth = 150
    end
  end
  object gbBottons: TGroupBox
    Left = 0
    Top = 66
    Width = 463
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 120
    ExplicitWidth = 454
    object btnStart: TButton
      Left = 9
      Top = 8
      Width = 92
      Height = 25
      Caption = 'Iniciar Download'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnShowMsg: TButton
      Left = 102
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Exibir Mensagem'
      TabOrder = 1
    end
    object Button1: TButton
      Left = 202
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Para Download'
      TabOrder = 2
    end
    object Button2: TButton
      Left = 300
      Top = 8
      Width = 156
      Height = 25
      Caption = 'Exibir Hist'#243'rico de Downloads'
      TabOrder = 3
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 192
  end
end
