object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 448
  ClientWidth = 681
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
    Left = 86
    Top = 111
    Width = 94
    Height = 19
    Caption = 'Minha Tabela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 512
    Top = 11
    Width = 136
    Height = 23
    Caption = 'Banco de Dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 279
    Top = 261
    Width = 208
    Height = 13
    Caption = '----------------------------------------------------'
  end
  object insert: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 0
    OnClick = insertClick
  end
  object remove: TButton
    Left = 200
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Remover'
    TabOrder = 1
    OnClick = removeClick
  end
  object edit: TButton
    Left = 105
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = editClick
  end
  object i_name: TEdit
    Left = 8
    Top = 21
    Width = 267
    Height = 21
    TabOrder = 3
    Text = 'Item'
  end
  object grid1: TDBGrid
    Left = 8
    Top = 136
    Width = 265
    Height = 289
    DataSource = ds1
    DrawingStyle = gdsGradient
    GradientEndColor = clMaroon
    GradientStartColor = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 488
    Top = 40
    Width = 185
    Height = 401
    DataSource = ds2
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 336
    Top = 256
    Width = 97
    Height = 25
    Caption = '> > Transferir > >'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 7
    OnClick = Button2Click
  end
  object ds1: TDataSource
    DataSet = cds
    Left = 296
    Top = 136
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 192
    object cdsNAME: TStringField
      Alignment = taCenter
      FieldName = 'NAME'
    end
    object cdsID: TFDAutoIncField
      Alignment = taCenter
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object con: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=data.s3db')
    Left = 456
    Top = 40
  end
  object query: TFDQuery
    AfterExecute = queryAfterExecute
    Connection = con
    Left = 456
    Top = 80
  end
  object ds2: TDataSource
    DataSet = query
    Left = 456
    Top = 128
  end
end
