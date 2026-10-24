declare 
  a number;
  b number;
  c number;
  n number;
  i number;

begin
  n := &n;
  dbms_output.put_line('Enter the no. of elements: ' || n);
  
  dbms_output.put_line('Enter values of a and b:');

   a := &a;
  dbms_output.put_line('a = ' || a);
 
  b := &b;
  dbms_output.put_line('b = ' || b);
  
  dbms_output.put_line('Fibonacci series is:');
  for i in 1 .. n loop
    dbms_output.put(a || '  ');
    c := a + b;
    a := b;
    b := c;
  end loop;  
  
  dbms_output.new_line;

end;
/                                                                                                                                         