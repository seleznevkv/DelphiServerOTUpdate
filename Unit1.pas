unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, UnitMain,
  cxGrid, cxContainer, Vcl.DBCtrls, cxTextEdit, cxDBEdit, cxMaskEdit, cxSpinEdit,
  Vcl.ExtCtrls, Vcl.ComCtrls
  ;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1number: TcxGridDBColumn;
    cxGrid1DBTableView1fileName: TcxGridDBColumn;
    cxGrid1DBTableView1fileCaption: TcxGridDBColumn;
    cxGrid1DBTableView1keyName: TcxGridDBColumn;
    PCDialog: TOpenDialog;
    SerDialog: TOpenDialog;
    GroupBox2: TGroupBox;
    RazdLabel: TLabel;
    OboznLabel: TLabel;
    TextLabel: TLabel;
    RazdelList: TComboBox;
    NaimMemo: TDBMemo;
    KeyEdit: TcxDBTextEdit;
    AddButton: TButton;
    SaveButton: TButton;
    DeleteButton: TButton;
    PageEdit: TcxDBTextEdit;
    numedit: TcxDBSpinEdit;
    FileGrpBox: TGroupBox;
    FileLabel: TLabel;
    Label2: TLabel;
    FileButton: TButton;
    FServButton: TButton;
    FileStatus: TLabel;
    FileEdit: TcxDBTextEdit;
    RefButton: TButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    CapsBar: TStatusBar;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure RazdelListChange(Sender: TObject);
    procedure FileButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);

    procedure FServButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RefButtonClick(Sender: TObject);
    procedure fileservexist();
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var        fname,fdel:string;
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddButtonClick(Sender: TObject);
var i:integer;
begin
FileButton.Enabled:=true;
  Keyedit.Enabled:=true;
  naimmemo.Enabled:=true;
  savebutton.Enabled:=true;
  deletebutton.enabled:=true;
  fservbutton.Enabled:=true;


dm.OTSet.Append;
   filestatus.Font.Color:=clred;
   filestatus.Caption:='?????????? ??????? ????!';

i:=dm.OTSet.Recordcount;

numedit.text:=inttostr(i+1);


if razdellist.ItemIndex=0 then
PageEdit.Text:='laborProtection'

else if razdellist.ItemIndex=1 then
PageEdit.Text:='InstructionsForLaborProtection'

else if razdellist.ItemIndex=2 then
PageEdit.Text:='InstructionsForLaborProtectionKKC'

else if razdellist.ItemIndex=3 then
PageEdit.Text:='InstructionsForFireSafety'

else if razdellist.ItemIndex=4 then
PageEdit.Text:='InstructionsForSafeOperation'

else if razdellist.ItemIndex=5 then
PageEdit.Text:='InstructionsForSafeOperationKKC'

else if razdellist.ItemIndex=6 then
PageEdit.Text:='RegulationsForLaborProtection';



end;

procedure TForm1.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 fileservexist;
end;

procedure TForm1.DeleteButtonClick(Sender: TObject);
begin

if Application.MessageBox('?? ???????, ??? ?????? ??????? ???????','????????',mb_yesno)=idyes then
begin
fdel:='\\192.168.76.100\Server\www\other\InstructionsDOCs\'+dm.OTSetPageName.AsString+'\'+dm.OTSetfileName.AsString;
try
dm.OTSet.Delete;
DeleteFile(fdel);
except
  showmessage('????????? ?????? ??? ????????!');
end;
fileservexist;
end;




end;

procedure TForm1.FileButtonClick(Sender: TObject);
begin
if PCDialog.execute then    begin
fname:=PCDialog.FileName;
fileedit.Text:=ExtractFileName(fname);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
cxGrid1DBTableView1fileCaption.Width:=round(form1.Width*0.37);
keyedit.Visible:=false;
try
dm.OTConnection.Connected:=false;
dm.OTConnection.Connected:=true;
except
showmessage('?? ??????? ???????????? ? ???? ??????!');
end;
try
dm.OTSet.Close;
dm.OTSet.Parameters.ParamByName('ds').Value:='laborProtection';
Oboznlabel.Visible:=false;

dm.OTSet.Open;

fileservexist;

except
showmessage('?? ??????? ???????? ??????!');


end;



end;

procedure TForm1.FServButtonClick(Sender: TObject);
begin
serdialog.InitialDir:=pchar('\\192.168.76.100\Server\www\other\InstructionsDOCs\'+PageEdit.Text+'\');
if SerDialog.execute then    begin
fname:=SerDialog.FileName;
fileedit.Text:=ExtractFileName(fname);
end;
end;

procedure TForm1.RazdelListChange(Sender: TObject);
begin
    dm.OTSet.Close;
if razdellist.ItemIndex=0 then
dm.OTSet.Parameters.ParamByName('ds').Value:='laborProtection'

else if razdellist.ItemIndex=1 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForLaborProtection'

else if razdellist.ItemIndex=2 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForLaborProtectionKKC'

else if razdellist.ItemIndex=3 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForFireSafety'

else if razdellist.ItemIndex=4 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForSafeOperation'

else if razdellist.ItemIndex=5 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForSafeOperationKKC'

else if razdellist.ItemIndex=6 then
dm.OTSet.Parameters.ParamByName('ds').Value:='RegulationsForLaborProtection';

if razdellist.ItemIndex=0 then  begin
Oboznlabel.Visible:=false;
keyedit.Visible:=false;
end
else begin
Oboznlabel.Visible:=true;
keyedit.Visible:=true;
end;

dm.OTSet.Open;
fileservexist;




end;


 procedure TForm1.RefButtonClick(Sender: TObject);
begin
    dm.OTSet.Close;
if razdellist.ItemIndex=0 then
dm.OTSet.Parameters.ParamByName('ds').Value:='laborProtection'

else if razdellist.ItemIndex=1 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForLaborProtection'

else if razdellist.ItemIndex=2 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForLaborProtectionKKC'

else if razdellist.ItemIndex=3 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForFireSafety'

else if razdellist.ItemIndex=4 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForSafeOperation'

else if razdellist.ItemIndex=5 then
dm.OTSet.Parameters.ParamByName('ds').Value:='InstructionsForSafeOperationKKC'

else if razdellist.ItemIndex=6 then
dm.OTSet.Parameters.ParamByName('ds').Value:='RegulationsForLaborProtection';
try
  dm.OTSet.Open;
   fileservexist;
except
showmessage('???????? ?????? ??? ??????????!');

end;
end;

function ExctractFileName(FileName:string):string;
var i:integer;
begin
  i:=Length(Filename);
  if i<>0 then
  begin
    while (FileName[i]<>'\') and (i>0) do
    begin
      i:=i-1;
      Result:=Copy(FileName,i+1,Length(FileName)-1);
    end;
  end;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin

 if ((NaimMemo.Text<>'') and (fileedit.Text<>'')) and ((keyedit.Text<>'') or (keyedit.Visible=false)) then
 begin
if fileexists(pchar('\\192.168.76.100\Server\www\other\InstructionsDOCs\'+PageEdit.Text+'\'+FileEdit.Text)) then
begin
 if application.MessageBox('????? ???? ??? ??????????! ?? ????? ?????? ??? ?????????????','???? ??????????',mb_yesno)=idyes then
  begin
     try

     dm.OTSet.Edit;
     if (fname<>'') then
                begin   dm.OTSetFileName.Value:=ExtractFileName(fname);
CopyFile(pchar(fname),pchar('\\192.168.76.100\Server\www\other\InstructionsDOCs\'+PageEdit.Text+'\'+ExtractFileName(fname)),false);
end
else begin
   dm.OTSetFileName.Value:=fileedit.Text;
CopyFile(pchar(fname),pchar('\\192.168.76.100\Server\www\other\InstructionsDOCs\'+PageEdit.Text+'\'+fileedit.Text),false);
  end;

dm.OTSet.Post;
 fname:='';
fileservexist;
  except
   ShowMessage('??? ?????? ??? ?????????!');
 end;
   end;
    end
    else
    begin
    try
    dm.OTSet.Edit;
CopyFile(pchar(fname),pchar('\\192.168.76.100\Server\www\other\InstructionsDOCs\'+PageEdit.Text+'\'+ExtractFileName(fname)),false);
 dm.OTSetFileName.Value:=ExtractFileName(fname);
 dm.OTSet.Post;
 fileservexist;

  except
   ShowMessage('????????? ?????? ??? ??????????? ????? ??? ???? ?????? ?? ?????????? ?? ???????');
 end;
   end;
      end
      else showmessage('???????? ???? ? ????????? ????????? ????!');



end;




procedure TForm1.Timer1Timer(Sender: TObject);
begin

if GetKeyState(VK_CAPITAL) and 1=0 then
capsbar.Panels.Items[0].Text:='CapsLock OFF'
else capsbar.Panels.Items[0].Text:='CapsLock ON';
end;

procedure TForm1.fileservexist();

 begin
 if
   (fileexists(pchar('\\192.168.76.100\Server\www\other\InstructionsDOCs\'+dm.OTSetPageName.Value+'\'+dm.OTSetfileName.value))) then
 begin
 FileStatus.Font.Color:=clgreen;
 FileStatus.Caption:='???? ?? ???????!';
 end
 else  begin
 FileStatus.Font.Color:=clred;
 FileStatus.Caption:='???? ?? ??????!'
 end;
if dm.OTSet.RecordCount=0 then
begin
  FileButton.Enabled:=false;
  Keyedit.Enabled:=false;
  naimmemo.Enabled:=false;
  savebutton.Enabled:=false;
  deletebutton.enabled:=false;
  fservbutton.Enabled:=false;
end
else begin
  FileButton.Enabled:=true;
  Keyedit.Enabled:=true;
  naimmemo.Enabled:=true;
  savebutton.Enabled:=true;
  deletebutton.enabled:=true;
  fservbutton.Enabled:=true;
end;
 end;
end.
