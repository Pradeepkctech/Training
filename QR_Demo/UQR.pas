unit UQR;




// Demo app for ZXing QRCode port to Delphi, by Debenu Pty Ltd (www.debenu.com)
// Need a PDF SDK? Checkout Debenu Quick PDF Library: http://www.debenu.com/products/development/debenu-pdf-library/

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DelphiZXingQRCode, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.ComCtrls;

type
  TfrmQRGen = class(TForm)
    cmbEncoding: TComboBox;
    lblEncoding: TLabel;
    edtQuietZone: TEdit;
    lblPreview: TLabel;
    PaintBox1: TPaintBox;
    btnSave: TButton;
    pnlPreview: TPanel;
    pnlProperties: TPanel;
    pgcInput: TPageControl;
    tabText: TTabSheet;
    edtText: TEdit;
    btnTextGenerate: TButton;
    tabPhone: TTabSheet;
    edtContact: TEdit;
    btnGeneratePhone: TButton;
    tabEmail: TTabSheet;
    btnGenerateEmail: TButton;
    edtEmail: TEdit;
    tabSMS: TTabSheet;
    edtPhone: TEdit;
    lblQuietZone: TLabel;
    btnGenerateSMS: TButton;
    SavePictureDialog1: TSavePictureDialog;
    lblKCTech: TLabel;
    pnlMaster: TPanel;
    pnlQR: TPanel;
    edtSMS: TEdit;
    lblPhone_No: TLabel;
    lblMSG: TLabel;
    pnlTitle: TPanel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure cmbEncodingChange(Sender: TObject);
    procedure edtQuietZoneChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnTextGenerateClick(Sender: TObject);
    procedure btnGeneratePhoneClick(Sender: TObject);
    procedure btnGenerateEmailClick(Sender: TObject);
    function IsValidEmail(const Value: string): boolean;
    procedure btnGenerateSMSClick(Sender: TObject);
    function QRGen(inputData: String): String;
    procedure edtContactKeyPress(Sender: TObject; var Key: Char);
    function keyPress(var data: Char): Char;

  private
    QRCodeBitmap: TBitmap;
  public
  end;

var
  frmQRGen: TfrmQRGen;

implementation

{$R *.dfm}

// For Validating Email Address
function TfrmQRGen.IsValidEmail(const Value: string): boolean;
  function CheckAllowed(const s: string): boolean;
  var
    i: integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
    begin
      // illegal char - no valid address
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.', '+'])
      then
        Exit;
    end;
    Result := True;
  end;

var
  i: integer;
  namePart, serverPart: string;
begin
  Result := False;

  i := Pos('@', Value);
  if (i = 0) then
    Exit;

  if (Pos('..', Value) > 0) or (Pos('@@', Value) > 0) or (Pos('.@', Value) > 0)
  then
    Exit;

  if (Pos('.', Value) = 1) or (Pos('@', Value) = 1) then
    Exit;

  namePart := Copy(Value, 1, i - 1);
  serverPart := Copy(Value, i + 1, Length(Value));
  if (Length(namePart) = 0) or (Length(serverPart) < 5) then
    Exit; // too short

  i := Pos('.', serverPart);
  // must have dot and at least 3 places from end
  if (i = 0) or (i > (Length(serverPart) - 2)) then
    Exit;

  Result := CheckAllowed(namePart) and CheckAllowed(serverPart);
end;
 // For Block Typing the alphabetes in a Phone tab
function TfrmQRGen.keyPress(var data: Char): Char;
begin
  if NOT(data in ['0' .. '9', '+', #8]) then
    data := #0;
end;
 // For Creating QR
function TfrmQRGen.QRGen(inputData: String): String;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: integer;
begin
  cmbEncoding.Enabled := True;
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.data := inputData;
    QRCode.Encoding := TQRCodeEncoding(cmbEncoding.ItemIndex);
    QRCode.QuietZone := StrToIntDef(edtQuietZone.Text, 4);
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end
        else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    FreeAndNil(QRCode);
  end;
  PaintBox1.Repaint;
end;

procedure TfrmQRGen.cmbEncodingChange(Sender: TObject);
begin
  Update;
end;

procedure TfrmQRGen.edtQuietZoneChange(Sender: TObject);
begin
  Update;
end;

procedure TfrmQRGen.edtContactKeyPress(Sender: TObject; var Key: Char);
begin
    keyPress(Key);
end;
// To Generate OR for Phone
procedure TfrmQRGen.btnGeneratePhoneClick(Sender: TObject);
var
  phone_no: String;
begin
  phone_no := edtContact.Text;
  QRGen(phone_no);
end;
     //SMS
procedure TfrmQRGen.btnGenerateSMSClick(Sender: TObject);
var
  smsData: String;
begin
  smsData := 'Phone.NO:' + edtPhone.Text + '  ' + 'Message:' + edtSMS.Text;
  QRGen(smsData);
end;

    //Email
procedure TfrmQRGen.btnGenerateEmailClick(Sender: TObject);
var
  emailData: String;
begin
  if IsValidEmail(edtEmail.Text) then
  begin
    emailData := edtEmail.Text;
    QRGen(emailData);
  end
  else
    ShowMessage('InValid Email Address');
end;

//Text
procedure TfrmQRGen.btnTextGenerateClick(Sender: TObject);
var
  Qr: String;
begin
  Qr := edtText.Text;
  QRGen(Qr)
end;

// To Save QR as Image
procedure TfrmQRGen.btnSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    QRCodeBitmap.SaveToFile(SavePictureDialog1.FileName);
end;

// For Changing Colours

procedure TfrmQRGen.FormCreate(Sender: TObject);
begin
  edtText.StyleElements := [seBorder];
  pnlProperties.StyleElements := [seBorder];
  pgcInput.StyleElements := [seBorder];
  lblPreview.StyleElements := [seBorder];
  PaintBox1.StyleElements := [seBorder];
  cmbEncoding.StyleElements := [seBorder];
  edtQuietZone.StyleElements := [seBorder];
  QRCodeBitmap := TBitmap.Create;
  pnlQR.StyleElements := [seBorder];
  pnlPreview.StyleElements := [seBorder];
  lblKCTech.StyleElements := [seBorder];
  lblQuietZone.StyleElements := [seBorder];
  lblEncoding.StyleElements := [seBorder];
  edtContact.StyleElements := [seBorder];
  edtEmail.StyleElements := [seBorder];
  edtSMS.StyleElements := [seBorder];
  pnlQR.Color := $008CFF;
  lblPhone_No.StyleElements := [seBorder];
  edtText.Font.Color := clHotLight;
  cmbEncoding.Font.Color := clHotLight;
  edtQuietZone.Font.Color := clHotLight;
  lblMSG.StyleElements := [seBorder];
  lblPreview.Font.Color := clHotLight;
  lblEncoding.Font.Color := clHotLight;
  lblQuietZone.Font.Color := clHotLight;
  lblPhone_No.Font.Color := clHotLight;
  lblMSG.Font.Color := clHotLight;
  edtSMS.StyleElements := [seBorder];

  Update;
end;

procedure TfrmQRGen.FormDestroy(Sender: TObject);
begin
  FreeAndNil(QRCodeBitmap);
end;

// for paint the QR
procedure TfrmQRGen.PaintBox1Paint(Sender: TObject);
var
  Scale: Double;
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(Rect(0, 0, PaintBox1.Width, PaintBox1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (PaintBox1.Width < PaintBox1.Height) then
    begin
      Scale := PaintBox1.Width / QRCodeBitmap.Width;
    end
    else
    begin
      Scale := PaintBox1.Height / QRCodeBitmap.Height;
    end;
    PaintBox1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width),
      Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

end.
