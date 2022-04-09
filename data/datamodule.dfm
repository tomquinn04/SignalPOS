object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 337
  Width = 498
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=pos'
      'User_Name=pos'
      'Password=pos'
      'Port=3306'
      'Server=localhost'
      'DriverID=MySQL')
    ConnectedStoredUsage = [auRunTime]
    Connected = True
    Left = 192
    Top = 128
  end
  object QryLogin: TFDQuery
    Connection = FDConnection1
    Left = 312
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 408
    Top = 240
  end
  object QryProducts: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * From tblproducts;')
    Left = 232
    Top = 216
  end
end
