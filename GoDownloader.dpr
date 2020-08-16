program GoDownloader;

uses
  Vcl.Forms,
  UFrmMain in 'view\UFrmMain.pas' {frmMain},
  uDownloadController in 'controller\uDownloadController.pas',
  uDownloadModel in 'model\uDownloadModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
