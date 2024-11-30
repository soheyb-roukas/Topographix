unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtDlgs;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Button6: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
var
i : integer;
s:string;
begin


memo1.Lines.Clear;

   for i := 0 to form1.ListView1.Items.Count-1 do
   begin
     s:='';
    if CheckBox1.Checked then  s:=form1.ListView1.Items.Item[i].Caption;
    if CheckBox2.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[0];
    if CheckBox3.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[1];
    if CheckBox4.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[2];
    if CheckBox5.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[3];
    if CheckBox6.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[4];
    if CheckBox7.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[5];
    if CheckBox8.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[6];
     memo1.Lines.Add(s);
   end;

      SaveTextFileDialog1.FileName:=ChangeFileExt(extractfilename(form1.Edit2.Text),'')+' ['+Datetostr(Now)+'].txt';

     if SaveTextFileDialog1.Execute then
       begin
      memo1.Lines.SaveToFile(SaveTextFileDialog1.FileName);
      showmessage('File Saved');
      end;


 end;



procedure TForm2.Button2Click(Sender: TObject);
var
i : integer;
s:string;
begin
memo1.Lines.Clear;
   for i := 0 to form1.ListView1.Items.Count-1 do
   begin
   s:='';
    if CheckBox1.Checked then  s:=form1.ListView1.Items.Item[i].Caption;
    if CheckBox2.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[0];
    if CheckBox3.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[1];
    if CheckBox4.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[2];
    if CheckBox5.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[3];
    if CheckBox6.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[4];
    if CheckBox7.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[5];
    if CheckBox8.Checked then  s:=s+' '+form1.ListView1.Items.Item[i].SubItems[6];
     memo1.Lines.Add(s);
   end;


 try
 Memo1.SelectAll;
  Memo1.CopyToClipboard;
 finally
   showmessage('Data has been copied to clipboard');
 end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
CheckBox1.Checked:=true;
CheckBox2.Checked:=true;
CheckBox3.Checked:=true;
CheckBox4.Checked:=true;
CheckBox5.Checked:=true;
CheckBox6.Checked:=true;
CheckBox7.Checked:=true;
CheckBox8.Checked:=true;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
CheckBox1.Checked:=not CheckBox1.Checked ;
CheckBox2.Checked:=not CheckBox2.Checked ;
CheckBox3.Checked:=not CheckBox3.Checked ;
CheckBox4.Checked:=not CheckBox4.Checked ;
CheckBox5.Checked:=not CheckBox5.Checked ;
CheckBox6.Checked:=not CheckBox6.Checked ;
CheckBox7.Checked:=not CheckBox7.Checked ;
CheckBox8.Checked:=not CheckBox8.Checked ;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
CheckBox1.Checked:=FAlse;
CheckBox2.Checked:=FAlse;
CheckBox3.Checked:=FAlse;
CheckBox4.Checked:=FAlse;
CheckBox5.Checked:=FAlse;
CheckBox6.Checked:=FAlse;
CheckBox7.Checked:=FAlse;
CheckBox8.Checked:=FAlse;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.SaveLastSettings;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
form1.GetLastSettings;

end;

end.
