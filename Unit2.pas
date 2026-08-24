unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.ValEdit, Vcl.Buttons, vcl.Clipbrd, Vcl.Menus,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, Winapi.ShellAPI;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ImageList1: TImageList;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
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

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AnimateWindow(Self.Handle, 600, AW_HIDE or AW_BLEND);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
AnimateWindow(Self.Handle, 600, AW_ACTIVATE or AW_BLEND);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('mailto://soheyb.roukas@gmail.com'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('https://github.com/soheyb-roukas'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('https://www.youtube.com/playlist?list=PLRTzQWLpQ5L0'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('https://www.linkedin.com/in/soheyb-roukas/'), nil, nil, SW_SHOWNORMAL);
end;

end.
