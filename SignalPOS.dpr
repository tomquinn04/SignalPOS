program SignalPOS;

uses
  System.StartUpCopy,
  FMX.Forms,
  splash in 'forms\splash.pas' {Form1},
  datamodule in 'data\datamodule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
