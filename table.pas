unit Table;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    OpenFile: TMenuItem;
    OpenDialog1: TOpenDialog;
    Sort: TMenuItem;
    SortIncButton: TMenuItem;
    SortDecButton: TMenuItem;
    OpenFinderButton: TMenuItem;
    Save: TMenuItem;
    SaveAs: TMenuItem;
    SaveDialog1: TSaveDialog;
    RowIndexEdit: TEdit;
    AddRowButton: TButton;
    DelRowButton: TButton;
    ClearStingGrid: TButton;
    OpenMainButton: TMenuItem;

    procedure AddRowButtonClick(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SortIncButtonClick(Sender: TObject);
    procedure SortDecButtonClick(Sender: TObject);
    procedure OpenFinderButtonClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure DelRowButtonClick(Sender: TObject);
    procedure ClearStingGridClick(Sender: TObject);
    procedure OpenMainButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  StringGrid1 : TStringGrid;

implementation

uses finder, strutils, types, main;

{$R *.dfm}

procedure TForm2.DelRowButtonClick(Sender: TObject);
var
  index : integer;
  i, c : byte;
begin
  if TryStrToInt(RowIndexEdit.Text, index) then
    begin
      if (index > 0) and (index <= StringGrid1.RowCount) then
        begin
          c := index - 1;
          if index = StringGrid1.RowCount then
            StringGrid1.Rows[index].Clear
              else
            for I := index to StringGrid1.RowCount - 1 do
              begin
                StringGrid1.Rows[i] := StringGrid1.Rows[i + 1];
                c := c + 1;
                StringGrid1.Cells[0, i] := IntToStr(c);
              end;
          StringGrid1.RowCount := StringGrid1.RowCount - 1;
        end
        else
        ShowMessage('Вы ввели неккоректное число');
    end
    else
    ShowMessage('Введите число');
end;


procedure TForm2.ClearStingGridClick(Sender: TObject);
begin
 StringGrid1.RowCount := 2;
 StringGrid1.Rows[1].Clear;
end;

procedure TForm2.AddRowButtonClick(Sender: TObject);
var
  index, t : integer;
  i : byte;
begin
  if TryStrToInt(RowIndexEdit.Text, index) then
    begin
      if (index >= 0) and (index < StringGrid1.RowCount) then
        begin
          if index = StringGrid1.RowCount then
            begin
              StringGrid1.RowCount := StringGrid1.RowCount + 1;
              StringGrid1.Cells[0, index + 1] := IntToStr(index + 1);
            end;
          StringGrid1.RowCount := StringGrid1.RowCount + 1;
          t := StringGrid1.RowCount;
          for I := StringGrid1.RowCount downto index + 2 do
            begin
              StringGrid1.Rows[i] := StringGrid1.Rows[i - 1];
              StringGrid1.Cells[0, i] := IntToStr(t);
              t := t - 1;
            end;
          StringGrid1.Rows[index + 1].Clear;
          StringGrid1.Cells[0, index + 1] := IntToStr(t);
        end
        else
        ShowMessage('Вы ввели неккоректное число');
    end
    else
    ShowMessage('Введите число');
    StringGrid1.Cells[5, index + 1] := ' ';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
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
end;




procedure TForm2.SortIncButtonClick(Sender: TObject);
type
  str = array[1..7] of string;
var
  i, j, k : byte;
  s : str;
  t, t1 : string;
begin
  i := 1;
  with StringGrid1 do
    begin
      while i < StringGrid1.RowCount - 1 do
        begin
        if Cells[5, i] <> ' ' then
            begin
              t := StringGrid1.Cells[5, i];
            end
            else
              t := '0';
            if Cells[5, i + 1] <> ' ' then
              begin
              t1 := StringGrid1.Cells[5, i + 1];
              end
              else
              t1 := '0';
              if StrToInt(t) > StrToInt(t1) then
                begin
                  for j := 1 to 7 do
                    begin
                      s[j] := cells[j, i];
                    end;
                  k := i;
                  repeat
                    for j := 1 to 7 do
                      begin
                        cells[j, k] := cells[j, k + 1];
                        cells[j, k + 1] := s[j];
                      end;
                    inc(k);
                  until (cells[5, k] < cells[5, k + 1]) or (k = StringGrid1.RowCount - 1);
                  if i > 1 then dec(i);
                  end
                  else
                    inc(i);
              end;
          end;
      end;




procedure TForm2.SortDecButtonClick(Sender: TObject);
type
  str = array[1..7] of string;
var
  t, t1 : string;
  i, j, k : byte;
  s : str;
begin
  i := 1;
  with StringGrid1 do
    begin
      while i < StringGrid1.RowCount - 1 do
        begin
          if Cells[5, i] <> ' ' then
            begin
              t := StringGrid1.Cells[5, i];
            end
            else
              t := '0';
            if Cells[5, i + 1] <> ' ' then
              begin
              t1 := StringGrid1.Cells[5, i + 1];
              end
              else
              t1 := '0';
              if StrToInt(t) < StrToInt(t1) then
                begin
                  for j := 1 to 7 do
                    begin
                      s[j] := cells[j, i];
                    end;
                  k := i;
                  repeat
                    for j := 1 to 7 do
                      begin
                        cells[j, k] := cells[j, k + 1];
                        cells[j, k + 1] := s[j];
                      end;
                    inc(k);
                  until (cells[5, k] > cells[5, k + 1]) or (k = StringGrid1.RowCount - 1);
                  if i > 1 then dec(i);
                  end
                  else
                    inc(i);
              end;
            end;
      end;

procedure TForm2.OpenFinderButtonClick(Sender: TObject);
begin
 form3.Show
end;

procedure TForm2.OpenMainButtonClick(Sender: TObject);
begin
  Form1.Show;
  Form2.Close;
end;

procedure TForm2.OpenFileClick(Sender: TObject);
var
  i, j, k, l : byte;
  c : extended;
  st : TStringlist;
  a : TStringDynArray;
begin
  OpenDialog1.Execute;
  if OpenDialog1.FileName <> '' then
    begin
  st := TStringList.Create;
  st.LoadFromFile(OpenDialog1.FileName);
  a := SplitString(st.Text, '\');
  k := 1;
  c := (length(a)-1)/7;
  l := trunc(c);
  StringGrid1.RowCount := 2;
  StringGrid1.Rows[1].Clear;
  for j := 1 to l do
    begin
      StringGrid1.Cells[0, j] := IntToStr(j);
      dec(k);
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      for I := 1 to StringGrid1.ColCount do
        begin
          StringGrid1.Cells[i,j] := a[k];
          inc(k);
        end;
    end;
  StringGrid1.RowCount := StringGrid1.RowCount - 1;
  st.Free;
    end;
end;


procedure TForm2.SaveAsClick(Sender: TObject);
var
  st : TStringList;
  i, j : byte;
begin
   st := TStringList.Create;
   with StringGrid1 do
    begin
      for I := 1 to StringGrid1.RowCount - 1 do
        for j := 1 to StringGrid1.ColCount - 1 do
          st.Add(StringGrid1.Cells[j, i] + '\')

    end;
    SaveDialog1.Execute;
    if SaveDialog1.FileName <> '' then
        begin
          st.SaveToFile(SaveDialog1.FileName + '.txt');
          st.Free;
        end;
end;

procedure TForm2.SaveClick(Sender: TObject);
var
  st : TStringList;
  i, j : byte;
begin
   st := TStringList.Create;
   with StringGrid1 do
    begin
      for I := 1 to StringGrid1.RowCount - 1 do
        for j := 1 to StringGrid1.ColCount - 1 do
          st.Add(StringGrid1.Cells[j, i] + '\')

    end;
    st.SaveToFile(OpenDialog1.FileName);
    st.Free;
end;

end.
