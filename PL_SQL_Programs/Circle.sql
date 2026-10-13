DECLARE
    r NUMBER;
    A NUMBER;
    C NUMBER;
BEGIN
    r := 10;
    A := 3.14*r*r;
    C := 2*3.14*r;

    DBMS_OUTPUT.PUT_LINE('Area of circle is ' || A);
    DBMS_OUTPUT.PUT_LINE('Circumference of circle is ' || C);
       
END;
/
