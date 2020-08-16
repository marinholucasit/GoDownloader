unit uDownloadModel;

interface

uses IdHTTP;

type
  IDownloadModule = interface
  ['{81B4C572-25E2-4FF2-A230-B190929ECF41}']
    procedure setIdHttp(oIdHttp: TIdHTTP);
    procedure setUrl(AcUrl: String);

    property url: String write setUrl;
    property idHttp: TIdHTTP write setIdHttp;
  end;

  TDownloadModule = class(TInterfacedObject, IDownloadModule)
  private
    FcUrl: String;
    FoidHttp: TIdHTTP;
  public
    procedure startDownload;
    procedure setIdHttp(oIdHttp: TIdHTTP);
    procedure setUrl(AcUrl: String);
    constructor Create;
    class function new: IDownloadModule;

    property url: String write setUrl;
    property idHttp: TIdHTTP write setIdHttp;

  end;

implementation

{ TDownloadModule }

constructor TDownloadModule.Create;
begin

end;

class function TDownloadModule.new: IDownloadModule;
begin
  result := TDownloadModule.Create;
end;

procedure TDownloadModule.setIdHttp(oIdHttp: TIdHTTP);
begin
  FoidHttp := oIdHttp;
end;

procedure TDownloadModule.setUrl(AcUrl: String);
begin
  FcUrl := AcUrl;
end;

procedure TDownloadModule.startDownload;
begin
  FoidHttp.Get(FcUrl);
end;

end.
