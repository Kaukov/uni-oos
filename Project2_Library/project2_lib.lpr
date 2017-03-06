library project2_lib;

{$mode objfpc}{$H+}

uses
  Classes
  { you can add units after this };
function Add(a, b : Integer):Integer;stdcall;
begin
  Add := a + b;
end;

function Subtract(a, b : Integer):Integer;stdcall;
begin
  Subtract := a - b;
end;

exports
  Add, Subtract;

end.

