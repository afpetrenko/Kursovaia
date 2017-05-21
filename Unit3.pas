unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus;

type
  TForm3 = class(TForm)
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  check : boolean;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
   with StringGrid2 do
  begin
    Cells[0, 0] := '�';
    Cells[1, 0] := '�������� ������';
    Cells[2, 0] := '����';
    Cells[3, 0] := '��������';
    Cells[4, 0] := '������� ������';
    Cells[5, 0] := '��� �������';
    Cells[6, 0] := '������� ����������';
    Cells[7, 0] := '�������';
  end;
end;


procedure TForm3.Button1Click(Sender: TObject);
var
  s, s1 : string;
  i, j, l : byte;
  findindex : boolean;
begin
  findindex := false;
  if check = true then
    begin
      with StringGrid2 do
      for i := 1 to StringGrid2.RowCount do
        Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
  j := 1;
  s := Edit1.Text;
  for I := 1 to Form2.StringGrid1.RowCount do
    begin
      s1 := Trim(Form2.StringGrid1.Cells[7, i]);
      if s1 = s then
        begin
          if j > 1 then StringGrid2.RowCount := StringGrid2.RowCount + 1;
          StringGrid2.Rows[j] := Form2.StringGrid1.Rows[i];
          inc(j);
          findindex := true;
        end;
    end;
       if findindex = false then
      Showmessage('������ �� �������');
    check := true;
end;


procedure TForm3.Button2Click(Sender: TObject);
var
  s, s1 : string;
  i, j, l : byte;
  findindex : boolean;
begin
  findindex := false;
  if check = true then
    begin
      with StringGrid2 do
      for i := 1 to StringGrid2.RowCount do
        Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
  j := 1;
  s := Edit2.Text;
  for I := 1 to Form2.StringGrid1.RowCount do
    begin
      s1 := Trim(Form2.StringGrid1.Cells[3, i]);
      if s1 = s then
        begin
          if j > 1 then StringGrid2.RowCount := StringGrid2.RowCount + 1;
          StringGrid2.Rows[j] := Form2.StringGrid1.Rows[i];
          inc(j);
          findindex := true;
        end;
    end;
    if findindex = false then
      Showmessage('������ �� �������');
    check := true;
end;
end.
