unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

const
  CM_MYMESSAGE_SUM = WM_APP + 2;
  CM_MYMESSAGE_SUBTRACT = WM_APP + 3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  protected
    procedure CMMyMessageSum(var Message: TMessage); message CM_MYMESSAGE_SUM;
    procedure CMMyMessageSubtract(var Message: TMessage); message CM_MYMESSAGE_SUBTRACT;
  end;

  function Add(a, b : Integer):Integer;stdcall; external 'project2_lib.dll';
  function Subtract(a, b : Integer):Integer;stdcall; external 'project2_lib.dll';

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  h_To : THandle;
  a, b : Integer;
begin
  h_To := StrToInt(Edit1.Text);
  if (Edit2.Text <> '') and (Edit3.Text <> '') then begin
    a := StrToInt(Edit2.Text);
    b := StrToInt(Edit3.Text);
    SendMessage(h_To, CM_MYMESSAGE_SUM, a, b);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  h_To : THandle;
  a, b : Integer;
begin
  h_To := StrToInt(Edit1.Text);
  if (Edit2.Text <> '') and (Edit3.Text <> '') then begin
    a := StrToInt(Edit2.Text);
    b := StrToInt(Edit3.Text);
    SendMessage(h_To, CM_MYMESSAGE_SUBTRACT, a, b);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := IntToStr(handle);
  Edit1.Text := Caption;
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
end;

procedure TForm1.CMMyMessageSum(var Message: TMessage);
var
  a, b : Integer;
  sum : Integer;
begin
  a := Message.wParam;
  b := Message.lParam;
  sum := Add(a, b);
  Edit2.Text := IntToStr(a);
  Edit3.Text := IntToStr(b);
  Edit4.Text := IntToStr(sum);
end;

procedure TForm1.CMMyMessageSubtract(var Message: TMessage);
var
  a, b : Integer;
  sum : Integer;
begin
  a := Message.wParam;
  b := Message.lParam;
  sum := Subtract(a, b);
  Edit2.Text := IntToStr(a);
  Edit3.Text := IntToStr(b);
  Edit4.Text := IntToStr(sum);
end;

end.

