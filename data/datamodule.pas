unit datamodule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    QryLogin: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QryProducts: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function CheckLogin(userID: string; userPIN: string): string;
    procedure LoadProducts;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TDataModule1.CheckLogin(userID: string; userPIN: string): string;
var sql: string;
begin
  sql := 'SELECT checkPIN(''' + userID + ''', ''' + userPIN + ''');';

  DataModule1.QryLogin.Open(sql);
  Result := DataModule1.QryLogin.Fields[0].AsString;
  DataModule1.QryLogin.Close;
end;

procedure TDataModule1.LoadProducts;
begin
  DataModule1.QryProducts.Open;
end;

end.
