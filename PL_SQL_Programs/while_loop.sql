declare
  x number;

begin
   x := &x;
  dbms_output.put_line('Enter the value of x: ' || x); 
  while x < 5 loop
    dbms_output.put_line(x);
    x := x + 1;
  end loop;

end;
/  