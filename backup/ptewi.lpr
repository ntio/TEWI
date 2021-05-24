program ptewi;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, printer4lazarus, utewi, usplash,SysUtils
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
 // Application.CreateForm(TForm1, Form1);
  Form2 := TForm2.Create(Nil);
  Form2.Show;
    Form2.Update;
    Application.ProcessMessages;
   sleep(6000);

   Application.CreateForm(TForm1, Form1);
    Application.Run;
end.

