unit main;

{$mode objfpc}{$H+}

{By Panagiotis Freris - Athens - Greece, 18-05-2016 Version 1}
{This program is freeware, for all -and made with CodeTyphon V 5.7}
interface

uses
  Classes, Windows , ShellApi, SysUtils, FileUtil, TplLabelUnit, LSControls, Forms,
  Controls, Graphics,LazUTF8, Dialogs, StdCtrls, ExtCtrls, ExtDlgs,LResources;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ima: TImage;
    Label1: TLabel;
    mbut: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    sbut: TButton;
    op: TOpenPictureDialog;
    ula: TplURLLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
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

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
deletefile(GetCurrentDir+'\convert.exe');
deletefile(GetCurrentDir+'\magic.xml');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ResStream: TResourceStream;
begin
ResStream := TResourceStream.Create(HInstance, 'CONVERT', RT_RCDATA);
try
  ResStream.Position := 0;
  ResStream.SaveToFile('convert.exe');
finally
  ResStream.Free;
end;
ResStream := TResourceStream.Create(HInstance, 'MAGIC', RT_RCDATA);
try
  ResStream.Position := 0;
  ResStream.SaveToFile('magic.xml');
finally
  ResStream.Free;
end;
end;

procedure TForm1.mbutClick(Sender: TObject);
var di,base,comman : String;

begin
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
base:=di+'\convert "'+ pim +'"';
//convert  drawable-hdpi =  72x72
comman:= base+' -resize 72x72 '+di+'\res\drawable-hdpi\ic_launcher.png' ;
ShellExecute(0,nil, PChar('cmd'),PChar('/C ' + comman),nil,0);
//convert  drawable-ldpi =  36x36
comman:= base+' -resize 36x36 '+di+'\res\drawable-ldpi\ic_launcher.png' ;
ShellExecute(0,nil, PChar('cmd'),PChar('/C ' + comman),nil,0);
//convert  drawable-mdpi =  48x48
comman:= base+' -resize 48x48 '+di+'\res\drawable-mdpi\ic_launcher.png' ;
ShellExecute(0,nil, PChar('cmd'),PChar('/C ' + comman),nil,0);
//convert  drawable-xhdpi =  96x96
comman:= base+' -resize 96x96 '+di+'\res\drawable-xhdpi\ic_launcher.png' ;
ShellExecute(0,nil, PChar('cmd'),PChar('/C ' + comman),nil,0);
//convert  drawable-xxhdpi =  144x144
comman:= base+' -resize 144x144 '+di+'\res\drawable-xxhdpi\ic_launcher.png' ;
ShellExecute(0,nil, PChar('cmd'),PChar('/C ' + comman),nil,0);
//convert  drawable-xxxhdpi =  192x192
comman:= base+' -resize 192x192 '+di+'\res\drawable-xxxhdpi\ic_launcher.png' ;
ShellExecute(0,nil, PChar('cmd'),PChar('/C ' + comman),nil,0);
//finished
mbut.Enabled:=false;
sbut.Enabled:=true;
Showmessage('All done!');
SysUtils.ExecuteProcess(UTF8ToSys('explorer.exe'), di+'\res\', []);
end;

procedure TForm1.sbutClick(Sender: TObject);
begin
  if op.Execute then begin
    pim:= op.FileName;
    ima.Picture.LoadFromFile(op.FileName);
    mbut.Enabled:=true;
    sbut.Enabled:=false;
  end;
end;

end.

