unit main;

{$mode objfpc}{$H+}
{By Panagiotis Freris - Athens - Greece, 24-05-2016 Version 1.1}
{This program is freeware, for all -and made with CodeTyphon V 5.7}
{Thanks to lainz for his suggestion to using the BGRABitmap component}

interface

uses
  Classes, SysUtils, FileUtil, LSControls, Forms,
  Controls, Graphics, LazUTF8, StdCtrls, ExtCtrls, ExtDlgs,
  BGRABitmap, BGRABitmapTypes,Dialogs, XMLPropStorage;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ima: TImage;
    mbut: TButton;
    opf: TCheckBox;
    Panel2: TPanel;
    sbut: TButton;
    op: TOpenPictureDialog;
    f_stor: TXMLPropStorage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mbutClick(Sender: TObject);
    procedure sbutClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  pim : String;
  Bitmap,logo: TBGRABitmap;
  bim : TBGRACustomBitmap;
  pfile : TPortableNetworkGraphic;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
ima.Picture.LoadFromFile(Getcurrentdir+'\logo.png');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  bim.Free;
end;

procedure TForm1.mbutClick(Sender: TObject);
var di : String;

begin
Bitmap := TBGRABitmap.Create;
pfile := TPortableNetworkGraphic.Create;
Bitmap.Assign(ima.Picture.Bitmap);
//*******************************
di:=GetCurrentDir;
//---------------
createdir(di+'\res'); // base res dir
//---------------
createdir(di+'\res\drawable-hdpi');
createdir(di+'\res\drawable-ldpi');
createdir(di+'\res\drawable-mdpi');
createdir(di+'\res\drawable-xhdpi');
createdir(di+'\res\drawable-xxhdpi');
createdir(di+'\res\drawable-xxxhdpi');

//convert  drawable-hdpi =  72x72
bim:= Bitmap.Resample(72,72);
pfile.Assign(bim);
pfile.SaveToFile(di+'\res\drawable-hdpi\ic_launcher.png');
//convert  drawable-ldpi =  36x36
bim:= Bitmap.Resample(36,36);
pfile.Assign(bim);
pfile.SaveToFile(di+'\res\drawable-ldpi\ic_launcher.png');
//convert  drawable-mdpi =  48x48
bim:= Bitmap.Resample(48,48);
pfile.Assign(bim);
pfile.SaveToFile(di+'\res\drawable-mdpi\ic_launcher.png');
//convert  drawable-xhdpi =  96x96
bim:= Bitmap.Resample(96,96);
pfile.Assign(bim);
pfile.SaveToFile(di+'\res\drawable-xhdpi\ic_launcher.png');
//convert  drawable-xxhdpi =  144x144
bim:= Bitmap.Resample(144,144);
pfile.Assign(bim);
pfile.SaveToFile(di+'\res\drawable-xxhdpi\ic_launcher.png');
//convert  drawable-xxxhdpi =  192x192
bim:= Bitmap.Resample(192,192);
pfile.Assign(bim);
pfile.SaveToFile(di+'\res\drawable-xxxhdpi\ic_launcher.png');
//finished
mbut.Enabled:=false;
sbut.Enabled:=true;
Showmessage('All done!');
if opf.Checked then SysUtils.ExecuteProcess(UTF8ToSys('explorer.exe'), di+'\res\', []);
//****************
pfile.Free;
Bitmap.Free;
end;

procedure TForm1.sbutClick(Sender: TObject);
begin
  if op.Execute then begin
//************
pim:= op.FileName;
ima.Picture.LoadFromFile(pim);
mbut.Enabled:=true;
sbut.Enabled:=false;
end;
end;

end.

