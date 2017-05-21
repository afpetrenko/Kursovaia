unit Unit2;

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
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Save: TMenuItem;
    SaveAs: TMenuItem;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;

    procedure Button1Click(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  StringGrid1 : TStringGrid;

implementation

uses Unit3, strutils, types;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
var
  s : string;
  index : integer;
  i, c : byte;
begin
  if TryStrToInt(Edit1.Text, index) then
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
    ShowMessage('������� �����');
end;


procedure TForm2.Button3Click(Sender: TObject);
begin
 StringGrid1.RowCount := 2;
 StringGrid1.Rows[1].Clear;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  index, t : integer;
  i : byte;
  c : boolean;
begin
  if TryStrToInt(Edit1.Text, index) then
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
    ShowMessage('������� �����');
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
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




procedure TForm2.N1Click(Sender: TObject);
type
  str = array[1..7] of string;
var
  i, j, k : byte;
  s : str;
begin
  i := 1;
  with StringGrid1 do
    begin
      while i < StringGrid1.RowCount - 1 do
        begin
          if Cells[5, i] <> '' then
            begin
              if Cells[5, i] > Cells[5, i + 1] then
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
 end;




procedure TForm2.N2Click(Sender: TObject);
type
  str = array[1..7] of string;
var
  i, j, k : byte;
  s : str;
begin
  i := 1;
  with StringGrid1 do
    begin
      while i < StringGrid1.RowCount - 1 do
        begin
          if Cells[5, i] <> '' then
            begin
              if Cells[5, i] < Cells[5, i + 1] then
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
 end;


procedure TForm2.N3Click(Sender: TObject);
begin
 form3.Show
end;

procedure TForm2.OpenFileClick(Sender: TObject);
var
  i, j, k, l : byte;
  c : extended;
  st : TStringlist;
  a : TStringDynArray;
begin
  OpenDialog1.Execute;
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
    st.SaveToFile(SaveDialog1.FileName + '.txt');
    st.Free;
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
