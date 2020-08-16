unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

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
    procedure btnStartClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uDownloadController;

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  TDownloadController.new
                     .setUrl(edtUrl.Text)
                     .setIdHttp(IdHTTP1)
                     .downloadModel;

end;

end.
