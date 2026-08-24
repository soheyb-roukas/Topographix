unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,System.Math, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList,  Vcl.Buttons,
  Vcl.ExtCtrls, StrUtils,Vcl.ExtDlgs, Registry,Vcl.CheckLst,Vcl.Styles, Vcl.Themes, Shellapi,
  Vcl.WinXCtrls, System.Win.ComObj, Vcl.Clipbrd;

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
    Help1: TMenuItem;
    PointsListView: TListView;
    BitBtn1: TBitBtn;
    BitBtn0: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Deli_Edit: TEdit;
    Deli1: TRadioButton;
    Deli2: TRadioButton;
    Deli3: TRadioButton;
    Deli4: TRadioButton;
    GroupBox2: TGroupBox;
    CB1: TCheckBox;
    CB5: TCheckBox;
    CB2: TCheckBox;
    CB6: TCheckBox;
    CB3: TCheckBox;
    CB7: TCheckBox;
    CB8: TCheckBox;
    CB4: TCheckBox;
    SaveTextFileDialog1: TSaveTextFileDialog;
    SelectAxeFile1: TMenuItem;
    SelectTopoPointsFile1: TMenuItem;
    Github1: TMenuItem;
    Polylines: TTabSheet;
    PolylineListView: TListView;
    ImageList1: TImageList;
    BitBtn7: TBitBtn;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    BitBtn8: TBitBtn;
    DefaultCheckBox: TCheckBox;
    heme1: TMenuItem;
    Light1: TMenuItem;
    Dark1: TMenuItem;
    CheckBox2: TCheckBox;
    PolyPopup: TPopupMenu;
    CopyPolyline1: TMenuItem;
    CopyNonCorrectedPolyline1: TMenuItem;
    ColorComboBox: TComboBox;
    PointsPopup: TPopupMenu;
    Copy1: TMenuItem;
    Name1: TMenuItem;
    X1: TMenuItem;
    Y1: TMenuItem;
    Z1: TMenuItem;
    All1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    OpeninEditor1: TMenuItem;
    PColsedCheckBox: TCheckBox;
    DocsComboBox: TComboBox;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    RecalcPolylines1: TMenuItem;
    Timer1: TTimer;
    ResultPopup: TPopupMenu;
    Copy2: TMenuItem;
    Delete2: TMenuItem;
    StaName1: TMenuItem;
    Distance1: TMenuItem;
    PointName1: TMenuItem;
    PointX1: TMenuItem;
    PointY1: TMenuItem;
    PointZ1: TMenuItem;
    Alltherow1: TMenuItem;
    Email1: TMenuItem;
    About1: TMenuItem;
    opographix1: TMenuItem;
    Panel1: TPanel;
    AxeEdit: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    LoadNewAxeFile1: TMenuItem;
    AxePopup: TPopupMenu;
    Copy3: TMenuItem;
    Delete3: TMenuItem;
    N2: TMenuItem;
    ReopeninEditor1: TMenuItem;
    StationName1: TMenuItem;
    StaX1: TMenuItem;
    StaY1: TMenuItem;
    StaZ1: TMenuItem;
    XTranslation1: TMenuItem;
    YTranslation1: TMenuItem;
    XScale1: TMenuItem;
    YScale1: TMenuItem;
    Alltherow2: TMenuItem;
    LoadTopoPoints1: TMenuItem;
    N3: TMenuItem;
    LoadNewAxeFile2: TMenuItem;
    N4: TMenuItem;
    CheckBox3: TCheckBox;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Light1Click(Sender: TObject);
    procedure Dark1Click(Sender: TObject);
    procedure DefaultCheckBoxClick(Sender: TObject);
    procedure Deli_EditChange(Sender: TObject);
    procedure AxeListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure PointsListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure PolylineListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure BitBtn0Click(Sender: TObject);
    procedure ResultListviewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ResultListviewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CopyPolyline1Click(Sender: TObject);
    procedure CopyNonCorrectedPolyline1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure PointsListViewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Delete1Click(Sender: TObject);
    procedure Name1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure Y1Click(Sender: TObject);
    procedure Z1Click(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PolylineListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PointsListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OpeninEditor1Click(Sender: TObject);
    procedure RecalcPolylines1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ResultListviewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet1Show(Sender: TObject);
    procedure PolylineListViewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure SelectAxeFile1Click(Sender: TObject);
    procedure SelectTopoPointsFile1Click(Sender: TObject);
    procedure StaName1Click(Sender: TObject);
    procedure Distance1Click(Sender: TObject);
    procedure PointName1Click(Sender: TObject);
    procedure PointX1Click(Sender: TObject);
    procedure PointY1Click(Sender: TObject);
    procedure PointZ1Click(Sender: TObject);
    procedure Alltherow1Click(Sender: TObject);
    procedure opographix1Click(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ResultListviewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AxeListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadNewAxeFile1Click(Sender: TObject);
    procedure AxeListViewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure StationName1Click(Sender: TObject);
    procedure StaX1Click(Sender: TObject);
    procedure StaY1Click(Sender: TObject);
    procedure StaZ1Click(Sender: TObject);
    procedure XTranslation1Click(Sender: TObject);
    procedure YTranslation1Click(Sender: TObject);
    procedure XScale1Click(Sender: TObject);
    procedure YScale1Click(Sender: TObject);
    procedure Alltherow2Click(Sender: TObject);
    procedure Delete3Click(Sender: TObject);
    procedure LoadTopoPoints1Click(Sender: TObject);
    procedure LoadNewAxeFile2Click(Sender: TObject);
    procedure ReopeninEditor1Click(Sender: TObject);
    procedure Github1Click(Sender: TObject);
    procedure Email1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure SaveOptions;
var
Reg: TRegistry;
begin

  Reg := TRegistry.Create;

  try

  Reg.RootKey :=HKEY_CURRENT_USER;

  if Reg.OpenKey('Software\Topographix', True) then

    begin
    Reg.WriteBool('Sta Name',form1.cb1.Checked);
    Reg.WriteBool('Axe X',form1.cb2.Checked);
    Reg.WriteBool('Axe Y',form1.cb3.Checked);
    Reg.WriteBool('Distance',form1.cb4.Checked);
    Reg.WriteBool('Point Name',form1.cb5.Checked);
    Reg.WriteBool('Point X',form1.cb6.Checked);
    Reg.WriteBool('Point Y',form1.cb7.Checked);
    Reg.WriteBool('Point Z',form1.cb8.Checked);

    Reg.WriteBool('Tab delimiter',form1.Deli1.Checked);
    Reg.WriteBool('Space delimiter',form1.Deli2.Checked);
    Reg.WriteBool('Semicolon delimiter',form1.Deli3.Checked);
    Reg.WriteBool('Other delimiter',form1.Deli4.Checked);
    Reg.WriteString('Delimit char', form1.Deli_Edit.Text);

    Reg.WriteBool('Load axe',form1.CheckBox1.Checked);

    Reg.WriteString('default axe', form1.AxeEdit.Text);

    Reg.WriteBool('Export header',form1.CheckBox2.Checked);
    Reg.WriteBool('Light Skin',form1.Light1.Checked);

    Reg.CloseKey;

    end;

  finally

  Reg.Free;

  end;

end;

procedure LouadOptions;
var
Reg: TRegistry;
begin

  Reg := TRegistry.Create;

  try

    Reg.RootKey := HKEY_CURRENT_USER ;

    if Reg.OpenKey('Software\Topographix', False) then

    begin


        if not Reg.ReadBool('Light Skin') then  form1.Dark1.Click ;

        form1.cb1.Checked:= Reg.ReadBool('Sta Name') ;
        form1.cb2.Checked:= Reg.ReadBool('Axe X') ;
        form1.cb3.Checked:= Reg.ReadBool('Axe Y') ;
        form1.cb4.Checked:= Reg.ReadBool('Distance') ;
        form1.cb5.Checked:= Reg.ReadBool('Point Name') ;
        form1.cb6.Checked:= Reg.ReadBool('Point X') ;
        form1.cb7.Checked:= Reg.ReadBool('Point Y') ;
        form1.cb8.Checked:= Reg.ReadBool('Point Z') ;

        form1.Deli_Edit.Text:=Reg.ReadString('Delimit char');
        form1.Deli1.Checked:= Reg.ReadBool('Tab delimiter') ;
        form1.Deli2.Checked:= Reg.ReadBool('Space delimiter') ;
        form1.Deli3.Checked:= Reg.ReadBool('Semicolon delimiter') ;
        form1.Deli4.Checked:= Reg.ReadBool('Other delimiter') ;

        form1.AxeEdit.Text:= Reg.ReadString('default axe');
        if trim(form1.AxeEdit.Text)<>'' then
        form1.CheckBox1.Checked:= Reg.ReadBool('Load axe')  ;

        form1.CheckBox2.Checked:= Reg.ReadBool('Export header') ;

    Reg.CloseKey;
    end;


  except
  end;

end;

procedure actionsinfo(s:string);
begin
  form1.Timer1.Enabled:=false;
  form1.StatusBar1.Panels[1].Text:=s;
  form1.Timer1.Enabled:=true;
end;

Function getPoly(Correctfed: bool):string;
var
i,sub:integer;
s:string;
begin
if Correctfed then sub:=2 else sub:=1;

 if form1.PolylineListView.ItemIndex>=0 then
 begin
   for I := 0 to form1.PolylineListView.Items.Count-1 do
     begin

     if form1.PolylineListView.Items.Item[i].Selected then
       s:=s+'PLINE'+slinebreak+form1.PolylineListView.Items.Item[i].SubItems[sub]+#13#10+#13#10+slinebreak;
     end;
 end;
 getPoly:=s;
end;


// Interface the Windows Shlwapi function for natural sorting
function StrCmpLogicalW(psz1, psz2: PWideChar): Integer; stdcall;
  external 'shlwapi.dll' name 'StrCmpLogicalW';

procedure result2txt(opt: integer);
var
  txtspace: TStringList;
  i: integer;
  delimi, s: string;
  item: TListItem;

  // Helper to add parts safely
  procedure AddPart(const value: string);
  begin
    if s <> '' then s := s + delimi;
    s := s + value;
  end;

begin
  // Set delimiter
  if form1.deli1.Checked then delimi := #9
  else if form1.deli2.Checked then delimi := ' '
  else if form1.deli3.Checked then delimi := ';'
  else delimi := form1.deli_edit.Text;

  txtspace := TStringList.Create;
  try
    // 1. Header Logic
    if (form1.CheckBox2.Checked) and (opt<>3)then
    begin
      s := '';
      if form1.CB1.Checked then AddPart('StaName');  //  cap
      if form1.CB2.Checked then AddPart('AxeX');      //   5
      if form1.CB3.Checked then AddPart('AxeY');      //   6
      if form1.CB4.Checked then AddPart('Distance');  //   0
      if form1.CB5.Checked then AddPart('PointName'); //   1
      if form1.CB6.Checked then AddPart('PointX');    //   2
      if form1.CB7.Checked then AddPart('PointY');    //   3
      if form1.CB8.Checked then AddPart('PointZ');    //   4
      if s <> '' then txtspace.Add(s);
    end;

    // 2. Data Loop
    for i := 0 to form1.resultlistview.Items.Count - 1 do
    begin
      item := form1.resultlistview.Items[i];
      s := '';

      if form1.CB1.Checked then AddPart(item.Caption);
      if form1.CB2.Checked and (item.SubItems.Count > 5) then AddPart(item.SubItems[5]);
      if form1.CB3.Checked and (item.SubItems.Count > 6) then AddPart(item.SubItems[6]);
      if form1.CB4.Checked and (item.SubItems.Count > 0) then AddPart(item.SubItems[0]);
      if form1.CB5.Checked and (item.SubItems.Count > 1) then AddPart(item.SubItems[1]);
      if form1.CB6.Checked and (item.SubItems.Count > 2) then AddPart(item.SubItems[2]);
      if form1.CB7.Checked and (item.SubItems.Count > 3) then AddPart(item.SubItems[3]);
      if form1.CB8.Checked and (item.SubItems.Count > 4) then AddPart(item.SubItems[4]);

      if Trim(s) <> '' then txtspace.Add(s);
    end;

    // 3. Output Logic
    if (txtspace.Count > 0) then
    begin
      if opt = 1 then

        Clipboard.AsText := txtspace.Text else
       if form1.SaveTextFileDialog1.Execute then
        txtspace.SaveToFile(form1.SaveTextFileDialog1.FileName);

    end;

  finally
    txtspace.Free;
  end;

end;

procedure GetAutoCADDocuments;
var
  AcadApp, Docs: OleVariant;
  I, DocCount: Integer;
  DocName: string;
begin
  try
    // Connect to the active AutoCAD instance
    AcadApp := GetActiveOleObject('AutoCAD.Application');

    // Access the Documents collection
    Docs := AcadApp.Documents;
    DocCount := Docs.Count;
    form1.DocsComboBox.Clear;
    if DocCount = 0 then
    begin
      ShowMessage('No open documents found in AutoCAD.');
      Exit;
    end;

    // Loop through open documents (0-indexed collection)
    form1.DocsComboBox.Items.Add('[The Active Document]')  ;
    for I := 0 to DocCount - 1 do
    begin
      // Access document item by index
      DocName := Docs.Item(I).Name; // e.g. "Drawing1.dwg"
     // DocPath := Docs.Item(I).Path; // Full folder path if saved

      // Example processing: Add to a TListBox or Memo
     // form1.DocsComboBox.Items.Add(Format('Doc [%d]: %s (Path: %s)', [I, DocName, DocPath ]));
     form1.DocsComboBox.Items.Add(DocName)  ;
    end;

  except
    on E: Exception do
      ShowMessage('Could not retrieve document list: ' + E.Message);
  end;
end;

procedure GetAutoCADLayers();
var
  AcadApp, AcadDoc, LayersTable, LayerItem: OleVariant;
  I: Integer;
begin
  form1.ComboBox1.Items.Clear;

  try

    AcadApp := GetActiveOleObject('AutoCAD.Application');
    AcadDoc := AcadApp.ActiveDocument;


    LayersTable := AcadDoc.Layers;
    form1.ComboBox1.Items.Add('TPGX');
    for I := 0 to  LayersTable.Count-1 do
    begin
      LayerItem := LayersTable.Item(I);
      if (LayerItem.LayerOn = True) and (LayerItem.Freeze = False) then
      form1.ComboBox1.Items.Add(LayerItem.Name);
    end;
    form1.ComboBox1.ItemIndex:=0;
  except
  form1.ComboBox1.Items.Clear;
   // on E: Exception do
    //  raise Exception.Create('Could not retrieve layers. Make sure AutoCAD/Civil 3D is open. Details: ' + E.Message);
  end;
end;


procedure calcPoly();
var
i, PN :integer;
Profile, s1, s2, s3, s4, sub1, sub2:string;
TransX, TransY, scalX, ScalY :real;
begin

   Profile :='';
   try
     form1.PolylineListView.Items.BeginUpdate;
     form1.PolylineListView.Items.Clear;
     form1.PageControl1.Pages[3].Caption:='Plylines';

     for i := 0 to form1.ResultListview.Items.Count-1 do
     begin

         if Profile ='' then

             begin
             Profile:=form1.ResultListview.Items.Item[i].Caption;
             PN:=0;
             sub1:='';
             sub2:='';
             TransX:=strtofloat(form1.ResultListview.Items.Item[i].SubItems[8]);
             TransY:=strtofloat(form1.ResultListview.Items.Item[i].SubItems[9]);
             ScalX:=strtofloat(form1.ResultListview.Items.Item[i].SubItems[10]);
             ScalY:=strtofloat(form1.ResultListview.Items.Item[i].SubItems[11]);
         end;


     s1:= floattostr(strtofloat(form1.ResultListview.Items.Item[i].SubItems[0])*Scalx);        // x

     s2:= floattostr((strtofloat(form1.ResultListview.Items.Item[i].SubItems[4])         //y
          -strtofloat(form1.ResultListview.Items.Item[i].SubItems[7]))*ScalY) ;


     s3:= floattostr(strtofloat(s1) + TransX);        // x


     s4:= floattostr( (strtofloat(s2) + TransY )  ) ;      //y


     if FormatSettings.DecimalSeparator<>'.' then
       begin
       s1 := StringReplace(s1, FormatSettings.DecimalSeparator, '.', []);
       s2 := StringReplace(s2, FormatSettings.DecimalSeparator, '.', []);
       s3 := StringReplace(s3, FormatSettings.DecimalSeparator, '.', []);
       s4 := StringReplace(s4, FormatSettings.DecimalSeparator, '.', []);
       end;

       if  sub1<>'' then sub1:=sub1+#13;
       if  sub2<>'' then sub2:=sub2+#13;

     sub1:=sub1+ s1+','+s2;
     sub2:=sub2+ s3+','+s4;
     PN:=PN+1;



      if (i=form1.ResultListview.Items.Count-1) or
      (Profile<>form1.ResultListview.Items.Item[i+1].Caption )
     then
        with form1.PolylineListView.Items.add do
          begin
            caption:= Profile;
            subitems.Add(inttostr(PN));
            subitems.Add(sub1);
            subitems.Add(sub2);
            Profile:='';
          end;

     end;
   finally
   form1.PolylineListView.SelectAll;
   form1.PolylineListView.Items.EndUpdate;
   end;
end;

procedure Caption_Pro(i:integer);
var
pro,n :integer;
s:string;
begin
pro:= 20 * i div form1.PointsListView.Items.Count ;


for n := 0 to 19 do  if n<=pro then s:=s+'~' else s:=s+'   ';
   
  form1.Caption:='Topographix V3  '+'   ['+s+'] '+floattostr(pro*5)+' %';

end;

function distanceAP2 (Axe:integer;TPx,TPy:real):real;
var
Axe_x,Axe_y : real;
begin

Axe_x:=strtofloat(form1.AxeListView.Items.Item[Axe].SubItems[0]);
Axe_Y:=strtofloat(form1.AxeListView.Items.Item[Axe].SubItems[1]);


distanceAP2:= Sqr(TPx- Axe_x)+Sqr(TPy- Axe_Y);

end;

function is_it_after(Axe_m:integer;TPx,TPy:real):boolean;
begin
  is_it_after:= distanceAP2 (Axe_m,TPx,TPy) > distanceAP2 (Axe_m+1,TPx,TPy) ;
//
end;


procedure TForm1.All1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to PointsListView.Items.Count-1 do
  if PointsListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      PointsListView.Items[i].Caption +s+
      PointsListView.Items[i].SubItems[0] +s+
      PointsListView.Items[i].SubItems[1] +s+
      PointsListView.Items[i].SubItems[2];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.Alltherow1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].Caption +s+
      ResultListview.Items[i].SubItems[0] +s+
      ResultListview.Items[i].SubItems[1] +s+
      ResultListview.Items[i].SubItems[2] +s+
      ResultListview.Items[i].SubItems[3] +s+
      ResultListview.Items[i].SubItems[4];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.Alltherow2Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].Caption +s+
      AxeListView.Items[i].SubItems[0] +s+
      AxeListView.Items[i].SubItems[1] +s+
      AxeListView.Items[i].SubItems[2] +s+
      AxeListView.Items[i].SubItems[3] +s+
      AxeListView.Items[i].SubItems[4] +s+
      AxeListView.Items[i].SubItems[5] +s+
      AxeListView.Items[i].SubItems[6];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.AxeListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  PageControl1.ActivePageIndex:=2;
  PageControl1.Pages[2].Caption:='Axe ('+ AxeListView.Items.Count.ToString +')';
   Actionsinfo('Axe Loaded '+AxeListView.Hint );
end;

procedure TForm1.AxeListViewContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
  var
  i:integer;
begin
for i:=1 to AxePopup.Items.Count-1 do
AxePopup.Items[i].Enabled := (AxeListView.ItemIndex>=0);
end;

procedure TForm1.AxeListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
begin
  // Check if Ctrl + A is pressed
  if (ssCtrl in Shift) and (Key = Ord('A')) then
  begin
    AxeListView.Items.BeginUpdate;
    try
      for I := 0 to AxeListView.Items.Count - 1 do
        AxeListView.Items[I].Selected := True;
    finally
      AxeListView.Items.EndUpdate;
    end;

    // Suppress default Windows beep/action
    Key := 0;
  end
end;

procedure TForm1.BitBtn0Click(Sender: TObject);
var
i, Sta :integer;
Axe_A, Axe_B, Axe_M :integer;
TPx,TPy,TPz, VD :real;
AXEAx,AXEAy,AXEBx,AXEBy :real;
begin
if (AxeListView.Items.Count>0)and (PointsListView.Items.Count>0) then

   try
  ResultListview.Items.BeginUpdate;
  ResultListview.Items.Clear;

       for i := 0 to PointsListView.Items.Count-1 do
      begin
        if (i mod 50 = 0) then Application.ProcessMessages;
        Axe_A:=0; Axe_B:=  AxeListView.Items.Count-1;

        TPx:=Strtofloat(PointsListView.Items.Item[i].SubItems[0]);
        TPy:=Strtofloat(PointsListView.Items.Item[i].SubItems[1]);
        TPz:=Strtofloat(PointsListView.Items.Item[i].SubItems[2]);



       while Axe_B-Axe_A>1 do
       begin
       Axe_M :=Axe_A+ (Axe_B-Axe_A) div 2;

       if is_it_after(Axe_M,TPx,TPy) then  Axe_A:= Axe_M else  Axe_B:= Axe_M;

       end;

        if distanceAP2(Axe_A,TPx,TPy)< distanceAP2(Axe_B,TPx,TPy) then Sta:=Axe_A else Sta:=Axe_B;

        AXEAx:=strtofloat(AxeListView.Items.Item[Axe_A].SubItems[0]);
        AXEAy:=strtofloat(AxeListView.Items.Item[Axe_A].SubItems[1]);
        AXEBx:=strtofloat(AxeListView.Items.Item[Axe_B].SubItems[0]);
        AXEBy:=strtofloat(AxeListView.Items.Item[Axe_B].SubItems[1]);

       vd:= -1*((AXEBx-AXEAx)*(TPy-AXEAy)-(AXEBy-AXEAy)*(TPx-AXEAx))
       / sqrt(sqr(AXEAx-AXEBx)+sqr(AXEAy-AXEBy));

       with ResultListview.Items.Add do
       begin
         caption:= AxeListView.Items.Item[Sta].Caption;
         SubItems.Add( formatFloat('#00.000',vd));                // sub0
         SubItems.Add(PointsListView.Items.Item[i].Caption);       // sub 1
         SubItems.Add(floattostr(TPx));                           // sub 2
         SubItems.Add(floattostr(TPy));                           // sub 3
         SubItems.Add(floattostr(TPz));                           // sub 4
         //// add axe coord non visibale
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[0]); // Sta x   // sub 5
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[1]); // Sta y    // sub 6
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[2]); // Sta z    // sub 7
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[3]); //Sta translate x  // sub 8
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[4]);  // Sta translate x // sub 9
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[5]); //Sta Scal x  // sub 10
         SubItems.Add(AxeListView.Items.Item[Sta].SubItems[6]);  // Sta Scal y // sub 11
       end;

        Caption_Pro(i);
        end;
        ResultListview.CustomSort(nil, 0);
   finally

  ResultListview.Items.EndUpdate;
  calcPoly();
  caption:='Topographix V3';
  Actionsinfo('Matching: Done');
  end;

  end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
form1.FormStyle:= fsNormal;
form3.Memo1.Clear;
form3.ShowModal;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
try
result2txt(1);
finally
  actionsinfo('Copy result: Done');
end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin

try
 result2txt(2);
finally
  actionsinfo('Save result: Done');
end;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
     if BitBtn7.ImageIndex=0 then
  begin

   form1.FormStyle:= fsstayontop;
   form2.FormStyle:= fsstayontop;
   form3.FormStyle:= fsstayontop;
   BitBtn7.ImageIndex:=1;

  end else
  begin
   form1.FormStyle:= fsNormal;
   form2.FormStyle:= fsNormal;
   form3.FormStyle:= fsNormal;
   BitBtn7.ImageIndex:=0;
  end;
end;
procedure TForm1.BitBtn8Click(Sender: TObject);
var
  AcadApp, AcadDoc, ModelSpace, LayersTable: OleVariant;
  PointsArray: OleVariant;
  PolylineObj: OleVariant;
  I, N, ArrayIdx, Retries: Integer;
  Sub: TStringList;
  CoordParts: TArray<string>;
  X, Y: Double;
  TotalCoordsCount, SelCount, ColorN: Integer;
  LayerName: string;
  FS: TFormatSettings;
  Success: Boolean;
  UcsOrg: OleVariant;
  UcsX, UcsY: Double;
begin
  SelCount := 0;
  for I := 0 to PolylineListView.Items.Count - 1 do
    if PolylineListView.Items[I].Selected then
      Inc(SelCount);

  if SelCount < 1 then
  begin
    ShowMessage('Please select at least 1 item');
    Exit;
  end;

  FS := TFormatSettings.Invariant;

  try
    try
      AcadApp := GetActiveOleObject('AutoCAD.Application');
    except
      AcadApp := CreateOleObject('AutoCAD.Application');
    end;
     Actionsinfo('Start Drawing ..');
    AcadApp.Visible := True;
    if DocsComboBox.ItemIndex=0 then AcadDoc := AcadApp.ActiveDocument else
    AcadDoc :=AcadApp.Documents.Item( DocsComboBox.Items.Strings[DocsComboBox.ItemIndex]);

    ModelSpace := AcadDoc.ModelSpace;
    LayersTable := AcadDoc.Layers;

    // Turn off screen updates temporarily to prevent redraw lockups
    try
      AcadApp.ScreenUpdating := False;
    except
      // Ignore if version doesn't support ScreenUpdating
    end;

    UcsOrg := AcadDoc.GetVariable('UCSORG');
    UcsX := UcsOrg[0];
    UcsY := UcsOrg[1];

    for I := 0 to PolylineListView.Items.Count - 1 do
    begin
      if not PolylineListView.Items[I].Selected then
        Continue;

      Sub := TStringList.Create;
      try
      if CheckBox3.Checked then
        Sub.Text := PolylineListView.Items[I].SubItems[2] else
        Sub.Text := PolylineListView.Items[I].SubItems[1];

        if Sub.Count < 2 then
          Continue;

        TotalCoordsCount := Sub.Count * 2;
        PointsArray := VarArrayCreate([0, TotalCoordsCount - 1], varDouble);
        ArrayIdx := 0;

        for N := 0 to Sub.Count - 1 do
        begin
          CoordParts := Sub[N].Split([',']);
          X := 0.0;
          Y := 0.0;

          if Length(CoordParts) >= 1 then
            TryStrToFloat(Trim(CoordParts[0]), X, FS);
          if Length(CoordParts) >= 2 then
            TryStrToFloat(Trim(CoordParts[1]), Y, FS);

          PointsArray[ArrayIdx]     := X + UcsX;
          PointsArray[ArrayIdx + 1] := Y + UcsY;
          Inc(ArrayIdx, 2);
        end;

        // RETRY MECHANISM: Handles COM rejection safely
        Success := False;
        Retries := 0;

        while (not Success) and (Retries <= 50) do
        begin
          try
            PolylineObj := ModelSpace.AddLightWeightPolyline(PointsArray);

            if not DefaultCheckBox.Checked then
            begin
              LayerName := Trim(ComboBox1.Text);
              if LayerName = '' then LayerName := 'TPGX';

              try
                LayersTable.Add(LayerName);
              except
              end;

              PolylineObj.Layer := LayerName;

              if ColorComboBox.ItemIndex <= 0 then
                ColorN := 256
              else
                ColorN := ColorComboBox.ItemIndex;

              PolylineObj.Color := ColorN;

            end;

            PolylineObj.Closed := PColsedCheckBox.Checked;

            PolylineObj.Update;
            Success := True; // Drawing step successful
          except
            on E: Exception do
            begin
              Inc(Retries);

              // ESSENTIAL: Allow Windows/COM message queues to process
              Application.ProcessMessages;
              Sleep(100);

              if Retries >= 50 then
                raise Exception.Create('AutoCAD busy timeout: ' + E.Message);
            end;
          end;
        end;

      finally
        Sub.Free;
      end;
    end;

  finally
    // Restore AutoCAD screen updating and refresh view
    try
      AcadApp.ScreenUpdating := True;
      AcadDoc.Regen(1); // acAllViewports

    except
      // Ignore cleanup exceptions if AutoCAD closed
    end;
  end;
  Actionsinfo('Drawing: Done');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if form3.OpenTextFileDialog1.Execute  then
 AxeEdit.Text:=form3.OpenTextFileDialog1.FileName;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
PolylineListView.SelectAll;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i:integer;
begin




  for i:=0 to PolylineListView.Items.Count-1 do
PolylineListView.Items.Item[i].Selected:= not PolylineListView.Items.Item[i].Selected;
end;

procedure TForm1.DefaultCheckBoxClick(Sender: TObject);
begin
GroupBox3.Enabled:= not  DefaultCheckBox.Checked;
ComboBox1.Enabled := not  DefaultCheckBox.Checked;
ColorComboBox.Enabled := not  DefaultCheckBox.Checked ;
Label1.Enabled := not  DefaultCheckBox.Checked;
Label2.Enabled := not  DefaultCheckBox.Checked;
SpeedButton2.Enabled := not  DefaultCheckBox.Checked;
//PColsedCheckBox.Enabled := not  DefaultCheckBox.Checked;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if (trim(AxeEdit.Text)='')and(CheckBox1.Checked)  then Button1.Click;

end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
PolylineListView.MultiSelect:=CheckBox3.Checked;
end;

procedure TForm1.CopyNonCorrectedPolyline1Click(Sender: TObject);
begin
Clipboard.AsText :=getPoly(false);
Actionsinfo('Copy Non Corrected Polyline: Done');
end;

procedure TForm1.CopyPolyline1Click(Sender: TObject);

begin

    Clipboard.AsText :=getPoly(true);
      Actionsinfo('Copy Polyline: Done');
end;

procedure TForm1.Dark1Click(Sender: TObject);
begin

    Light1.Checked:= false;
    TStyleManager.SetStyle('Glow');
    ResultListview.GridLines:=false;
    AxeListView.GridLines:=false;
    PointsListView.GridLines:=false;
    PolylineListView.GridLines:=false;
end;

procedure TForm1.Delete1Click(Sender: TObject);
var
i :integer;
begin
PointsListView.Items.BeginUpdate;


   for I := PointsListView.Items.Count-1 downto 0 do
    begin
    if PointsListView.Items[i].Selected then PointsListView.Items[i].Delete;
    end;


IF PointsListView.Items.Count<1 THEN PageControl1.Pages[1].Caption:='Points'
ELSE PointsListView.ItemIndex:=0;

 PointsListView.Items.endupdate;
end;

procedure TForm1.Delete2Click(Sender: TObject);
var
i :integer;
begin
ResultListview.Items.BeginUpdate;


   for I := ResultListview.Items.Count-1 downto 0 do
    begin
    if ResultListview.Items[i].Selected then ResultListview.Items[i].Delete;
    end;


 ResultListview.Items.endupdate;
end;

procedure TForm1.Delete3Click(Sender: TObject);
var
i :integer;
begin
AxeListView.Items.BeginUpdate;


   for I := AxeListView.Items.Count-1 downto 0 do
    begin
    if AxeListView.Items[i].Selected then AxeListView.Items[i].Delete;
    end;


IF AxeListView.Items.Count<1 THEN PageControl1.Pages[2].Caption:='Axe'
ELSE AxeListView.ItemIndex:=0;

 AxeListView.Items.endupdate;
end;

procedure TForm1.Deli_EditChange(Sender: TObject);
begin
deli4.Checked:=true;

end;

procedure TForm1.Distance1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].SubItems[0];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.Email1Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('https://www.youtube.com/playlist?list=PLRTzQWLpQ5L0'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveOptions;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
caption:='Topographix V3';
LouadOptions;
end;

procedure TForm1.Github1Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('https://github.com/soheyb-roukas/Topographix'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Light1Click(Sender: TObject);
begin

    Dark1.Checked:= false;
    TStyleManager.SetStyle('Zircon SE');
    ResultListview.GridLines:=true;
    AxeListView.GridLines:=true;
    PointsListView.GridLines:=true;
    PolylineListView.GridLines:=true;

end;

procedure TForm1.LoadNewAxeFile1Click(Sender: TObject);
begin
   if fileexists(form1.AxeEdit.Text) then
 begin
 form3.memo1.Lines.LoadFromFile(form1.AxeEdit.Text);
 form3.Button2.Click ;
 PageControl1.ActivePageIndex:=2;
 end else showmessage('Can''t find the file: '+form1.AxeEdit.Text);

end;

procedure TForm1.LoadNewAxeFile2Click(Sender: TObject);
begin
SelectAxeFile1.Click;
end;

procedure TForm1.LoadTopoPoints1Click(Sender: TObject);
begin
SelectTopoPointsFile1.Click;
end;

procedure TForm1.Name1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to PointsListView.Items.Count-1 do
  if PointsListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      PointsListView.Items[i].Caption;
     end;
     Clipboard.AsText:=cliptext;

end;

procedure TForm1.OpeninEditor1Click(Sender: TObject);
var
i:integer;
s: string;
begin

form3.Memo1.Clear;
 for I := 0 to PointsListView.Items.Count-1 do
     begin
       with PointsListView.Items[i] do
       begin
       s:= caption+#9+SubItems[0]+#9+SubItems[1]+#9+SubItems[2];
       end;

       form3.Memo1.Lines.Add(s);
     end;

     form1.FormStyle:= fsNormal;
     form3.ShowModal;
end;

procedure TForm1.opographix1Click(Sender: TObject);
begin
form2.Show;
end;

procedure TForm1.PointName1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].SubItems[1];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.PointsListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  PageControl1.ActivePageIndex:=1;
 PageControl1.Pages[1].Caption:='Points ('+ PointsListView.Items.Count.ToString +')';
 Actionsinfo('Points Loaded');
end;

procedure TForm1.PointsListViewContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
  var
  i:integer;
begin
for i:=1 to PointsPopup.Items.Count-1 do
PointsPopup.Items[i].Enabled := (PointsListView.ItemIndex>=0);
end;

procedure TForm1.PointsListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
begin
  // Check if Ctrl + A is pressed
  if (ssCtrl in Shift) and (Key = Ord('A')) then
  begin
    PointsListView.Items.BeginUpdate;
    try
      for I := 0 to PointsListView.Items.Count - 1 do
        PointsListView.Items[I].Selected := True;
    finally
      PointsListView.Items.EndUpdate;
    end;

    // Suppress default Windows beep/action
    Key := 0;
  end;
end;

procedure TForm1.PointX1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].SubItems[2];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.PointY1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].SubItems[3];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.PointZ1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].SubItems[4];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.PolylineListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  PageControl1.Pages[3].Caption:='Plylines ('+ PolylineListView.Items.Count.ToString +')';
end;

procedure TForm1.PolylineListViewContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
  var
  i:integer;
begin
for i:=0 to PolyPopup.Items.Count-1 do
PolyPopup.Items[i].Enabled := (PolylineListView.ItemIndex>=0);
end;

procedure TForm1.PolylineListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
begin
  // Check if Ctrl + A is pressed
  if (ssCtrl in Shift) and (Key = Ord('A')) then
  begin
    PolylineListView.Items.BeginUpdate;
    try
      for I := 0 to PolylineListView.Items.Count - 1 do
        PolylineListView.Items[I].Selected := True;
    finally
      PolylineListView.Items.EndUpdate;
    end;

    // Suppress default Windows beep/action
    Key := 0;
  end;
end;

procedure TForm1.RecalcPolylines1Click(Sender: TObject);
begin
calcPoly();
end;

procedure TForm1.ReopeninEditor1Click(Sender: TObject);
var
i:integer;
s: string;
begin

form3.Memo1.Clear;
 for I := 0 to AxeListView.Items.Count-1 do
     begin
       with AxeListView.Items[i] do
       begin
       s:= caption+#9+SubItems[0]+#9+SubItems[1]+#9+SubItems[2]+#9+
       SubItems[3]+#9+SubItems[4]+#9+SubItems[5]+#9+SubItems[6];
       end;

       form3.Memo1.Lines.Add(s);
     end;

     form1.FormStyle:= fsNormal;
     form3.ShowModal;
end;

procedure TForm1.ResultListviewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  PageControl1.ActivePageIndex:=0;

//  PageControl1.Pages[0].Caption:='Result ('+ ResultListview.Items.Count.ToString +')';
end;

procedure TForm1.ResultListviewCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  Value1, Value2: Double;
begin
  // 1. Use StrCmpLogicalW for "Natural" alphabetical/numeric sorting on the Caption
  Compare := StrCmpLogicalW(PWideChar(Item1.Caption), PWideChar(Item2.Caption));

  // 2. If the Captions are identical, tie-break using the numeric subitem
  if Compare = 0 then
  begin
      Value1 := StrToFloatDef(Trim(Item1.SubItems[0]), 0.0);
      Value2 := StrToFloatDef(Trim(Item2.SubItems[0]), 0.0);

      Compare := CompareValue(Value2, Value1);
  end;
end;

procedure TForm1.ResultListviewContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
  var
  i:integer;
begin
for i:=0 to ResultPopup.Items.Count-1 do
ResultPopup.Items[i].Enabled := (ResultListview.ItemIndex>=0);
end;

procedure TForm1.ResultListviewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
begin
  // Check if Ctrl + A is pressed
  if (ssCtrl in Shift) and (Key = Ord('A')) then
  begin
    ResultListview.Items.BeginUpdate;
    try
      for I := 0 to ResultListview.Items.Count - 1 do
        ResultListview.Items[I].Selected := True;
    finally
      ResultListview.Items.EndUpdate;
    end;

    // Suppress default Windows beep/action
    Key := 0;
  end;
end;

procedure TForm1.SelectAxeFile1Click(Sender: TObject);
begin
form3.BitBtn1.Click;
if length(form3.Memo1.Text)>1 then form3.Button2.Click ;
end;

procedure TForm1.SelectTopoPointsFile1Click(Sender: TObject);
begin
form3.BitBtn1.Click;
if length(form3.Memo1.Text)>1 then form3.Button3.Click ;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
     GetAutoCADDocuments;
    DocsComboBox.ItemIndex:=0 ;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  AcadApp, AcadDoc, LayersTable, LayerItem: OleVariant;
  I: Integer;
begin
  form1.ComboBox1.Items.Clear;

  try

    AcadApp := GetActiveOleObject('AutoCAD.Application');

     if DocsComboBox.ItemIndex=0 then AcadDoc := AcadApp.ActiveDocument else
    AcadDoc :=AcadApp.Documents.Item( DocsComboBox.Items.Strings[DocsComboBox.ItemIndex]);

    LayersTable := AcadDoc.Layers;

    for I := 0 to  LayersTable.Count-1 do
    begin
      LayerItem := LayersTable.Item(I);
      if (LayerItem.LayerOn = True) and (LayerItem.Freeze = False) then
      ComboBox1.Items.Add(LayerItem.Name);
    end;
     if ComboBox1.Items.IndexOf('TPGX')<0 then ComboBox1.Items.Add('TPGX');

    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf('TPGX');
  except
  ComboBox1.Items.Clear;
   // on E: Exception do
    //  raise Exception.Create('Could not retrieve layers. Make sure AutoCAD/Civil 3D is open. Details: ' + E.Message);
  end;

end;

procedure TForm1.StaName1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to ResultListview.Items.Count-1 do
  if ResultListview.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      ResultListview.Items[i].Caption;
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.StationName1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].Caption;
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.StaX1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[0];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.StaY1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[1];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.StaZ1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[2];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin
if trim(AxeListView.Hint)<>''  then Actionsinfo(AxeListView.Hint );
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if Timer1.Tag=0 then Timer1.Tag:=1 else
begin
 Timer1.Tag:=0;
 StatusBar1.Panels[1].Text:='';
 Timer1.Enabled:=false;
end;

end;

procedure TForm1.X1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to PointsListView.Items.Count-1 do
  if PointsListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      PointsListView.Items[i].SubItems[0];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.XScale1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[5];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.XTranslation1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[3];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.Y1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to PointsListView.Items.Count-1 do
  if PointsListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      PointsListView.Items[i].SubItems[1];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.YScale1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[6];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.YTranslation1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to AxeListView.Items.Count-1 do
  if AxeListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      AxeListView.Items[i].SubItems[4];
     end;
     Clipboard.AsText:=cliptext;
end;

procedure TForm1.Z1Click(Sender: TObject);
var
  s,cliptext:string;
  i :integer;
begin

if deli1.Checked then s:=#9;
if deli2.Checked then s:=' ';
if deli3.Checked then s:=';';
if deli4.Checked then s:=deli_edit.Text;

cliptext:='';
for I := 0 to PointsListView.Items.Count-1 do
  if PointsListView.Items[i].Selected then
     begin
      if cliptext <>'' then cliptext:=cliptext+#13;
      cliptext:=cliptext+
      PointsListView.Items[i].SubItems[2];
     end;
     Clipboard.AsText:=cliptext;
end;

end.
