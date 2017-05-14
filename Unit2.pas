unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    OpenFile: TMenuItem;
    OpenDialog1: TOpenDialog;
    Sort: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, strutils, types;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  form3.Show;
  form2.Hide;
end;


procedure TForm2.FormCreate(Sender: TObject);
var
  i : integer;
begin
  with StringGrid1 do
  begin
    Cells[1, 0] := '�������� ������';
    Cells[2, 0] := '����';
    Cells[3, 0] := '��������';
    Cells[4, 0] := '������� ������';
    Cells[5, 0] := '��� �������';
    Cells[6, 0] := '������� ����������';
    Cells[7, 0] := '�������';
    for i := 1 to 15 do
      cells[0, i] := inttostr(i);
  end;
end;


procedure TForm2.N1Click(Sender: TObject);
var
  S: String;
begin
with StringGrid1 do
    begin
    S := Rows[1].Text;
    Rows[1].Text := Rows[2].Text;
    Rows[2].Text := S;
    end;
end;

procedure TForm2.OpenFileClick(Sender: TObject);
var
  i, j, k : byte;
  st : TStringlist;
  a : TStringDynArray;
begin
  OpenDialog1.Execute;
  st := TStringList.Create;
  st.LoadFromFile(OpenDialog1.FileName);
  a := SplitString(st.Text, '\');
  k := 1;
  for j := 1 to StringGrid1.RowCount do
    begin
      dec(k);
      for I := 1 to StringGrid1.ColCount do
        begin
          StringGrid1.Cells[i,j] := a[k];
          inc(k);
        end;
    end;
  st.Free;
end;

end.