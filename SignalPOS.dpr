program SignalPOS;

uses
  System.StartUpCopy,
  FMX.Forms,
  splash in 'splash.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
