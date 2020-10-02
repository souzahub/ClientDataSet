program Projeto_ClientDataSet;

uses
  Vcl.Forms,
  Luan_ClientDataSet in 'Luan_ClientDataSet.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
