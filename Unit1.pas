unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtDlgs, Vcl.StdCtrls, System.StrUtils,
  Vcl.Menus, Registry,
  Vcl.Themes,
  Vcl.Styles, Vcl.ExtCtrls, Shellapi;

type
  coords=(x,y,z);
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Button3: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Button4: TButton;
    MainMenu1: TMainMenu;
    Files1: TMenuItem;
    Edit3: TMenuItem;
    About1: TMenuItem;
    heme1: TMenuItem;
    Light1: TMenuItem;
    Dark1: TMenuItem;
    SelectAxeFile1: TMenuItem;
    SelectTopgraphicFile1: TMenuItem;
    Export2: TMenuItem;
    Button5: TButton;
    App1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure Light1Click(Sender: TObject);
    procedure Dark1Click(Sender: TObject);
    procedure Export2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SelectAxeFile1Click(Sender: TObject);
    procedure SelectTopgraphicFile1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure App1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
  procedure GetLastSettings;
  procedure SaveLastSettings;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

function Getcoords(line:string;V:Coords):real;
var
r: real;
begin
r:=0;
 case V of
    x: R:=strtofloat(SplitString(Line,' ')[1]);
    y: R:=strtofloat(SplitString(Line,' ')[2]);
    z: R:=strtofloat(SplitString(Line,' ')[3]);
 end;

 result:=R;
end;

procedure TForm1.SaveLastSettings;
var
Reg: TRegistry;
 LastEportSettings:string;
begin
  LastEportSettings:='00000000';
  if form2.CheckBox1.Checked=true then LastEportSettings[1]:='1';
  if form2.CheckBox2.Checked=true then LastEportSettings[2]:='1';
  if form2.CheckBox3.Checked=true then LastEportSettings[3]:='1';
  if form2.CheckBox4.Checked=true then LastEportSettings[4]:='1';
  if form2.CheckBox5.Checked=true then LastEportSettings[5]:='1';
  if form2.CheckBox6.Checked=true then LastEportSettings[6]:='1';
  if form2.CheckBox7.Checked=true then LastEportSettings[7]:='1';
  if form2.CheckBox8.Checked=true then LastEportSettings[8]:='1';



  Reg := TRegistry.Create;

  try

  Reg.RootKey :=HKEY_CURRENT_USER;

  if Reg.OpenKey('Software\Topographix', True) then

    begin

    Reg.WriteString('LastAxePath', form1.Edit1.Text);
    Reg.WriteString('LastPoitsPath', form1.Edit2.Text);

    Reg.WriteString('LastEportSettings', LastEportSettings);

    if form1.Dark1.Checked=true then Reg.WriteString('Lasttheme', 'Dark')
     else  Reg.WriteString('Lasttheme', 'Light') ;

    Reg.CloseKey;

    end;

  finally

  Reg.Free;

  end;

end;


procedure TForm1.GetLastSettings;
var
Reg: TRegistry;
 LastEportSettings:string;
begin


  Reg := TRegistry.Create;

  try

    Reg.RootKey := HKEY_CURRENT_USER ;

    if Reg.OpenKey('Software\Topographix', False) then

    begin

    form1.Edit1.Text := Reg.ReadString('LastAxePath');
    form1.Edit2.Text := Reg.ReadString('LastPoitsPath');
    LastEportSettings := Reg.ReadString('LastEportSettings');




     if Reg.ReadString('Lasttheme') = 'Dark' then
      begin
       TStyleManager.TrySetStyle('Glow');
       form1.Dark1.Checked:=true;
       form1.Light1.Checked:=false;
      end;

    Reg.CloseKey;

    end;

  finally

  Reg.Free;
    if LastEportSettings[1]='1' then form2.CheckBox1.Checked:=true;
    if LastEportSettings[2]='1' then form2.CheckBox2.Checked:=true;
    if LastEportSettings[3]='1' then form2.CheckBox3.Checked:=true;
    if LastEportSettings[4]='1' then form2.CheckBox4.Checked:=true;
    if LastEportSettings[5]='1' then form2.CheckBox5.Checked:=true;
    if LastEportSettings[6]='1' then form2.CheckBox6.Checked:=true;
    if LastEportSettings[7]='1' then form2.CheckBox7.Checked:=true;
    if LastEportSettings[8]='1' then form2.CheckBox8.Checked:=true;


  end;

end;


function GetPointName(line:string):string;
begin
GetPointName:=SplitString(Line,' ')[0];
end;

Function GetDistance(IA,IP:Integer):Real;
var
Xa,XP, Ya,YP, d :Real;

begin
  Xa:= getcoords(form1.Memo1.Lines.Strings[IA],X);
  XP:= getcoords(form1.Memo2.Lines.Strings[Ip],X);
  Ya:= getcoords(form1.Memo1.Lines.Strings[IA],Y);
  YP:= getcoords(form1.Memo2.Lines.Strings[IP],Y);



d:=Sqrt( Sqr(Xp-Xa) + Sqr(Yp-Ya) );

Result:=d;

end;

Function NearPK(IP:integer):Integer;
var
i, CloseOne:integer;
D, CloseD: real;

begin

 CloseD:=-1;
 CloseOne:=0;

    for i  := 0 to form1.Memo1.Lines.Count-2 do
   begin

    D:= GetDistance(i,ip);

      if ( D < CloseD) or  (CloseD =-1)  then
      begin
       CloseD:= D ;
       CloseOne:=i;
      end else  break

   end;

 Result:=CloseOne;

end;

Function is_it_right (IA,IP:integer):boolean;
var
Xa,Xb,Xk, Ya,YB,YK, Product :Real;

begin
  Xa:= getcoords(form1.Memo1.Lines.Strings[IA],X);
  XB:= getcoords(form1.Memo1.Lines.Strings[IA+1],X);
  Ya:= getcoords(form1.Memo1.Lines.Strings[IA],Y);
  YB:= getcoords(form1.Memo1.Lines.Strings[IA+1],Y);
  XK:= getcoords(form1.Memo2.Lines.Strings[IP],X);
  YK:= getcoords(form1.Memo2.Lines.Strings[IP],Y);

Product:=(Xb-Xa)*(YK-Ya)-(YB-Ya)*(Xk-Xa);

is_it_right := Product<=0 ;
end;

procedure AddToList(IA,IP:integer;D:Real);
var
sA,sp:String;
Sd:string;
begin
SA:=form1.Memo1.Lines.Strings[IA];
SP:=form1.Memo2.Lines.Strings[IP];
with form1.ListView1.Items.Add do
 begin
   Caption:= GetPointName(form1.Memo1.Lines.Strings[IA]);
   SubItems.Add(floattostr(Getcoords(sa,x))) ;
   SubItems.Add(floattostr(Getcoords(sa,y))) ;
   SubItems.Add(GetPointName(sp)) ;
   SD:= formatFloat('#00.000',D);
   if sd[1] <>'-' then sd := ' '+sd;
   SubItems.Add(sd) ;
   SubItems.Add(floattostr(Getcoords(sp,x))) ;
   SubItems.Add(floattostr(Getcoords(sp,y))) ;
   SubItems.Add(floattostr(Getcoords(sp,z))) ;
   application.ProcessMessages;
 end;

end;

  procedure   sortbyD ;
var
 TempCaption,s1,s2: string;
 V1,V2 :real;
  TempSubItems: TStringList;
  i:integer;
  done:boolean;
begin
   done :=false;

   while ( not done ) and (form1.listview1.Items.Count>3) do

       begin
         done :=true;
        for i := 0 to form1.listview1.Items.Count-2 do
           begin
             s1:= form1.listview1.Items.Item[i].Caption;
             s2:= form1.listview1.Items.Item[i+1].Caption;
             v1:=  strtofloat(form1.listview1.Items.Item[i].SubItems.Strings[3]);
             v2:=  strtofloat(form1.listview1.Items.Item[i+1].SubItems.Strings[3]);

            if  ( s1=s2) and (  V1<V2 )  then

              try
              done:=false;
               TempSubItems := TStringList.Create;

               TempCaption := form1.listview1.Items.Item[i].Caption;
               TempSubItems.Assign(form1.listview1.Items.Item[i].SubItems);

               form1.listview1.Items.Item[i].Caption:=form1.listview1.Items.Item[i+1].Caption;
               form1.listview1.Items.Item[i].SubItems.Assign(form1.listview1.Items.Item[i+1].SubItems);

               form1.listview1.Items.Item[i+1].Caption:=TempCaption;
               form1.listview1.Items.Item[i+1].SubItems.Assign(TempSubItems)  ;
               finally
               TempSubItems.Free;

             end;

         end;
      end;
  end;


procedure TForm1.App1Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('https://github.com/soheyb-roukas'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
OpenTextFileDialog1.FileName:='';
if OpenTextFileDialog1.Execute then edit1.Text:= OpenTextFileDialog1.FileName;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
OpenTextFileDialog1.FileName:='';
if OpenTextFileDialog1.Execute then edit2.Text:= OpenTextFileDialog1.FileName;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
iP,NPK:integer;
d, outX, outY:real;
sMessage:string;
//s:string;
begin
if not fileexists(Edit1.Text) then sMessage:='Cant Find Axe File' ;
if not fileexists(Edit2.Text) then sMessage:= sMessage+#13+'Cant Find Topo Points File' ;

if fileexists(Edit1.Text) and fileexists(Edit2.Text) then

   begin

  SaveLastSettings;
    try
      memo1.Lines.LoadFromFile(edit1.Text);
      memo2.Lines.LoadFromFile(edit2.Text);
      listview1.Items.Clear;
      outX:=2*getcoords(memo1.Lines.Strings[memo1.Lines.Count-1],x)-getcoords(memo1.Lines.Strings[memo1.Lines.Count-2],x);
      outY:=2*getcoords(memo1.Lines.Strings[memo1.Lines.Count-1],y)-getcoords(memo1.Lines.Strings[memo1.Lines.Count-2],y);
      memo1.Lines.Add('Out_Off_Range '+floattostr(outX)+' '+Floattostr(outY));
      statusbar1.Panels.Items[1].Text:=inttostr(Memo1.Lines.Count-1);
      statusbar1.Panels.Items[3].Text:=inttostr(Memo2.Lines.Count);

    finally
    button3.Enabled:=false;
    button4.Enabled:=false;
    button5.Enabled:=false;
     ProgressBar1.Max:=memo2.Lines.Count-1;

      for ip :=0 to memo2.Lines.Count-1 do
        begin
         NPK:= NearPK(IP);

         d:=GetDistance(NPK,IP);

         if not is_it_right (NearPK(IP),IP)  then d:=d*-1;

         AddToList(NPK,IP,D);
        ProgressBar1.Position:=ip;
        end;

    end;
         sortbyD ;
         showmessage('Operation completed successfully '+inttostr(ListView1.Items.Count)+' Point get muched');

         
  end else showmessage(sMessage);

      IF LISTVIEW1.Items.Count>0 Then begin   button4.Enabled:=true;  button5.Enabled:=true; end;
      button3.Enabled:=true;

end;
procedure TForm1.Button4Click(Sender: TObject);
begin
form2.Button1.Click;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
form2.Button2.Click;
end;

procedure TForm1.Dark1Click(Sender: TObject);
begin
 TStyleManager.TrySetStyle('Glow');
 Dark1.Checked:=true;
 Light1.Checked:=false;
 SaveLastSettings;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
statusbar1.Panels.Items[1].Text:='';
button3.Enabled:=true;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
statusbar1.Panels.Items[3].Text:='';
button3.Enabled:=true;
end;

procedure TForm1.Export2Click(Sender: TObject);
begin
form2.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 // if ParamCount > 0 then
//     ShowMessage('Argument: ' + ParamStr(1));

statusbar1.Panels.Items[4].Text:='Made By Soheyb 2024';
end;

procedure TForm1.Light1Click(Sender: TObject);

begin
TStyleManager.TrySetStyle('copper');
Light1.Checked:=true;
 Dark1.Checked:=false;
 SaveLastSettings;
end;

procedure TForm1.ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);

begin
  Compare := AnsiCompareText(Item1.Caption, Item2.Caption);
  end;

procedure TForm1.Memo1Change(Sender: TObject);
var
i: integer;
begin
memo1.Text:=trim(Memo1.Text);
  i:=0;
  if i< memo1.Lines.Count then
  begin
    if length(Trim(memo1.Lines.Strings[i]))<1 then
    memo1.Lines.Delete(i);
     i:=i+1;
  end;


end;

procedure TForm1.Memo2Change(Sender: TObject);
var
i: integer;
begin
memo2.Text:=trim(Memo2.Text);
  i:=0;
  if i< memo2.Lines.Count then
  begin
    if length(Trim(memo2.Lines.Strings[i]))<1 then
    memo2.Lines.Delete(i);
     i:=i+1;
  end;
end;

procedure TForm1.SelectAxeFile1Click(Sender: TObject);
begin
button1.Click;
end;

procedure TForm1.SelectTopgraphicFile1Click(Sender: TObject);
begin
button2.Click;
end;

end.
