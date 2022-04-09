unit splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  login, numberpad, order;

type
  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure MsgBox(title: string; text: string);

    procedure LoginComplete(userID: string; userName: string);
    procedure OnLogout;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  currentFrame: TFrame;
  FrameLogin: TFrameLogin;
  FrameOrder: TFrameOrder;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Windows.fmx MSWINDOWS}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  CurrentFrame.OnKeyDown(Sender, Key, KeyChar, Shift);
end;

procedure TForm1.MsgBox(title: string; text: string);
begin
  ShowMessage(text);
end;

procedure TForm1.OnLogout;
begin
  CurrentFrame.Free;

  FrameLogin := TFrameLogin.Create(self);
  FrameLogin.Parent := Form1;
  FrameLogin.Visible := True;
  FrameLogin.Align := TAlignLayout.Client;
  FrameLogin.OnLoginComplete := Form1.LoginComplete;

  CurrentFrame := FrameLogin;
end;

procedure TForm1.LoginComplete(userID: string; userName: string);
begin
  CurrentFrame.Free;
  FrameOrder := TFrameOrder.Create(self);
  FrameOrder.Parent := Form1;
  FrameOrder.Visible := True;
  FrameOrder.Align := TAlignLayout.Client;

  FrameOrder.OnLogout := OnLogout;

  FrameOrder.Setup;

  CurrentFrame := FrameOrder;

  Image1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FrameLogin := TFrameLogin.Create(self);
  FrameLogin.Parent := Form1;
  FrameLogin.Visible := True;
  FrameLogin.Align := TAlignLayout.Client;
  FrameLogin.OnLoginComplete := LoginComplete;

  CurrentFrame := FrameLogin;
end;

end.
