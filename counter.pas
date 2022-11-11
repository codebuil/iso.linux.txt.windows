Program main;
Uses sysutils;

function head(): string;
Begin
     head:='Content-type:plain-text'+chr(10)+chr(10)+chr(10)+'<html><head><title>counter</title><head><body bgcolor="#008800">';
End;

function tail(): string;
Begin
     tail:='</head></html>';
End;

function body(): string;
var
f1:Longint;
i:Longint;
Begin
	f1:=FileOpen ('./0',fmOpenRead);
	if f1=-1 then
		begin
			i:=0;
			f1:=FileCreate ('./0');
			FileWrite (f1,i,SizeOf(i));
			FileClose (f1);
			f1:=FileOpen ('./0',fmOpenRead);
		end;
	FileRead (f1,i,SizeOf(i));
	FileClose (f1);
	i:=i+1;
	f1:=FileOpen ('./0',fmOpenWrite);
	FileWrite (f1,i,SizeOf(i));
	FileClose (f1);
     	Str(i,body);
End;
(* Here the main program block starts *)
Begin
    writeln(head());
    writeln(body());
    WriteLn(tail());

End.

