unit uDownloadModel;

interface

uses IdHTTP, Vcl.ComCtrls, System.Threading, System.Classes, Vcl.Dialogs,
     IdComponent;

type
  IDownloadModule = interface
  ['{81B4C572-25E2-4FF2-A230-B190929ECF41}']
    procedure setIdHttp(oIdHttp: TIdHTTP);
    procedure setUrl(AcUrl: String);
    procedure setProgressBar(AoProgressBar: TProgressBar);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
       AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
       AWorkCountMax: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure showProgress;
    procedure startDownload;
    procedure stopDownload;

    property url: String write setUrl;
    property idHttp: TIdHTTP write setIdHttp;
    property progressBar: TProgressBar write setProgressBar;
  end;

  TDownloadModule = class(TInterfacedObject, IDownloadModule)
  private
    T : ITask;
    FcUrl: String;
    FoidHttp: TIdHTTP;
    FoProgressBar: TProgressBar;
    FoSaveDialog: TSaveDialog;
    FnWorkCountMax : Int64;
    FcPercentProgress: String;
    FcKbProgress: String;
    function calcKByte(AnValue: Double): String;
    function calcPercent(maxValue, value: Double): string;
    procedure resetVarControllers;
  public
    procedure startDownload;
    procedure setIdHttp(oIdHttp: TIdHTTP);
    procedure setUrl(AcUrl: String);
    procedure setProgressBar(AoProgressBar: TProgressBar);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
       AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
       AWorkCountMax: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure showProgress;
    procedure stopDownload;
    constructor Create;
    class function new: IDownloadModule;

    property url: String write setUrl;
    property idHttp: TIdHTTP write setIdHttp;
    property progressBar: TProgressBar write setProgressBar;

  end;

implementation

uses System.SysUtils;

{ TDownloadModule }

function TDownloadModule.calcKByte(AnValue: Double): String;
var
  total: Double;
begin
  total  := ((AnValue / 1024) / 1024);
  Result := FormatFloat('0.000 KBs', total);
end;

function TDownloadModule.calcPercent(maxValue, value: Double): string;
var
  total: Double;
begin
  total := ((value * 100) / maxValue);
  Result    := FormatFloat('0%', total);
end;

constructor TDownloadModule.Create;
begin

end;

procedure TDownloadModule.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  percent : Double;
begin
  FcPercentProgress := calcPercent(FnWorkCountMax, AWorkCount);
  FcKbProgress := calcKByte(AWorkCount);
  percent := (AWorkCount * 100 );
  FoProgressBar.Position := round(percent / FnWorkCountMax) ;

end;

procedure TDownloadModule.IdHTTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FnWorkCountMax := AWorkCountMax;
end;

procedure TDownloadModule.IdHTTP1WorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  resetVarControllers;
end;

procedure TDownloadModule.resetVarControllers;
begin
  FnWorkCountMax         := 0;
  FoProgressBar.Position := 0;
  FcKbProgress           := EmptyStr;
  FcPercentProgress      := EmptyStr;
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

procedure TDownloadModule.showProgress;
begin
  ShowMessage('Baixando ... '+FcKbProgress + sLineBreak +
              'Download em ... ' +FcPercentProgress );
end;

procedure TDownloadModule.startDownload;
var
  fileDw : TFileStream;
  extFile: String;
begin
  T := TTask.Create( procedure()
  begin
    TThread.Queue(TThread.CurrentThread,
    procedure
    begin
      try
        FoSaveDialog := TSaveDialog.Create(nil);
        extFile := ExtractFileExt(FcUrl);
        FoSaveDialog.Filter := 'File' + extFile + '|*' + extFile;
        FoSaveDialog.FileName := 'File';
        if FoSaveDialog.Execute then
        begin
          fileDw := TFileStream.Create(FoSaveDialog.FileName + extFile, fmCreate);
          try
            FoidHttp.Get(FcUrl, fileDw);
          finally
            FreeAndNil(fileDw);
          end;
        end;
      finally
        FreeAndNil(FoSaveDialog);
      end;
    end);
  end );

  T.Start;

end;

procedure TDownloadModule.stopDownload;
begin
  if (Assigned(T)) then
    T.Cancel;
  FoidHttp.Disconnect;
  ShowMessage('Download Interrompido!');
end;

end.
