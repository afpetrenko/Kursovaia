unit Finder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus,
  Vcl.DBCtrls;

type
  TForm3 = class(TForm)
    StringGrid2: TStringGrid;
    RewardBox: TComboBox;
    ProducerBox: TComboBox;
    RewardLabel: TLabel;
    ProducerLabel: TLabel;
    ClearStringGrid: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RewardBoxSelect(Sender: TObject);
    procedure ProducerBoxSelect(Sender: TObject);
    procedure ClearStringGridClick(Sender: TObject);
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

uses table, StrUtils;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
   with StringGrid2 do
  begin
    Cells[0, 0] := '№';
    Cells[1, 0] := 'Название фильма';
    Cells[2, 0] := 'Жанр';
    Cells[3, 0] := 'Режиссер';
    Cells[4, 0] := 'Ведущие актеры';
    Cells[5, 0] := 'Год выпуска';
    Cells[6, 0] := 'Краткое содержание';
    Cells[7, 0] := 'Награды';
  end;
  ProducerBox.Items.add('Нолан');
  RewardBox.Items.Add('нет');

  RewardLabel.Visible := false;
  ProducerLabel.Visible := false;

end;




procedure TForm3.ClearStringGridClick(Sender: TObject);
var
  i : byte;
begin
   RewardLabel.Visible := false;
  ProducerLabel.Visible := false;
  for i := 1 to StringGrid2.RowCount do
    begin
      StringGrid2.Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
end;

Procedure TForm3.RewardBoxSelect(Sender: TObject);
var
  s, s1 : string;
  i, j : byte;
  findindex : boolean;
begin
  ProducerLabel.Visible := false;
  findindex := false;
  if check = true then
    begin
      with StringGrid2 do
      for i := 1 to StringGrid2.RowCount do
        Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
  j := 1;
  s := RewardBox.Text;
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
      Showmessage('Ничего не найдено');
        end
        else
        RewardLabel.Visible := true;
    check := true;
end;


procedure TForm3.ProducerBoxSelect(Sender: TObject);
var
  s, s1 : string;
  i, j : byte;
  findindex : boolean;
begin
  RewardLabel.Visible := false;
  findindex := false;
  if check = true then
    begin
      with StringGrid2 do
      for i := 1 to StringGrid2.RowCount do
        Rows[i].Clear;
    end;
  StringGrid2.RowCount := 2;
  j := 1;
  s := ProducerBox.Text;
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
      Showmessage('Ничего не найдено');
      end
      else
      ProducerLabel.Visible := true;
    check := true;
end;
end.
