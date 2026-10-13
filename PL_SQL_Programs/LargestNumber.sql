declare
    x number;
    y number;
    z number;

begin
    x := 10;
    y := 35;
    z :=  20;
    
    if (x > y) and (x > z) then
         dbms_output.put_line('Greatest number is ' || x);
     
    elsif (y > x) and (y > z) then
          dbms_output.put_line('Greatest number is ' || y);  
     
    else
        dbms_output.put_line('Greatest number is ' || z);      
    end if;    

end;
/