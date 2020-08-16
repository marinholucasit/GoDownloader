unit uDownloadController;

interface

uses IdHTTP, uDownloadModel, Vcl.Dialogs, System.SysUtils;

type
  IDownloadController = interface
  ['{3166998E-EB41-4C92-8C31-7A4364F407CC}']
    function setIdHttp(oIdHttp: TIdHTTP):IDownloadController;
    function setUrl(AcUrl: String):IDownloadController;
    function downloadModel: IDownloadModule;
  end;

  TDownloadController = class(TInterfacedObject, IDownloadController)
  private
    FDownloadModel: IDownloadModule;
    function urlIsValid(AcUrl: String): Boolean;
  public
    function setIdHttp(oIdHttp: TIdHTTP):IDownloadController;
    function setUrl(AcUrl: String):IDownloadController;
    function downloadModel: IDownloadModule;
    constructor Create;
    class function new: IDownloadController;

  end;

implementation

{ TDownloadController }

constructor TDownloadController.Create;
begin
  FDownloadModel := TDownloadModule.new;
end;

function TDownloadController.downloadModel: IDownloadModule;
begin
  result := FDownloadModel;
end;

class function TDownloadController.new: IDownloadController;
begin
  result := TDownloadController.Create;
end;

function TDownloadController.setIdHttp(oIdHttp: TIdHTTP): IDownloadController;
begin
  result := self;
  FDownloadModel.idHttp := oIdHttp;
end;

function TDownloadController.setUrl(AcUrl: String): IDownloadController;
begin

  if not urlIsValid(AcUrl) then
  begin
    showMessage('Aten��o Informe uma URL');
    abort;
  end;
  result := self;
  FDownloadModel.url := AcUrl;
end;

function TDownloadController.urlIsValid(AcUrl: String): Boolean;
begin
  result := (AcUrl <> emptystr);
end;

end.