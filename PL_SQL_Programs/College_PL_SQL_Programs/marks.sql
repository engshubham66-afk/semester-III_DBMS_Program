declare 
   marks number;

begin
   marks := 60;
   if marks > 90 then
      dbms_output.put_line('grade A');
   elsif marks > 80 then
       dbms_output.put_line('grade B');
   elsif marks > 70 then
       dbms_output.put_line('grade C');
    elsif marks > 60 then
       dbms_output.put_line('grade D');
    elsif marks > 40 then
        dbms_output.put_line('grade E');
    else
        dbms_output.put_line('grade F');
    end if;
end;
/