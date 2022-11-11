Program main;
Uses sysutils,dos;

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
s:string;
ss:string;
f1:Longint;
i:Longint;
Begin
	s:=GetEnv('QUERY_STRING');
	i:=0;
	ss:='./zzz'+s;
	f1:=FileOpen (ss,fmOpenRead);
	if f1=-1 then
		begin
			i:=0;
			f1:=FileCreate (ss);
			FileWrite (f1,i,SizeOf(i));
			FileClose (f1);
			f1:=FileOpen (ss,fmOpenRead);
		end;
	FileRead (f1,i,SizeOf(i));
	FileClose (f1);
	i:=i+1;
	f1:=FileOpen (ss,fmOpenWrite);
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

