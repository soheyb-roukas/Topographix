unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList,  Vcl.Buttons,
  Vcl.ExtCtrls, StrUtils,Vcl.ExtDlgs, Registry,Vcl.CheckLst,Vcl.Styles, Vcl.Themes, Shellapi;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    AxeListView: TListView;
    TabSheet0: TTabSheet;
    TabSheet4: TTabSheet;
    ResultListview: TListView;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    View1: TMenuItem;
    Help1: TMenuItem;
    PointsListView: TListView;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn0: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    StatusBar1: TStatusBar;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox2: TGroupBox;
    CB1: TCheckBox;
    CB6: TCheckBox;
    CB2: TCheckBox;
    CB7: TCheckBox;
    CB3: TCheckBox;
    CB8: TCheckBox;
    CB9: TCheckBox;
    CB5: TCheckBox;
    SaveTextFileDialog1: TSaveTextFileDialog;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    GroupBox4: TGroupBox;
    NormalizeCheck1: TCheckBox;
    NormalizeCheck2: TCheckBox;
    NormalizeCheck3: TCheckBox;
    NormalizeCheck4: TCheckBox;
    NormalizeCheck5: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    SelectAxeFile1: TMenuItem;
    SelectTopoPointsFile1: TMenuItem;
    Polylinewindow1: TMenuItem;
    Github1: TMenuItem;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Timer1: TTimer;
    CheckBox5: TCheckBox;
    GroupBox5: TGroupBox;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn0Click(Sender: TObject);
    procedure ResultListviewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Polylinewindow1Click(Sender: TObject);
    procedure Github1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectAxeFile1Click(Sender: TObject);
    procedure SelectTopoPointsFile1Click(Sender: TObject);
    procedure BitBtn2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  LastAxePath:string;
implementation

{$R *.dfm}

uses Unit2;

procedure SaveOptions;
var
Reg: TRegistry;
 RegSettings, delimit, theme:string;
begin
  RegSettings:='000000000000000000000000';

  if form1.NormalizeCheck1.Checked=true then RegSettings[1]:='1';
  if form1.NormalizeCheck2.Checked=true then RegSettings[2]:='1';
  if form1.NormalizeCheck3.Checked=true then RegSettings[3]:='1';
  if form1.NormalizeCheck4.Checked=true then RegSettings[4]:='1';
  if form1.NormalizeCheck5.Checked=true then RegSettings[5]:='1';


  if form1.CB1.Checked=true then RegSettings[6]:='1';
  if form1.CB2.Checked=true then RegSettings[7]:='1';
  if form1.CB3.Checked=true then RegSettings[8]:='1';
  if form1.CB5.Checked=true then RegSettings[9]:='1';
  if form1.CB6.Checked=true then RegSettings[10]:='1';
  if form1.CB7.Checked=true then RegSettings[11]:='1';
  if form1.CB8.Checked=true then RegSettings[12]:='1';
  if form1.CB9.Checked=true then RegSettings[13]:='1';



  if form1.RadioButton1.Checked=true then RegSettings[14]:='1';
  if form1.RadioButton2.Checked=true then RegSettings[15]:='1';
  if form1.RadioButton3.Checked=true then RegSettings[16]:='1';
  if form1.RadioButton4.Checked=true then RegSettings[17]:='1';
  if form1.RadioButton5.Checked=true then RegSettings[18]:='1';


  if form1.CheckBox1.Checked=true then RegSettings[19]:='1';
  if form1.CheckBox2.Checked=true then RegSettings[20]:='1';
  if form1.CheckBox3.Checked=true then RegSettings[21]:='1';
  if form1.CheckBox4.Checked=true then RegSettings[22]:='1';
  if form1.CheckBox5.Checked=true then RegSettings[23]:='1';

  if form1.RadioButton7.Checked=true then RegSettings[24]:='1';

 // form1.Caption:= RegSettings;
  delimit:=form1.Edit1.Text;

  theme:=inttostr(form1.ComboBox1.ItemIndex);


  Reg := TRegistry.Create;

  try

  Reg.RootKey :=HKEY_CURRENT_USER;

  if Reg.OpenKey('Software\Topographix', True) then

    begin

    Reg.WriteString('SettingsV2', RegSettings);
    Reg.WriteString('LastAxePath', LastAxePath);
    Reg.WriteString('delimit', delimit);
    Reg.WriteString('theme', theme);

    Reg.CloseKey;

    end;

  finally

  Reg.Free;

  end;


end;





procedure filldata();
var
i:integer;
delimi, s:string;
begin
  with form1 do
  begin
    if radiobutton1.Checked then  delimi :=' ';
    if radiobutton2.Checked then  delimi :=';';
    if radiobutton3.Checked then  delimi :=',';
    if radiobutton4.Checked then  delimi :=#9;
    if radiobutton5.Checked then  delimi :=edit1.Text;
     memo1.Clear;

       for i :=0 to resultlistview.Items.Count-1 do
       begin
       s:='';
        if CB1.Checked then s:=s+delimi+resultlistview.Items.Item[i].Caption;
        if CB2.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[0];
        if CB3.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[1];
        if CB5.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[2];
        if CB6.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[3];
        if CB7.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[4];
        if CB8.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[5];
        if CB9.Checked then s:=s+delimi+resultlistview.Items.Item[i].SubItems.Strings[6];
        s:= StringReplace(s, delimi, '', []);

       memo1.Lines.Add(s);

       end;
       memo1.Text:=trim(memo1.Text);
    end;
end;

   procedure ListLoad(theList:Tlistview; clear:boolean);
   var
  Words: TArray<string>;
  i:integer;
  s:string;
   begin
         form1.ResultListview.Items.Clear;
         if clear  then  theList.Items.Clear;
     for i := 0 to form1.Memo1.Lines.Count-1 do
       begin
        s:= form1.Memo1.Lines.Strings[i];
        Words := SplitString(s, ' ');

         with theList.Items.Add do
         begin
           if Length(Words)>=0 then  caption := trim(Words[0]) else SubItems.Add('0');
           if Length(Words)>1 then  SubItems.Add(trim(Words[1])) else SubItems.Add('0');
           if Length(Words)>2 then  SubItems.Add(trim(Words[2])) else SubItems.Add('0');
           if Length(Words)>3 then  SubItems.Add(trim(Words[3])) else SubItems.Add('0');
           if Length(Words)>4 then  SubItems.Add(trim(Words[4])) else SubItems.Add('0');
           if Length(Words)>5 then  SubItems.Add(trim(Words[5])) else SubItems.Add('0');
           end;
         end;
   end;



procedure normalizeTXT;

begin
    with form1 do begin



       // delete first and last space
       if NormalizeCheck1.Checked then   Memo1.Text :=trim(Memo1.Text);

       // replace tab by space
          if NormalizeCheck1.Checked then
          while pos(#9,Memo1.Text)>=1  do
       Memo1.Text := StringReplace(Memo1.Text, #9, ' ', [rfReplaceAll]);

       // replace multi space by one space
          if NormalizeCheck1.Checked then
       while pos('  ',Memo1.Text)>=1  do
        Memo1.Text := StringReplace(Memo1.Text, '  ', ' ', [rfReplaceAll]);

          // delete empty lines
             if NormalizeCheck1.Checked then
        while pos (#13#10#13#10,Memo1.Text)>1 do
          Memo1.Text := StringReplace(Memo1.Text, #13#10#13#10, #13#10, [rfReplaceAll]);

             if NormalizeCheck1.Checked then
       // replace desimal char by system char
        if FormatSettings.DecimalSeparator='.' then
         Memo1.Text := StringReplace(Memo1.Text, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]) else
        if FormatSettings.DecimalSeparator=',' then
         Memo1.Text := StringReplace(Memo1.Text, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);

    end;
end;



  Function is_it_left (IA,IP:integer):boolean;
     var
  Xa1,Xa2,Xk, Ya1, Ya2,YK, Product :Real;
  begin

     if ia= form1.AxeListView.Items.Count-1 then ia:=ia-1;

     XK:=strtofloat(form1.PointsListView.Items.Item[Ip].SubItems[0]) ;
     YK:=strtofloat(form1.PointsListView.Items.Item[Ip].SubItems[1]) ;
     Xa1:=strtofloat(form1.AxeListView.Items.Item[Ia].SubItems[0]) ;
     Ya1:=strtofloat(form1.AxeListView.Items.Item[Ia].SubItems[1]) ;
     Xa2:=strtofloat(form1.AxeListView.Items.Item[Ia+1].SubItems[0]) ;
     Ya2:=strtofloat(form1.AxeListView.Items.Item[Ia+1].SubItems[1]) ;

    Product:=(Xa2-Xa1)*(YK-Ya1)-(Ya2-Ya1)*(Xk-Xa1);

    is_it_left := Product>0 ;
      end;

procedure louadAxe(path:string);
  begin
  with form1 do
  begin

    try
    memo1.Lines.LoadFromFile(path);
    finally
    normalizeTXT;
    ListLoad(axeListview,true);
    end;
    pagecontrol1.Pages[1].Caption:= 'Axe '+' ('+inttostr(axeListview.Items.Count)+')' ;
    StatusBar1.Panels.Items[1].Text:=extractfilename(path);
  end;

 end;
procedure LouadOptions;
var
Reg: TRegistry;
RegSettings:string;
begin

  RegSettings:=' 111111001011111111111100';
  Reg := TRegistry.Create;

  try

    Reg.RootKey := HKEY_CURRENT_USER ;

    if Reg.OpenKey('Software\Topographix', False) then

    begin
    RegSettings := Reg.ReadString('SettingsV2');
    form1.Edit1.Text := Reg.ReadString('delimit');
    form1.ComboBox1.ItemIndex := strtoint(Reg.ReadString('theme'));
    TStyleManager.SetStyle(form1.combobox1.Items.Strings[form1.combobox1.ItemIndex]);
    LastAxePath := Reg.ReadString('LastAxePath');
    Reg.CloseKey;
    end;


      form1.NormalizeCheck1.Checked:=RegSettings[1]='1';
      form1.NormalizeCheck2.Checked:=RegSettings[2]='1';
      form1.NormalizeCheck3.Checked:=RegSettings[3]='1';
      form1.NormalizeCheck4.Checked:=RegSettings[4]='1';
      form1.NormalizeCheck5.Checked:=RegSettings[5]='1';
      form1.CB1.Checked:=RegSettings[6]='1';
      form1.CB2.Checked:=RegSettings[7]='1';
      form1.CB3.Checked:=RegSettings[8]='1';
      form1.CB5.Checked:=RegSettings[9]='1';
      form1.CB6.Checked:=RegSettings[10]='1';
      form1.CB7.Checked:=RegSettings[11]='1';
      form1.CB8.Checked:=RegSettings[12]='1';
      form1.CB9.Checked:=RegSettings[13]='1';
      form1.RadioButton5.Checked:=RegSettings[18]='1';
      form1.RadioButton4.Checked:=RegSettings[17]='1';
      form1.RadioButton3.Checked:=RegSettings[16]='1';
      form1.RadioButton2.Checked:=RegSettings[15]='1';
      form1.RadioButton1.Checked:=RegSettings[14]='1';
      form1.CheckBox1.Checked:=RegSettings[19]='1';
      form1.CheckBox2.Checked:=RegSettings[20]='1';
      form1.CheckBox3.Checked:=RegSettings[21]='1';
      form1.CheckBox4.Checked:=RegSettings[22]='1';
      form1.CheckBox5.Checked:=RegSettings[23]='1';
      form1.RadioButton7.Checked:=RegSettings[24]='1';
      if  form1.CheckBox1.Checked then
      louadAxe(LastAxePath);

  except
  end;

end;

  procedure TForm1.BitBtn0Click(Sender: TObject);
var
A,P:integer;
  Xa,Ya,Xp, Yp , NearDist, dist :real;
  sd:string;
begin
   if BitBtn0.ImageIndex=1 then
   begin
     BitBtn0.ImageIndex:=0;
     BitBtn0.Caption:='Sort';
   end else
if (axelistview.Items.Count>1 ) and( pointslistview.Items.Count>1)  then
  begin
  ResultListview.Clear;
  pagecontrol1.ActivePageIndex:=0;
  BitBtn0.ImageIndex:=1;
  BitBtn0.Caption:='Stop';
 //  ResultListview.SortType:=stNone;

  ProgressBar1.Max:=pointslistview.Items.Count-1;
   for P := 0 to pointslistview.Items.Count-1 do
   begin
    if BitBtn0.ImageIndex=0 then break;
    ProgressBar1.Position:=p;
     application.ProcessMessages;

     for A := 0 to axelistview.Items.Count-1 do
       begin
       Xa:=strtofloat( form1.AxeListView.Items.Item[A].SubItems[0]);
       Ya:=strtofloat( form1.AxeListView.Items.Item[A].SubItems[1]);
       Xp:=strtofloat( form1.Pointslistview.Items.Item[P].SubItems[0]);
       Yp:=strtofloat( form1.Pointslistview.Items.Item[P].SubItems[1]);

       dist:=Sqrt( Sqr(Xp-Xa) + Sqr(Yp-Ya) );

         if (A=0) or(dist<=NearDist )then  NearDist:= dist
          else
          begin

             with resultListView.Items.Add  do
             begin

               if is_it_left(a,p) then NearDist :=NearDist*-1;
               caption:= axelistview.Items.Item[a-1].Caption;
               SubItems.Add(axelistview.Items.Item[a-1].SubItems[0]);
               SubItems.Add(axelistview.Items.Item[a-1].SubItems[1]);


                   SD:= formatFloat('#00.000',NearDist);
                   if sd[1] <>'-' then sd := ' '+sd;
                   SubItems.Add(sd);

               SubItems.Add( Pointslistview.Items.Item[p].Caption);
               SubItems.Add(Pointslistview.Items.Item[p].SubItems[0]);
               SubItems.Add(Pointslistview.Items.Item[p].SubItems[1]);
               SubItems.Add(Pointslistview.Items.Item[p].SubItems[2]);
               SubItems.Add(axelistview.Items.Item[a-1].SubItems[2]);
               SubItems.Add(axelistview.Items.Item[a-1].SubItems[3]);
                 break;
             end;
            end;
       end;
   end;

        ResultListview.CustomSort(nil, 0);
        BitBtn0.ImageIndex:=0;
        BitBtn0.Caption:='Sort';
        if CheckBox2.Checked then showmessage('Sorting is Done');
  end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
clear:boolean;
i:integer;
begin
if OpenTextFileDialog1.Execute  then
begin
   clear:=RadioButton6.Checked ;
  try
  memo1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);
  finally
   normalizeTXT;

   if (not clear) and (pointsListview.Items.Count>0) then
     begin
      i := MessageDlg('Choose "Yes" to add new points to existing points or "NO" to replace them ', mtConfirmation, [mbYes, mbNo], 0);

        case i of
          mrYes:
            clear:=false;
          mrNo:
             clear:=True;
        end;
     end;

   ListLoad(pointsListview,clear);
  end;

     PageControl1.ActivePageIndex:=2;
     StatusBar1.Panels.Items[3].Text:=extractfilename(OpenTextFileDialog1.FileName);
     pagecontrol1.Pages[2].Caption:= 'Points '+' ('+inttostr(pointsListview.Items.Count)+')';
end;
end;
procedure TForm1.BitBtn2Click(Sender: TObject);
var
i,n,m, NP:integer;
s1,s2:string;
exist:boolean;
begin
form2.ListView1.Clear;


for i := 0 to resultlistview.Items.Count-1 do
   begin
         exist:= false;
   for n := 0 to form2.ListView1.Items.Count-1 do
        begin

          if resultlistview.Items.Item[i].Caption = form2.ListView1.Items.Item[n].Caption then
           begin
            exist:=true;
            break
           end;
           
        end;
         if exist=false then
            begin
            s1:=''; s2:='';   NP:=0;
               for m := i to resultlistview.Items.Count-1 do
               begin
                 if resultlistview.Items.Item[m].Caption=resultlistview.Items.Item[i].Caption   then
                 begin
                 NP:=NP+1;
                 s1:=s1+#13+trim(resultlistview.Items.Item[m].SubItems[2])+','+resultlistview.Items.Item[m].SubItems[6];
                 s2:=s2+#13+floattostr(strtofloat(trim(resultlistview.Items.Item[m].SubItems[2]))+strtofloat(resultlistview.Items.Item[m].SubItems[7]))
                 +','+floattostr(strtofloat(trim(resultlistview.Items.Item[m].SubItems[6]))+strtofloat(resultlistview.Items.Item[m].SubItems[8]))
                 end else break

               end;
             with form2.ListView1.Items.Add do
             begin
               caption:= resultlistview.Items.Item[i].Caption;
               if NP=1 then
               SubItems.Add('1 point' ) else SubItems.Add(Np.ToString+' points' ) ;
               SubItems.Add(trim(s1));
               SubItems.Add(trim(s2));
             end;

            end;



   end;

form1.WindowState:=wsMinimized;
form2.show;
end;

procedure TForm1.BitBtn2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
form1.WindowState:=wsMinimized;
form2.show;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
if OpenTextFileDialog1.Execute  then
begin
 louadAxe(OpenTextFileDialog1.FileName);
 LastAxePath:=OpenTextFileDialog1.FileName;
 PageControl1.ActivePageIndex:=1;

end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  try
  filldata;
  finally
  Memo1.SelectAll;
  Memo1.CopyToClipboard;
  if CheckBox3.Checked then showmessage('Data has been copied to clipboard');
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  try
  filldata;
  finally
  if  SaveTextFileDialog1.Execute then
  begin
  memo1.Lines.SaveToFile(SaveTextFileDialog1.FileName);
    if CheckBox4.Checked then
  showmessage('Data has been saved to '+#13+ SaveTextFileDialog1.FileName);
  end;
 end;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
ResultListview.GridLines:=CheckBox5.Checked;
AxeListView.GridLines:=CheckBox5.Checked;
PointsListView.GridLines:=CheckBox5.Checked;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

   TStyleManager.SetStyle(combobox1.Items.Strings[combobox1.ItemIndex]);

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveOptions;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
LouadOptions;
statusbar1.Panels.Items[4].Text:='V2.1 by Soheyb 2025';

end;

procedure TForm1.Github1Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('https://github.com/soheyb-roukas'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Polylinewindow1Click(Sender: TObject);
begin
form1.WindowState:=wsMinimized;
form2.show;
end;

procedure TForm1.ResultListviewCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
  var
  Value1, Value2: Real;
begin
  Compare := AnsiCompareText(Item1.Caption, Item2.Caption);
  if Compare = 0 then
  begin
    Value1 := StrToFloatDef(trim(Item1.SubItems[2]), 0.000);
    Value2 := StrToFloatDef(trim(Item2.SubItems[2]), 0.000);
    Compare :=strtoint( IfThen(Value2 > Value1, '1', '0'));
  end;

end;

procedure TForm1.SelectAxeFile1Click(Sender: TObject);
begin
BitBtn3.Click;
end;

procedure TForm1.SelectTopoPointsFile1Click(Sender: TObject);
begin
BitBtn1.Click;
end;

procedure TForm1.TabSheet4Exit(Sender: TObject);
begin
SaveOptions;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
ComboBox1.ItemIndex:=ComboBox1.ItemIndex+1;
 TStyleManager.SetStyle(combobox1.Items.Strings[combobox1.ItemIndex]);
end;

end.
