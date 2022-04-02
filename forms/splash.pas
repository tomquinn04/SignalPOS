unit splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  login, numberpad;

type
  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Windows.fmx MSWINDOWS}



procedure TForm1.FormCreate(Sender: TObject);
var FrameLogin: TFrameLogin;
begin
  FrameLogin := TFrameLogin.Create(self);
  FrameLogin.Parent := Self;
  FrameLogin.Visible := True;
end;

end.
