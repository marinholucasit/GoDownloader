unit uDownloadModel;

interface

uses IdHTTP, Vcl.ComCtrls, System.Threading;

type
  IDownloadModule = interface
  ['{81B4C572-25E2-4FF2-A230-B190929ECF41}']
    procedure setIdHttp(oIdHttp: TIdHTTP);
    procedure setUrl(AcUrl: String);
    procedure setProgressBar(AoProgressBar: TProgressBar);
    procedure startDownload;

    property url: String write setUrl;
    property idHttp: TIdHTTP write setIdHttp;
    property progressBar: TProgressBar write setProgressBar;
  end;

  TDownloadModule = class(TInterfacedObject, IDownloadModule)
  private
    FcUrl: String;
    FoidHttp: TIdHTTP;
    FoProgressBar: TProgressBar;
  public
    procedure startDownload;
    procedure setIdHttp(oIdHttp: TIdHTTP);
    procedure setUrl(AcUrl: String);
    procedure setProgressBar(AoProgressBar: TProgressBar);
    constructor Create;
    class function new: IDownloadModule;

    property url: String write setUrl;
    property idHttp: TIdHTTP write setIdHttp;
    property progressBar: TProgressBar write setProgressBar;

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

procedure TDownloadModule.setProgressBar(AoProgressBar: TProgressBar);
begin
  FoProgressBar := AoProgressBar;
end;

procedure TDownloadModule.setUrl(AcUrl: String);
begin
  FcUrl := AcUrl;
end;

procedure TDownloadModule.startDownload;
var
  T : ITask;
begin
  T := TTask.Create( procedure()
    begin
      FoidHttp.Get(FcUrl);
    end );

  T.Start;

end;

end.
