with Ada.Text_IO; use Ada.Text_IO;
with gtoposort;
procedure driver is
package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;

    -- Get procedure. Used to reteieve elements. Goes in generic to overload get    
    procedure getElem(Action: out integer) is
    begin
        get(Action);
    end getElem;

    -- Get procedure. Used to reteieve elements. Goes in generic to overload get
    procedure putElem(Action: in integer) is
    begin
        
        put(Action'image);
    end putElem;

    Done : integer := 1; -- loop control
    
begin

    declare
        package sort is new gtoposort(integer,getElem,putElem); use sort; -- Instantiates generic topological sort
    begin
        while done = 1 loop
            TopoSort;
            new_line;
            put_line("New Sort ? '1' for yes '0' for no");
            get(done);
            if done = 0 then
                new_line;
                put_line("Thank you for using TopoSort");
                exit;
            end if;
        end loop;
        
    end;
end driver;