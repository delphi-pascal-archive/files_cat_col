program Filecat;

uses
  Forms,
  Fc in 'Fc.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
