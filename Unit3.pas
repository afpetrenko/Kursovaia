unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus,
  Vcl.DBCtrls;

type
  TForm3 = class(TForm)
    StringGrid2: TStringGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  check : boolean;
  s : string;

implementation

uses Unit2, StrUtils;

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
  Combobox2.Items.add('�����');
  Combobox1.Items.Add('���');

  Label1.Visible := false;
  Label2.Visible := false;

end;




procedure TForm3.Button1Click(Sender: TObject);
var
  i : byte;
begin
  Label1.Visible := false;
  Label2.Visible := false;
  for i := 1 to StringGrid2.RowCount do
    begin
      StringGrid2.Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
end;

Procedure TForm3.ComboBox1Select(Sender: TObject);
var
  s, s1 : string;
  i, j : byte;
  findindex : boolean;
begin
  Label2.Visible := false;
  findindex := false;
  if check = true then
    begin
      with StringGrid2 do
      for i := 1 to StringGrid2.RowCount do
        Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
  j := 1;
  s := Combobox1.Text;
  s := AnsiLowerCase(s);
  for I := 1 to Form2.StringGrid1.RowCount do
    begin
      s1 := Trim(Form2.StringGrid1.Cells[7, i]);
      s1 := AnsiLowerCase(s1);
      if pos(s, s1) > 0 then
        begin
          if j > 1 then StringGrid2.RowCount := StringGrid2.RowCount + 1;
          StringGrid2.Rows[j] := Form2.StringGrid1.Rows[i];
          StringGrid2.Cells[0, j] := IntToStr(j);
          inc(j);
          findindex := true;
        end;
    end;
       if findindex = false then
        begin
      Showmessage('������ �� �������');
        end
        else
        Label1.Visible := true;
    check := true;
end;


procedure TForm3.ComboBox2Select(Sender: TObject);
var
  s, s1 : string;
  i, j : byte;
  findindex : boolean;
begin
  Label1.Visible := false;
  findindex := false;
  if check = true then
    begin
      with StringGrid2 do
      for i := 1 to StringGrid2.RowCount do
        Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
  j := 1;
  s := ComboBox2.Text;
  s := Trim(s);
  s := AnsiLowerCase(s);
  for I := 1 to Form2.StringGrid1.RowCount do
    begin
      s1 := Trim(Form2.StringGrid1.Cells[3, i]);
      s1 := AnsiLowerCase(s1);
      if pos(s, s1) > 0 then
        begin
          if j > 1 then StringGrid2.RowCount := StringGrid2.RowCount + 1;
          StringGrid2.Rows[j] := Form2.StringGrid1.Rows[i];
          StringGrid2.Cells[0, j] := IntToStr(j);
          inc(j);
          findindex := true;
        end;
    end;
    if findindex = false then
      begin
      Showmessage('������ �� �������');
      end
      else
      Label2.Visible := true;
    check := true;
end;
end.
