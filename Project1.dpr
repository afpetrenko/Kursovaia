program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  table in 'table.pas' {Form2},
  Finder in 'Finder.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
