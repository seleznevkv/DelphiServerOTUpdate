object dm: Tdm
  OldCreateOrder = False
  Height = 413
  Width = 405
  object OTSource: TDataSource
    DataSet = OTSet
    Left = 304
    Top = 16
  end
  object OTSet: TADODataSet
    Connection = OTConnection
    CursorType = ctStatic
    CommandText = 
      'select * from Instructions '#13#10'where pagename = :ds'#13#10'order by numb' +
      'er'
    Parameters = <
      item
        Name = 'ds'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    Left = 216
    Top = 16
    object OTSetnumber: TIntegerField
      FieldName = 'number'
    end
    object OTSetfileName: TWideStringField
      FieldName = 'fileName'
      Size = 200
    end
    object OTSetfileCaption: TWideStringField
      FieldName = 'fileCaption'
      Size = 500
    end
    object OTSetkeyName: TWideStringField
      FieldName = 'keyName'
      Size = 200
    end
    object OTSetPageName: TWideStringField
      FieldName = 'PageName'
      Size = 100
    end
  end
  object OTConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=203010;Persist Security Info=True;U' +
      'ser ID=asKubahov;Initial Catalog=OT;Data Source=192.168.76.100'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 16
  end
end
