program webservice;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrm_webservice in 'ufrm_webservice.pas' {frm_webservice},
  ufrm_dm in 'ufrm_dm.pas' {frm_dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_webservice, frm_webservice);
  Application.Run;
end.
