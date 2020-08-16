unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, uDownloadController,
  IdAntiFreezeBase, IdAntiFreeze;

type
  TfrmMain = class(TForm)
    edtUrl: TLabeledEdit;
    pbProgress: TProgressBar;
    panelTop: TPanel;
    gbBottons: TGroupBox;
    btnStart: TButton;
    btnShowMsg: TButton;
    Button1: TButton;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure btnShowMsgClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FIDownloadController : IDownloadController;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnShowMsgClick(Sender: TObject);
begin
  FIDownloadController.urlIsValid(edtUrl.Text)
                      .downloadModel
                      .showProgress;
end;

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  FIDownloadController.urlIsValid(edtUrl.Text)
                     .setUrl(edtUrl.Text)
                     .setIdHttp(IdHTTP1)
                     .setProgressBar(pbProgress)
                     .downloadModel
                     .startDownload;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  FIDownloadController.downloadModel
                      .stopDownload;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FIDownloadController := TDownloadController.new;
end;

procedure TfrmMain.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  FIDownloadController.downloadModel
                      .IdHTTP1Work(ASender, AWorkMode, AWorkCount);
end;

procedure TfrmMain.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  FIDownloadController.downloadModel
                      .IdHTTP1WorkBegin(ASender, AWorkMode, AWorkCountMax);
end;

procedure TfrmMain.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  FIDownloadController.downloadModel
                      .IdHTTP1WorkEnd(ASender, AWorkMode);
end;

end.
