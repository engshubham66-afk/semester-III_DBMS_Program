declare
x number;
y number;
z number;

begin
x := 2;
y := 3;
z := x + y;
dbms_output.put_line('sum = ' || z);

end;