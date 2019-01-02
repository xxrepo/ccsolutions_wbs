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
  FMX.ActnList,
  FMX.ImgList,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,

  uDWAbout,
  uRESTDWBase,

  ufrm_dm;

type
  Tfrm_webservice = class(TForm)
    servicePooler: TRESTServicePooler;
    ImageList_1: TImageList;
    ActionList_1: TActionList;
    StatusBar_1: TStatusBar;
    Panel_bottom: TPanel;
    Button_iniciar: TButton;
    Button_parar: TButton;
    Button_fechar: TButton;
    Action_iniciar: TAction;
    Action_parar: TAction;
    Action_fechar: TAction;
    Edit_porta: TEdit;
    Label_porta: TLabel;
    Panel_top: TPanel;
    Label_top: TLabel;
    Label_usuario: TLabel;
    Edit_usuario: TEdit;
    Label_senha: TLabel;
    Edit_senha: TEdit;
    CheckBox_autenticao: TCheckBox;
    GroupBox_servidor: TGroupBox;
    procedure Action_iniciarExecute(Sender: TObject);
    procedure Action_pararExecute(Sender: TObject);
    procedure Action_fecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure statusButton;
  public

  end;

var
  frm_webservice: Tfrm_webservice;

implementation

{$R *.fmx}

{ Tfrm_webservice }

procedure Tfrm_webservice.Action_fecharExecute(Sender: TObject);
begin
  if servicePooler.Active then begin
    servicePooler.Active := False;
    Close;
  end else begin
    Close;
  end;
end;

procedure Tfrm_webservice.Action_iniciarExecute(Sender: TObject);
begin
  servicePooler.ServicePort := StrToInt(Edit_porta.Text);

  if CheckBox_autenticao.IsChecked then begin
    if Edit_usuario.Text.IsEmpty or Edit_senha.Text.IsEmpty then begin
      ShowMessage('Usu�rio/Senha em Branco!');
    end else begin
      servicePooler.ServerParams.HasAuthentication := True;
      servicePooler.ServerParams.UserName := Edit_usuario.Text;
      servicePooler.ServerParams.Password := Edit_senha.Text;
    end;
  end else begin
    servicePooler.ServerParams.HasAuthentication := False;
  end;

  servicePooler.Active := not servicePooler.Active;
  statusButton;
end;

procedure Tfrm_webservice.Action_pararExecute(Sender: TObject);
begin
  servicePooler.Active := not servicePooler.Active;
  statusButton;
end;

procedure Tfrm_webservice.FormCreate(Sender: TObject);
begin
  servicePooler.ServerMethodClass := Tfrm_dm;
end;

procedure Tfrm_webservice.statusButton;
begin
  if servicePooler.Active then begin
    Button_iniciar.Enabled := False;
    Button_parar.Enabled := True;
  end else begin
    Button_iniciar.Enabled := True;
    Button_parar.Enabled := False;
  end;
end;

end.
