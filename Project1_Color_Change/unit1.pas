unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

const
  CM_MYMESSAGE = WM_APP + 1;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ColorDialog1: TColorDialog;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  protected
    procedure CMMyMessage(var Message: TMessage); message CM_MYMESSAGE;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := IntToStr(handle);
  Edit1.Text := Caption;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  h_To: THandle;
begin
  if ColorDialog1.Execute then begin
    h_To := StrToInt(Edit1.Text);
    SendMessage(h_To, CM_MYMESSAGE, ColorDialog1.Color, 0);
  end;
end;

procedure TForm1.CMMyMessage(var Message: TMessage);
begin
  Color := Message.WParam;
end;

end.

