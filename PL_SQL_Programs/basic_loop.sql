
DECLARE
    y NUMBER;
BEGIN
    y := &y;

    DBMS_OUTPUT.PUT_LINE('Enter the value of y: ' || y);

    LOOP
        DBMS_OUTPUT.PUT_LINE(y);
        y := y + 1;
        EXIT WHEN y > 10;
    END LOOP;
END;
/
