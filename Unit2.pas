unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.ValEdit, Vcl.Buttons, vcl.Clipbrd, Vcl.Menus;

type
  TForm2 = class(TForm)
    ListView1: TListView;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    PopupMenu1: TPopupMenu;
    CopyName1: TMenuItem;
    CopyPolyline1: TMenuItem;
    Selectall1: TMenuItem;
    Button3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure CopyName1Click(Sender: TObject);
    procedure CopyPolyline1Click(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
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

procedure TForm2.BitBtn1Click(Sender: TObject);
var
i,PL:integer;
s:string;
begin
if checkbox1.Checked then  PL:=2 else PL:=1;

if listview1.ItemIndex>=0 then
 begin
   if listview1.SelCount=1 then  clipboard.AsText:= listview1.Items.Item[listview1.ItemIndex].SubItems[PL]
   else
   begin
   for i := 0 to listview1.Items.Count-1 do
     begin
        if listview1.Items.Item[i].Selected=true then s:=s+'PLINE'+slinebreak+ listview1.Items.Item[i].SubItems[PL]+#13#10+#13#10+slinebreak;
     end;
     clipboard.AsText:=s;
   end;

 end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
i:integer;
begin
i:= listview1.ItemIndex+1;

  if i<=listview1.Items.Count-1 then
    begin
    listview1.ClearSelection;
    listview1.ItemIndex:=i;
    listview1.Items.Item[i].Selected;
    end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
i:integer;
begin
i:= listview1.ItemIndex-1;
  if i>=0 then
    begin
    listview1.ClearSelection;
    listview1.ItemIndex:=i;
    listview1.Items.Item[i].Selected;
    end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if form2.Height>panel1.Height+180 then
begin
form2.Height:=175;
form2.Width:=275;
Button3.Caption:='v';
end else
begin
form2.Height:=500;
form2.Width:=520;
Button3.Caption:='^';
end;

end;

procedure TForm2.CopyName1Click(Sender: TObject);
var
i:integer;
s:string;
begin

if listview1.ItemIndex>=0 then
 begin
   if listview1.SelCount=1 then  clipboard.AsText:= listview1.Items.Item[listview1.ItemIndex].Caption
   else
   begin
   for i := 0 to listview1.Items.Count-1 do
     begin
        if listview1.Items.Item[i].Selected then s:=s+slinebreak+ listview1.Items.Item[i].Caption;
     end;
     clipboard.AsText:=trim(s);
   end;

 end;
end;

procedure TForm2.CopyPolyline1Click(Sender: TObject);
begin
BitBtn1.Click;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timer1.Enabled:=false;
Action:=caHide;
form1.FormStyle:=fsNormal;
form1.WindowState:=wsNormal;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
Timer1.Enabled:=true;
end;

procedure TForm2.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if listview1.ItemIndex>=0 then
  begin
   if listview1.SelCount>1 then
    begin
     StatusBar1.Panels.Items[0].Text:= inttostr(listview1.SelCount)+' are selected';
     caption:=inttostr(listview1.SelCount)+' Polylines are selected';
    end else
      begin
      StatusBar1.Panels.Items[0].Text:=listview1.Items.Item[listview1.ItemIndex].Caption;
      caption:='Polyline :'+ listview1.Items.Item[listview1.ItemIndex].Caption;
      end;
    end;
end;

procedure TForm2.Selectall1Click(Sender: TObject);
begin
listview1.SelectAll;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
if form2.Visible then

if getforegroundwindow<>Form2.Handle then
   begin
     form2.FormStyle:=fsStayOnTop;
    form2.BringToFront;
    end else  form2.FormStyle:=fsnormal;


end;

end.
