unit itemgrid;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, datamodule;

type
  TFrameItemGrid = class(TFrame)
    FlowLayout1: TFlowLayout;
    SpeedButton9: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadButtons;
    procedure ProdButtonClick(Sender: TObject);
  end;

  TProductButton = class(TSpeedButton)
    public
      ProductID: Integer;
  end;

implementation

{$R *.fmx}

procedure TFrameItemGrid.LoadButtons;
var TmpButton: TProductButton;
begin
  SpeedButton9.Free; // remove testing button

  DataModule1.LoadProducts;

  with DataModule1.QryProducts do
  begin
    First;
    while not EOF do
    begin
      TmpButton := TProductButton.Create(FlowLayout1);
      with TmpButton do
      begin
        Name := 'Prod' + FieldByName('productID').AsString;
        ProductID := FieldByName('productID').AsInteger;
        Text := FieldByName('productName').AsString;
        Width := 80;
        Height := 70;
        Parent := FlowLayout1;
        TextSettings.WordWrap := True;
        StyleLookup := 'cornerbuttonstyle';
        OnClick := ProdButtonClick;
      end;
      Next;
    end;
  end;
end;

procedure TFrameItemGrid.ProdButtonClick(Sender: TObject);
begin
  with Sender as TProductButton do
  begin
    ShowMessage(Text + ' ' + ProductID.ToString);
  end;
end;

end.
