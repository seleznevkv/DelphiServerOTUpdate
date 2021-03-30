program SiteOTUpdate;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnitMain in 'UnitMain.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
