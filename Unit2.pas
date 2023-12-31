unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, StdCtrls,
  ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox2: TComboBox;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DataSource1: TDataSource;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    frxDBDataset1: TfrxDBDataset;
    DBGrid1: TDBGrid;
    procedure bersih;
    procedure posisiawal;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  id: String;
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.bersih;
begin
edit2.clear;
edit1.clear;
edit3.clear;
edit4.Clear;
edit5.clear;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
bersih;
button1.Enabled:= False;
button2.Enabled:= True;
button3.Enabled:= False;
button4.Enabled:= False;
button5.Enabled:= True;
button6.Enabled:= False;
Edit1.Enabled:= True;
Edit2.Enabled:= True;
Edit3.Enabled:= True;
Edit4.Enabled:= True;
Edit5.Enabled:= True;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
if edit1.Text ='' then
begin
ShowMessage('NIS TIDAK BOLEH KOSONG!');
end else
if edit2.Text ='' then
begin
ShowMessage('NAMA TIDAK BOLEH KOSONG!');
end else
if combobox1.Text ='Pilih Jenis kelamin' then
begin
ShowMessage('PILIH JENIS KELAMIN!');
end else
if edit3.Text ='' then
begin
ShowMessage('PENDIDIKAN TIDAK BOLEH KOSONG!');
end else
if edit4.Text ='' then
begin
ShowMessage('MAPEL TIDAK BOLEH KOSONG!');
end else
if combobox2.Text ='Pilih Jenis kelamin' then
begin
ShowMessage('PILIH JENIS KELAMIN!');
end else
if edit5.Text ='' then
begin
ShowMessage('JABATAN TIDAK BOLEH KOSONG!');
end else
begin
zquery1.SQL.Clear;
zquery1.SQL.Add('insert into tabel_walikelas values(null,"'+edit1.Text+'","'+edit2.Text+'","'+combobox1.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+combobox2.Text+'","'+edit5.Text+'")');
zquery1.ExecSQL ;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tabel_walikelas');
zquery1.Open;
ShowMessage('Data Berhasil Disimpan');
posisiawal;
end;
end;

procedure TForm2.posisiawal;
begin
button1.Enabled:= True;
button2.Enabled:= False;
button3.Enabled:= False;
button4.Enabled:= False;
button5.Enabled:= False;
button6.Enabled:= True;
Edit1.Enabled:= False;
Edit2.Enabled:= False;
Edit3.Enabled:= False;
Edit4.Enabled:= False;
Edit5.Enabled:= False;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if (edit1.Text= '')or(edit2.Text= '')or(edit3.Text= '')or(edit4.Text= '')or(edit5.Text= '')then
begin
  ShowMessage('Inputan Wajib Di Isi');
end else
begin
zquery1.SQL.Clear;
zquery1.SQL.Add(' update tabel_walikelas set nik="'+edit1.Text+'",nama="'+edit2.Text+'",jenis_kelamin="'+combobox1.Text+'",pendidikan="'+edit3.Text+'",mapel="'+edit4.Text+'",tingkat_kelas="'+combobox2.Text+'",jabatan="'+edit5.Text+'" where id_walikelas ="'+id+'"');
zquery1.ExecSQL ;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tabel_walikelas');
zquery1.Open;
ShowMessage('Data Berhasil Disimpan');
posisiawal;
end;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
id:= zquery1.Fields[0].AsString;
edit1.Text:= zquery1.Fields[1].AsString;
edit2.Text:= zquery1.Fields[2].AsString;
combobox1.Text:= zquery1.Fields[3].AsString;
edit3.Text:= zquery1.Fields[4].AsString;
edit4.Text:= zquery1.Fields[5].AsString;
combobox2.Text:= zquery1.Fields[6].AsString;
edit5.Text:= zquery1.Fields[7].AsString;
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
combobox1.Enabled:= True;
combobox2.Enabled:= True;
button1.Enabled:= False;
button2.Enabled:= False;
button3.Enabled:= True;
button4.Enabled:= True;
button5.Enabled:= True;
button6.Enabled:= False;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zquery1.SQL.Clear;
zquery1.SQL.Add('delete from tabel_walikelas where id_walikelas ="'+id+'"');
zquery1. ExecSQL;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tabel_walikelas');
zquery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
Edit4.Clear;
Edit5.Clear;
posisiawal;
end;

end.
