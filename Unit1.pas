unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls,
  ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
id:string;
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bersih;
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;
edit7.Clear;
edit8.Clear;
edit9.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.posisiawal;
begin
Button1.Enabled:= True;
Button2.Enabled:= False;
Button3.Enabled:= False;
Button4.Enabled:= False;
Button5.Enabled:= False;
Button6.Enabled:= True;
Edit1.Enabled:= False;
Edit2.Enabled:= False;
Edit3.Enabled:= False;
Edit4.Enabled:= False;
Edit5.Enabled:= False;
Edit6.Enabled:= False;
Edit7.Enabled:= False;
Edit8.Enabled:= False;
Edit9.Enabled:= False;
end;


procedure TForm1.button2Click(Sender: TObject);
begin
if edit1.Text ='' then
begin
ShowMessage('NIS TIDAK BOLEH KOSONG!');
end else
if edit2.Text ='' then
begin
ShowMessage('NISN TIDAK BOLEH KOSONG!');
end else
if edit3.Text ='' then
begin
ShowMessage('NIK TIDAK BOLEH KOSONG!');
end else
if edit4.Text ='' then
begin
ShowMessage('NAMA TIDAK BOLEH KOSONG!');
end else
if edit5.Text ='' then
begin
ShowMessage('TEMPAT LAHIR TIDAK BOLEH KOSONG!');
end else
if combobox1.Text ='Pilih jenis kelamin' then
begin
ShowMessage('TOLONG ISI JENIS KELAMIN');
end else
if combobox2.Text ='Pilih tingkat kelas' then
begin
ShowMessage('TOLONG ISI TINGKAT KELAS');
end else
if combobox3.Text ='Pilih jurusan' then
begin
ShowMessage('TOLONG ISI JURUSAN');
end else
if edit6.Text ='' then
begin
ShowMessage('ID WALI KELAS TIDAK BOLEH KOSONG!');
end else
if edit7.Text ='' then
begin
ShowMessage('ALAMAT TIDAK BOLEH KOSONG!');
end else
if edit8.Text ='' then
begin
ShowMessage('NO TELPON TIDAK BOLEH KOSONG!');
end else
if edit9.Text ='' then
begin
ShowMessage('STATUS TIDAK BOLEH KOSONG!');
end else
begin
zquery1.SQL.Clear;
zquery1.SQL.Add('insert into tabel_siswa values(null,"'+edit1.Text+'","'+edit2.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+edit5.Text+'","'+formatdatetime('yyyy-mm-dd',datetimepicker1.Date)+'","'+combobox1.Text+'","'+combobox2.Text+'","'+combobox3.Text+'","'+edit6.Text+'","'+edit7.Text+'","'+edit8.Text+'","'+edit9.Text+'")');
zquery1.ExecSQL ;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tabel_siswa');
zquery1.Open;
ShowMessage('Data Berhasil Disimpan');
posisiawal;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
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
Edit6.Enabled:= True;
Edit7.Enabled:= True;
Edit8.Enabled:= True;
Edit9.Enabled:= True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if (edit1.Text= '')or(edit2.Text= '')or(edit3.Text= '')or(edit4.Text= '')or(edit5.Text= '')or(edit6.Text= '')or(edit7.Text= '')or(edit8.Text= '')or(edit9.Text= '')then
begin
  ShowMessage('Inputan Wajib Di Isi');
end else
begin
zquery1.SQL.Clear;
zquery1.SQL.Add('update tabel_siswa set nis="'+edit1.Text+'",nisn="'+edit2.Text+'",nik="'+edit3.Text+'",nama="'+edit4.Text+'",tempat_lahir="'+edit5.Text+'",tanggal_lahir="'+formatdatetime('yyyy-mm-dd',datetimepicker1.Date)+'",jenis_kelamin="'+combobox1.Text+'",tingkat_kelas="'+combobox2.Text+'",jurusan="'+combobox3.Text+'",id_walikelas="'+edit6.Text+'",alamat="'+edit7.Text+'",no_telp="'+edit8.Text+'",status="'+edit9.Text+'" where id_siswa ="'+id+'"');
zquery1.ExecSQL ;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tabel_siswa');
zquery1.Open;
ShowMessage('Data Berhasil Disimpan');
posisiawal;
end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
begin
id:= zquery1.Fields[0].AsString;
edit1.Text:= zquery1.Fields[1].AsString;
edit2.Text:= zquery1.Fields[2].AsString;
edit3.Text:= zquery1.Fields[3].AsString;
edit4.Text:= zquery1.Fields[4].AsString;
edit5.Text:= zquery1.Fields[5].AsString;
datetimepicker1.Date := zquery1.Fields[6].AsDateTime;
combobox1.Text:= zquery1.Fields[7].AsString;
combobox2.Text:= zquery1.Fields[8].AsString;
combobox3.Text:= zquery1.Fields[9].AsString;
edit6.Text:= zquery1.Fields[10].AsString;
edit7.Text:= zquery1.Fields[11].AsString;
edit8.Text:= zquery1.Fields[12].AsString;
edit9.Text:= zquery1.Fields[13].AsString;
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
combobox1.Enabled:= True;
combobox2.Enabled:= True;
combobox3.Enabled:= True;
edit6.Enabled:= True;
edit7.Enabled:= True;
edit8.Enabled:= True;
edit9.Enabled:= True;
button1.Enabled:= False;
button2.Enabled:= False;
button3.Enabled:= True;
button4.Enabled:= True;
button5.Enabled:= True;
button6.Enabled:= False;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zquery1.SQL.Clear;
zquery1.SQL.Add(' delete from tabel_siswa where id_siswa ="'+id+'"');
zquery1. ExecSQL;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tabel_siswa');
zquery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

end.
