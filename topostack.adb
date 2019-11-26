with Ada.Text_IO; use Ada.Text_IO;
package body topostack is
    stack : entries(1..max); 
    top: integer range 0.. max + 1;
    --stop: integer range 0..max +1;

    procedure push(x: in item; overflow: out Boolean) is
    begin
        if top < max then
            top := top + 1;
            stack(top) := x;
        else
            overflow := true;
        end if;   
    end push;

    procedure pop(x: out item; underflow: out Boolean) is
    begin
        if top /= 0 then
            x := stack(top);
            top := top -1;
        else
            underflow:= true;
        end if;
    end pop;

begin
    top := 0; -- Sets Tie fighers to empty.
end topostack;