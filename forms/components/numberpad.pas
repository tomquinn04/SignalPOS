unit numberpad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts;

type
  // events
  TEventOnNumberClick = procedure(number : integer);
  TEventOnEnterClick = procedure();
  TEventOnBackspaceClick = procedure();

  // frame
  TFrameNumberpad = class(TFrame)
    // controls
    GridPanelLayout1: TGridPanelLayout;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    Btn4: TButton;
    Btn5: TButton;
    Btn6: TButton;
    Btn7: TButton;
    Btn8: TButton;
    Btn9: TButton;
    BtnBack: TButton;
    Btn0: TButton;
    BtnEnter: TButton;
    procedure BtnClick(Sender: TObject);

  private
    { Private declarations }
    // events
    FOnNumberClick: TEventOnNumberClick;
    FOnEnterClick: TEventOnEnterClick;
    FOnBackspaceClick: TEventOnBackspaceClick;
  public
    { Public declarations }
    // events
    property OnNumberClick: TEventOnNumberClick read FOnNumberClick write FOnNumberClick;
    property OnEnterClick: TEventOnEnterClick read FOnEnterClick write FOnEnterClick;
    property OnBackspaceClick: TEventOnBackspaceClick read FOnBackspaceClick write FOnBackspaceClick;

    // event handlers
    procedure HandleNumberClick(number: integer; Sender: TObject);
    procedure HandleBackspaceClick(Sender: TObject);
    procedure HandleEnterClick(Sender: TObject);

  end;

implementation

{$R *.fmx}

procedure TFrameNumberpad.BtnClick(Sender: TObject);
begin
  with Sender as TButton do
  begin
    if (Name = 'BtnBack') then HandleBackspaceClick(Sender)
    else if (Name = 'BtnEnter') then HandleEnterClick(Sender)
    else HandleNumberClick(Text.ToInteger, Sender);
  end;
end;

end.
