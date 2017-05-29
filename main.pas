unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    OpenTableButton: TButton;
    QuitButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure OpenTableButtonClick(Sender: TObject);
    procedure QuitButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses table;

procedure TForm1.OpenTableButtonClick(Sender: TObject);
begin
 form2.show;
 form1.Hide;
end;

procedure TForm1.QuitButtonClick(Sender: TObject);
begin
  form1.Close;
end;


end.
