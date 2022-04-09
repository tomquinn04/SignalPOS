unit order;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  itemgrid, FMX.Layouts, FMX.Controls.Presentation;

type
  // events
  TEventLogout = procedure of object;

  TFrameOrder = class(TFrame)
    GridPanelLayout1: TGridPanelLayout;
    FrameItemGrid1: TFrameItemGrid;
    BtnLogout: TSpeedButton;
    procedure BtnLogoutClick(Sender: TObject);
    procedure Setup;
  private
    { Private declarations }

    // events
    FOnLogout: TEventLogout;
  public
    { Public declarations }

    // events
    property OnLogout: TEventLogout read FOnLogout write FOnLogout;
  end;

implementation

{$R *.fmx}
procedure TFrameOrder.Setup;
begin
  FrameItemGrid1.LoadButtons;
end;

procedure TFrameOrder.BtnLogoutClick(Sender: TObject);
begin
if assigned(OnLogout) then OnLogout;
end;

end.
