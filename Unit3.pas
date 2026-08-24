unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ExtDlgs,  System.StrUtils ;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    OpenTextFileDialog1: TOpenTextFileDialog;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    CheckBox3: TCheckBox;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    SaveTextFileDialog1: TSaveTextFileDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1;
  procedure rset_form();
  begin
    //
    form3.CheckBox3.Checked:=false;
    form3.Panel4.Visible:=false;
    form3.Edit1.Clear;
    form3.Edit2.Clear;
    form3.memo1.Clear;
    form3.memo1.Font.Size:= 9;
  end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
//i:integer;
s :string;
begin
      memo1.Lines.BeginUpdate;
  {
    for i:= memo1.Lines.Count-1 downto 0 do
     if trim(memo1.Lines.Strings[i])=''
     then memo1.Lines.Delete(i);
       }




     s:=memo1.Lines.Text;

     ///// replace decimal char
     if FormatSettings.DecimalSeparator<>'.' then
    s:= StringReplace(s,'.',FormatSettings.DecimalSeparator, [rfReplaceAll]);

    if FormatSettings.DecimalSeparator<>',' then
    s:=StringReplace(s,',',FormatSettings.DecimalSeparator, [rfReplaceAll]);

  //  if FormatSettings.DecimalSeparator<>#39 then
  //  s:=StringReplace(s,#39,FormatSettings.DecimalSeparator, [rfReplaceAll]);


    /////   replace separator char
    {
    s:=StringReplace(s,' ',#9, [rfReplaceAll]);
    s:=StringReplace(s,';',#9, [rfReplaceAll]);
     }

    memo1.Lines.Text:=s;
    memo1.Lines.EndUpdate;

end;


procedure TForm3.BitBtn3Click(Sender: TObject);
var
i:integer;
s:string;
begin
memo1.Lines.BeginUpdate;
if form1.deli1.Checked then s:=#9;
if form1.deli2.Checked then s:=' ';
if form1.deli3.Checked then s:=';';
if form1.deli4.Checked then s:=form1.deli_edit.Text;

      for I := 0 to memo1.Lines.Count-1 do
      if trim(memo1.Lines.Strings[i])<>'' then
        memo1.Lines.Strings[i]:= 'P_'+inttostr(i+1)+s+memo1.Lines.Strings[i];
memo1.Lines.endUpdate;
  end;


procedure TForm3.BitBtn1Click(Sender: TObject);
begin
if OpenTextFileDialog1.Execute  then

  memo1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);

end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
if memo1.Font.Size >3 then

memo1.Font.Size:= memo1.Font.Size - 3;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
if memo1.Font.Size <60 then
memo1.Font.Size:= memo1.Font.Size + 3;
end;

procedure TForm3.BitBtn6Click(Sender: TObject);
begin
 Panel4.Visible:=not Panel4.Visible;
end;

procedure TForm3.BitBtn7Click(Sender: TObject);
begin
 if SaveTextFileDialog1.Execute then
    memo1.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  Words, data_raw: TArray<string>;
  i, n:integer;
begin
try
// BitBtn2.Click;
 form1.ResultListview.Items.Clear;
 form1.PolylineListView.Items.Clear;
 form1.AxeListView.Items.BeginUpdate;

 if not CheckBox3.Checked then form1.AxeListView.Items.Clear;


  for i := 0 to Memo1.Lines.Count-1 do
      begin
         if trim(Memo1.Lines.Strings[i])='' then continue;
           Words := Memo1.Lines.Strings[i].Split([#9,' ']);

        with form1.AxeListView.Items.Add do
         begin

            caption:= Words[0];

                    //[ x ,y  ,Z  ,xt ,yt ,scx,scy]
          data_raw := ['0','0','0','0','0','1','1'];

          for n := 0 to 6 do
          begin
            if Length(Words) > n + 1 then
              data_raw[n] := Trim(Words[n + 1]);

            if data_raw[n] = '' then
              data_raw[n] := '0';
          end;


             SubItems.Add(data_raw[0]); //x
             SubItems.Add(data_raw[1]); //y
             SubItems.Add(data_raw[2]); //z
             SubItems.Add(data_raw[3]); //Tx
             SubItems.Add(data_raw[4]); //Tx
             SubItems.Add(data_raw[5]); //scx
             SubItems.Add(data_raw[6]); //scy
         end;

      end;

 finally
form1.AxeListView.Items.EndUpdate;
//rset_form();
 end;

 form3.Close;
end;

procedure TForm3.Button3Click(Sender: TObject);
 var
  Words, data_raw: TArray<string>;
  i, n:integer;
begin

try


// BitBtn2.Click;
 form1.ResultListview.Items.Clear;
 form1.PolylineListView.Items.Clear;
  form1.PointsListView.Items.BeginUpdate;

 if not CheckBox3.Checked then form1.PointsListView.Items.Clear;



  for i := 0 to Memo1.Lines.Count-1 do
      begin
            if trim(Memo1.Lines.Strings[i])='' then continue;


                Words := Memo1.Lines.Strings[i].Split([#9,' ']);


        with form1.PointsListView.Items.Add do
         begin

           caption:= Words[0];


                     // x   y   z
           data_raw :=['0','0','0'];

          //  if Length(Words)>0 then data_raw[0] := Words[1];
          //  if Length(Words)>1 then data_raw[1] := Words[2];
          //  if Length(Words)>2 then data_raw[2] := Words[3];

           for n := 0 to 2 do
          begin
            if Length(Words) > n + 1 then
              data_raw[n] := Trim(Words[n + 1]);

            if data_raw[n] = '' then
              data_raw[n] := '0';
          end;

          for n := 0 to 2 do
          begin
            if trim(data_raw[n])='' then data_raw[n]:='0';
            SubItems.Add(data_raw[n]);
          end;

         end;


      end;
  finally
form1.PointsListView.Items.EndUpdate;
//rset_form();

end;
form3.Close;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
if edit1.Text<>'' then  memo1.Text := stringreplace(memo1.Text,edit1.Text,edit2.Text,[rfReplaceAll, rfIgnoreCase]);

end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if form1.BitBtn7.ImageIndex=1 then  form1.FormStyle:= fsstayontop;
 rset_form();
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

 if (form1.CheckBox1.Checked)and(fileexists(form1.AxeEdit.Text)) then
 begin
 memo1.Lines.LoadFromFile(form1.AxeEdit.Text);
 Button2.Click ;
 form1.PageControl1.ActivePageIndex:=0;
 end;

end;

end.
