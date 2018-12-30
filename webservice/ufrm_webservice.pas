unit ufrm_webservice;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Actions,
  System.ImageList,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.ActnList,
  FMX.ImgList,
  FMX.Controls.Presentation,

  uDWAbout,
  uRESTDWBase,

  ufrm_dm;

type
  Tfrm_webservice = class(TForm)
    service_pooler: TRESTServicePooler;
    ImageList_1: TImageList;
    ActionList_1: TActionList;
    Action_iniciar: TAction;
    Action_parar: TAction;
    Panel_1: TPanel;
    Button_iniciar: TButton;
    Button_parar: TButton;
    Button1: TButton;
    Action_fechar: TAction;
    StatusBar_1: TStatusBar;
    procedure Action_iniciarExecute(Sender: TObject);
    procedure Action_pararExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action_fecharExecute(Sender: TObject);
  private
    procedure Status;
  public

  end;

var
  frm_webservice: Tfrm_webservice;

implementation

{$R *.fmx}

procedure Tfrm_webservice.Action_fecharExecute(Sender: TObject);
begin
  Close;
  if service_pooler.Active then begin
    service_pooler.Active := False;
    Close;
  end else begin
    Close;
  end;
end;

procedure Tfrm_webservice.Action_iniciarExecute(Sender: TObject);
begin
  service_pooler.Active := not service_pooler.Active;
  Status;
end;

procedure Tfrm_webservice.Action_pararExecute(Sender: TObject);
begin
  service_pooler.Active := not service_pooler.Active;
  Status;
end;

procedure Tfrm_webservice.FormCreate(Sender: TObject);
begin
  service_pooler.ServerMethodClass := Tfrm_dm;
end;

procedure Tfrm_webservice.FormShow(Sender: TObject);
begin
  Status;
end;

procedure Tfrm_webservice.Status;
begin
  if service_pooler.Active then begin
    Button_iniciar.Enabled := False;
    Button_parar.Enabled := True;
  end else begin
    Button_iniciar.Enabled := True;
    Button_parar.Enabled := False;
  end;
end;

end.