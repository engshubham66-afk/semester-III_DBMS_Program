declare
  x number;

begin
  dbms_output.put_line('the numbers are');
  for x in 1 .. 10 loop
   dbms_output.put_line(x);
  end loop;

end;
/  