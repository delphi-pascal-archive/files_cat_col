unit Fc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FileCtrl, Jpeg, Mask, ComCtrls,  ComObj, ShlObj, ActiveX;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button3: TButton;
    Label6: TLabel;
    Bevel3: TBevel;
    Label8: TLabel;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Button5: TButton;
    Edit3: TEdit;
    Button6: TButton;
    Edit4: TEdit;
    Button7: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Button8: TButton;
    Bevel4: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Button9: TButton;
    Label19: TLabel;
    Label20: TLabel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Bevel5: TBevel;
    Label26: TLabel;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    Edit5: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Image1: TImage;
    Label32: TLabel;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Edit6: TEdit;
    Button19: TButton;
    Edit7: TEdit;
    Button20: TButton;
    Button21: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Label33: TLabel;
    Button28: TButton;
    ListBox1: TListBox;
    Memo1: TMemo;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Button30: TButton;
    Label34: TLabel;
    Button31: TButton;
    Label35: TLabel;
    Button29: TButton;
    Button32: TButton;
    Label7: TLabel;
    Label36: TLabel;
    Button33: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Button30KeyPress(Sender: TObject; var Key: Char);
    procedure Button30MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button31Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenFile(const Filename: string);
  end;

var
  Form1: TForm1;

implementation

uses ShellApi;

var
 f:Boolean;
 exit:Boolean=true;
 m,k:integer;
 //mas1: array[0..8] of integer=(clRed,clGreen,clBlue,clYellow,clWhite,clBlack,clPurple,clOlive,clMaroon);
 //mas2: array[0..8] of integer=(clYellow,clWhite,clRed,clBlack,clBlue,clMaroon,clOlive,clPurple,clGreen);

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
 Label2.Caption:='Объем диска C - '+IntToStr(DiskSize(3) div 1024)+' Кб';
 Label3.Caption:='Свободно на диске C - '+IntToStr(DiskFree(3) div 1024)+' Кб';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Label4.Caption:='Объем диска D - '+IntToStr(DiskSize(4) div 1024)+' Кб';
 Label5.Caption:='Свободно на диске D - '+IntToStr(DiskFree(4) div 1024)+' Кб';
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 Path:string;
begin
 Path:=GetCurrentDir;
 if SelectDirectory(Path,[sdAllowCreate,sdPerformCreate,sdPrompt],0)
 then Label6.Caption:='Dir 1 - '+Path;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if not RenameFile(Edit1.Text,Edit2.Text)
 then MessageDlg('File not renamed!',mtError,[mbOK],0);
 FileListBox1.Update; 
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 if FileExists(Edit3.Text) then DeleteFile(Edit3.Text)
 else MessageDlg('File not found!',mtError,[mbOK],0);
 FileListBox1.Update;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 if Edit4.Text='' then MessageDlg('Enter filename!',mtWarning,[mbOK],0);
 if not FileExists(Edit4.Text) then FileCreate(Edit4.Text)
 else MessageDlg('File already exists!',mtWarning,[mbOK],0);
 FileListBox1.Update;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 Label12.Caption:=FileSearch('gwcity.exe','D:\map\;D:\');
end;

procedure TForm1.Button8Click(Sender: TObject);
label 10;
var
 sr:TsearchRec;
begin
 if FindFirst('D:\map\*.*',faHidden,sr)=0 then
  begin
   Label18.Caption:=sr.Name+' - '+IntTostr(sr.Size);
  10:
   if MessageDlg('Find next?',mtConfirmation,[mbYes,mbNo],0)=mrYes
   then if FindNext(sr)=0
   then
    begin
     Label18.Caption:=sr.Name+' - '+IntTostr(sr.Size);
     goto 10;
    end;
  end;
 FindClose(sr);
 MessageDlg('Find stopped',mtConfirmation,[mbOK],0);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 Label19.Caption:='Объем диска A - '+IntToStr(DiskSize(1) div 1024)+' Кб';
 Label20.Caption:='Свободно на диске A - '+IntToStr(DiskFree(1) div 1024)+' Кб';
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 Label21.Caption:=ExtractFilePath(Application.ExeName);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 Label22.Caption:=Application.ExeName;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
 Label23.Caption:=ExtractFileDir(Application.ExeName);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
 Label24.Caption:=ExtractFileDrive(Application.ExeName);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 Label25.Caption:=ExtractFileName(Application.ExeName);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
 f:=true;
 FilterComboBox1.Filter:=GraphicFilter(TGraphic);
 FileListBox1.Multiselect:=false;
 Image1.Visible:=true;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
 f:=false;
 FilterComboBox1.Filter:='All files (*.*)|*.*|Exe files (*.exe)|*.exe|Txt files (*.txt)|*.txt|Html files (*.htm)|*.htm|Bmp files (*.bmp)|*.bmp';
 Image1.Visible:=false;
 FileListBox1.Multiselect:=true;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
 if f then
  begin
   if FileListBox1.FileName=''
   then Image1.Picture:=nil
   else Image1.Picture.LoadFromFile(FileListBox1.FileName);
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 if Image1.Stretch=false then Image1.Stretch:=true
  else Image1.Stretch:=false;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
 i:integer;
begin
 if MessageDlg('Вы действительно хотите удалить файл (файлы)?', mtConfirmation,
    [mbYes, mbNo],0)=mrYes then
    begin
     for i:=FileListBox1.Items.Count-1 downto 0 do
     if FileListBox1.Selected[i] then
      begin
       //if DeleteFile(FileListBox1.FileName)
       FileClose(i);
       DeleteFile(FileListBox1.Items[i])
      end;
     FileListBox1.Update;
    end
  else
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
 if FileExists(FileListBox1.FileName) then
 if not RenameFile(FileListBox1.FileName,Edit6.Text)
 then MessageDlg('File not renamed!',mtError,[mbOK],0)
 else FileListBox1.Update;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
 if not DirectoryExists(Edit7.Text) then
  begin
   if not CreateDir(Edit7.Text)
   then MessageDlg('Directory not createded!',mtError,[mbOK],0)
   else DirectoryListBox1.Update;
 end
 else MessageDlg('Directory exist!',mtError,[mbOK],0)
end;

procedure TForm1.Button20Click(Sender: TObject);
var
 i:integer;
begin
 if MessageDlg('Вы действительно хотите удалить директорию?', mtConfirmation,
    [mbYes, mbNo],0)=mrYes then
     begin
      for i:=DirectoryListBox1.Items.Count-1 downto 0 do
      if DirectoryListBox1.Selected[i] then
       begin
        if not RemoveDir(DirectoryListBox1.Items[i])
        then MessageDlg('Directory not deleted!',mtError,[mbOK],0);
       end;
      DirectoryListBox1.Update;
     end;
end;

procedure TForm1.Button21Click(Sender: TObject);
var
 fh:integer;
begin
 fh:=FileOpen(FileListBox1.FileName,fmOpenWrite);
 if fh<0 then ShowMessage('File not open!');
{   if OpenDialog1.Execute then
    OpenFile(OpenDialog1.FileName);}
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not exit then Action:=caNone
 else Action:=caFree;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
 DirectoryListBox1.Directory:='c:\';
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
 DirectoryListBox1.Directory:='d:\';
end;

procedure TForm1.Button26Click(Sender: TObject);
var
 i:integer;
begin
 for i:=FileListBox1.Items.Count-1 downto 0 do
  begin
   FileListBox1.Selected[i]:=true;
  end;
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
 if Combobox1.Text='Canvas.TextOut'
 then
  begin
   m:=2;
   if Timer7.Enabled=false then Timer7.Enabled:=true
   else Timer7.Enabled:=false;
   Timer5.Enabled:=false;
   Timer6.Enabled:=false;
  end;
 if Combobox1.Text='Dots'
 then
  begin
   m:=0;
   if Timer5.Enabled=false then Timer5.Enabled:=true
   else Timer5.Enabled:=false;
   Timer6.Enabled:=false;
   Timer7.Enabled:=false;
  end;
 if Combobox1.Text='Color_dots'
 then
  begin
   m:=1;
   if Timer6.Enabled=false then Timer6.Enabled:=true
   else Timer6.Enabled:=false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 DriveComboBox1.Drive:='c';//чтобы не показывало путь к файлу
 DriveComboBox1.Drive:='d';
end;

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
 ListBox1.Items.Assign(DirectoryListBox1.Items);
 Memo1.Lines.Assign(DirectoryListBox1.Items);
 k:=(DirectoryListBox1.Items.Count-1);
 Label34.Caption:='Всего директорий: '+IntToStr(k)+' шт.';
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var
 i:integer;
begin
 Randomize;
 for i:=1 to 10000 do//за 1 раз 10000 штук
   begin //Запись в произвольно позициях окна
    Form1.Canvas.TextOut(Random(Width), Random(Height),'.');
     if m=0 then
      begin
       Form1.Canvas.Font.Color:=clBlack;
       Form1.Canvas.Brush.Color:=clWhite;
      end;
   end;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
var
 i:integer;
 c,tc:TColor;
begin
 Randomize;
 c:=random($1000000);
 tc:=random($1000000);
 for i:=1 to 150000 do//за 1 раз 150000 штук
   begin //Запись в произвольно позициях окна
    Form1.Canvas.TextOut(Random(Width), Random(Height),'.');
     if m=1 then
      begin
   //    Form1.Canvas.Font.Size:=10;
       Form1.Canvas.Font.Color:=c;
       Form1.Canvas.Brush.Color:=tc;
      end;
   end;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
var
 i:integer;
begin
 Randomize;
 for i:=1 to 50 do//за 1 раз 50 штук
   begin //Запись в произвольно позициях окна
    Form1.Canvas.TextOut(Random(Width), Random(Height),'TextOut');
     if m=2 then
      begin
       Form1.Canvas.Font.Color:=clBlack;
       Form1.Canvas.Brush.Color:=clWhite;
      end;
   end;
end;

procedure TForm1.Button30KeyPress(Sender: TObject; var Key: Char);
begin
 if Key='2' then
  begin
   Key:=#0;
   Button30.Top:=Button30.Top+10;
  end;
 if Key='5' then
  begin
   Key:=#0;
   Button30.Top:=Button30.Top-10;
  end;
  if Key='1' then
  begin
   Key:=#0;
   Button30.Left:=Button30.Left-10;
  end;
 if Key='3' then
  begin
   Key:=#0;
   Button30.Left:=Button30.Left+10;
  end;
end;

procedure TForm1.Button30MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 //if Button <> mbLeft then exit;
 ReleaseCapture;
 //Edit1.Perform(WM_SysCommand,$F012,0);
 (Sender as TWinControl).Perform(WM_SysCommand,$F012,0);
end;

procedure TForm1.Button31Click(Sender: TObject);
var
 Dir1,Dir2:string;
begin
 SelectDirectory('Просмотр каталога',Dir1,Dir2);
 Label35.Caption:='Dir 2 - '+Dir2;
end;

procedure TForm1.FileListBox1DblClick(Sender: TObject);
begin
 OpenFile(FileListbox1.FileName);
end;

procedure TForm1.OpenFile(const Filename: string);
begin
 Image1.Picture.LoadFromFile(Filename);
end;

procedure TForm1.Button29Click(Sender: TObject);
var
 Dir1,Dir2:string;
 EditFile:string;
 OpStruc:TSHFileOpStruct;
 frombuf,tobuf: array [0..128] of Char;
begin
 EditFile:=FileListBox1.FileName;
 SelectDirectory('Просмотр каталога записи',Dir1,Dir2);
 FillChar(frombuf,Sizeof(frombuf),0);
 FillChar(tobuf,Sizeof(tobuf),0);
 StrPCopy(frombuf,EditFile);
 StrPCopy(tobuf,Dir2);
 with OpStruc do
  begin
   Wnd:=Handle;
   wFunc:=FO_COPY;
   pFrom:=@frombuf;
   pTo:=@tobuf;
   fFlags:=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted:= False;
   hNameMappings:=nil;
   lpszProgressTitle:=nil;
  end;
 ShFileOperation(OpStruc);
end;

procedure TForm1.FileListBox1Click(Sender: TObject);
begin
 Button29.Enabled:=true;
end;

procedure TForm1.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 ListBox1.Visible:=true;
end;

procedure TForm1.Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Memo1.Visible:=true;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if ListBox1.Visible=false then ListBox1.Visible:=true
 else ListBox1.Visible:=false;
 if Memo1.Visible=false then Memo1.Visible:=true
 else Memo1.Visible:=false;
// ListBox1.Visible:=false;
// Memo1.Visible:=false;
end;

procedure TForm1.Button32Click(Sender: TObject);
var
 alphabet,temp:string;
 i:integer;
begin
 alphabet:='abcdefghijklmnopqrstucvwxyz';//27 simv
  begin
   temp:='';
   for i:=1 to 8 do
     temp:=Concat(temp, alphabet[Random(length(alphabet)-1)+1]);
   temp:=Concat(temp, '.');
   for i:=1 to 3 do
    temp:=Concat(temp, alphabet[Random(length(alphabet)-1)+1]);
  end;
 Label36.Caption:=temp;
end;

procedure TForm1.Button33Click(Sender: TObject);
var
 Link: IShellLink;
begin
 //Создаем объект ярлык
 CoInitialize(nil);
 Link:=CreateComObject(CLSID_ShellLink) as IShellLink;
 //Устанавливаем путь к целевому объекту
 OleCheck(Link.SetPath(PChar(DirectorylistBox1.Directory)));
 //Сохраняем сам ярлык
 OleCheck((Link as IPersistFile).Save('c:\windows\desktop\_N_E_W_.lnk',true));
 CoUninitialize;
end;

initialization
 randomize; 

end.
