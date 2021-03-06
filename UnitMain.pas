unit UnitMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  Tdm = class(TDataModule)
    OTSource: TDataSource;
    OTSet: TADODataSet;
    OTConnection: TADOConnection;
    OTSetnumber: TIntegerField;
    OTSetfileName: TWideStringField;
    OTSetfileCaption: TWideStringField;
    OTSetkeyName: TWideStringField;
    OTSetPageName: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
