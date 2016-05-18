program android_icon_gen;
{By Panagiotis Freris - Athens - Greece, 18-05-2016 Version 1}
{This program is freeware, for all -and made with CodeTyphon V 5.7}
{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pl_bgrauecontrols, pl_graphics32, pl_excontrols, main
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

