unit login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, numberpad, FMX.Controls.Presentation;

type

    // events
  TEventOnLoginComplete = procedure(userID: string; userName: string) of object;

  TFrameLogin = class(TFrame)
    GridLoginRoot: TGridPanelLayout;
    GridLoginRight: TGridPanelLayout;
    FrameNumberpad1: TFrameNumberpad;
    GridPINPad: TGridPanelLayout;
    LblLogin: TLabel;
    LblPinFeedback: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FramePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure FrameKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private

      // events
    FOnLoginComplete: TEventOnLoginComplete;

    { Private declarations }
    procedure NumpadNumberClick(number: integer);
    procedure NumpadBackspaceClick;
    procedure NumpadEnterClick;
    procedure PINComplete;
    procedure UserComplete;
    procedure UpdatePINLabel;

    var
      currentPIN: string;
      userID: string;
      currentUsername: string;
      loginStage: integer; {0: user, 1: password}
  public

      // events
    property OnLoginComplete: TEventOnLoginComplete read FOnLoginComplete write FOnLoginComplete;

        // event handlers
    procedure HandleLoginComplete(userID: string; userName: string);
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses datamodule;

procedure TFrameLogin.HandleLoginComplete(userID: string; userName: string);
begin
  if Assigned(OnLoginComplete) then OnLoginComplete(userID, userName)
  else ShowMessage('unassigned');
end;

procedure TFrameLogin.NumpadNumberClick(number: integer);
begin
  if (currentPin.Length < 4) then
  begin
  currentPin := currentPin + number.ToString;
  UpdatePinLabel;
  end;
end;

procedure TFrameLogin.NumpadBackspaceClick;
begin
  if currentPIN.Length > 0 then
  begin
    Delete(currentPIN, currentPin.Length, 1);
    UpdatePINLabel;
  end;
end;

procedure TFrameLogin.NumpadEnterClick;
begin
  if loginStage = 1 then
  begin
  if CurrentPIN.Length = 4 then PINComplete
  else
  begin
    ShowMessage('Invalid PIN');
    currentPin := '';
    userID := '';
    loginStage := 0;
    UpdatePINLabel;
    end;
  end
  else if loginStage = 0 then UserComplete;

end;

procedure TFrameLogin.UpdatePINLabel;
begin
  if loginStage = 0 then
  begin
    self.LblLogin.Text := 'Please Enter User ID...';
  end
  else if loginStage = 1 then
  begin
    self.LblLogin.Text := 'Please Enter PIN...';
  end;
  case currentPIN.Length of
    0: self.LblPinFeedback.Text := '_ _ _ _';
    1: self.LblPinFeedback.Text := '* _ _ _';
    2: self.LblPinFeedback.Text := '* * _ _';
    3: self.LblPinFeedback.Text := '* * * _';
    4: self.LblPinFeedback.Text := '* * * *';
  end;
end;

procedure TFrameLogin.PINComplete;
var username: string;
begin
  username := DataModule1.CheckLogin(userID, currentPIN);

  if username = 'incorrect' then
  begin
    ShowMessage(username);
    currentUsername := username;
    currentPin := '';
    userID := '';
    loginStage := 0;
    UpdatePinLabel;
  end
  else HandleLoginComplete(userID, username);
end;

procedure TFrameLogin.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrameLogin.UserComplete;
begin
  userID := currentPIN;
  currentPin := '';
  loginStage := 1;
  UpdatePinLabel;
end;



procedure TFrameLogin.FrameKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if KeyChar in ['0'..'9'] then NumpadNumberClick(StrToInt(KeyChar))
  else if Key = 13 then NumpadEnterClick
  else if Key = 8 then NumpadBackspaceClick;
  Key := 0;
end;

procedure TFrameLogin.FramePaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  FrameNumberpad1.OnNumberClick := NumpadNumberClick;
  FrameNumberpad1.OnEnterClick := NumpadEnterClick;
  FrameNumberpad1.OnBackspaceClick := NumpadBackspaceClick;
end;

end.
