  program QR;

uses
  Vcl.Forms,
  UQR in 'UQR.pas' {frmQRGen},
  Vcl.Themes,
  Vcl.Styles,
  DelphiZXIngQRCode in 'Source\DelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Blue');
  Application.CreateForm(TfrmQRGen, frmQRGen);
  Application.Run;
end.
