with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;
package body gtoposort is
    Package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;
    Package ActionIO is new Ada.Text_IO.Enumeration_IO(ActionType); use ActionIO;
    function Int2ActionType is new Ada.Unchecked_Conversion(Integer,ActionType);
    function ActionType2Int is new Ada.Unchecked_Conversion(ActionType,Integer);

    NA: integer;
    type Node;
    type NodePointer is access Node;
  
    type Node is tagged record
        Suc:	ActionType;
	    Next:	NodePointer;
    end record;

    type SortElement is record
	    Count:  	Integer;
	    Top:		NodePointer;
    end record;

   

    procedure TopoSort is
        KN, NoOfActions, R, F, Knt: integer := 0;
        j,k : ActionType;
        Ptr : NodePointer := new node;
        P : NodePointer;
    begin
        -- (Step 1) Initialization
        put_line("Enter The Number of Elements");
        get(NA);
        declare
            SortStructure:  Array(0..NA) of SortElement; 
        begin
            
       
            for k in 1..NA loop
                SortStructure(k).Count := 0;
                SortStructure(k).Top := null;
            end loop;
            KN := NA;

            -- (Step 2)
            put_line("Enter The Number Of Actions");
            get(NoOfActions);
        

            for index in 1..NoOfActions loop
                
                put_line("Enter Preceding Value: ");
                get(j);
                put_line("Enter Succeding Value: ");
                get(k);
                SortStructure(ActionType2Int(k)).Count := SortStructure(ActionType2Int(k)).Count + 1;
                P := new node;
                P.Suc := k;
                P.Next := SortStructure(ActionType2Int(j)).Top;
                SortStructure(ActionType2Int(j)).Top := P;
            end loop;

            --Step 3
            R := 0;
            SortStructure(0).Count := 0;
            for index in 1..NA loop
                if SortStructure(index).Count = 0 then
                    SortStructure(R).Count := index;
                    R := index;
                end if;
            end loop;
            F := SortStructure(0).Count;

            --Step 4
            put_line("--------------------------------------TOPOGRAPHIC SORT--------------------------------------------");
            while F /= 0 loop
                -- Perform Action F
                put(F);
                KN := KN - 1;
                P := SortStructure(F).Top;
                SortStructure(F).Top := null;
                --SortStructure(I).Top points to all relations not yet cancelled. (1 := I := NA)
                while P /= null loop
                    SortStructure(ActionType2Int(P.Suc)).Count := SortStructure(ActionType2Int(P.Suc)).Count - 1;
                    if SortStructure(ActionType2Int(P.Suc)).Count = 0 then
                        SortStructure(R).Count := ActionType2Int(P.Suc);
                        R := ActionType2Int(P.Suc);
                    end if;
                    P := P.Next;
                end loop;
                F := SortStructure(F).Count;
            end loop;
            new_line;
            put_line("--------------------------------------------------------------------------------------------------");

            -- Step 5
            if KN = 0 then
                new_line;
                put_line("Topological Sort Complete. All Actions Have Been Printed To Output Stream");
            else
                -- violated hypothesis
                put_line("Loop Detected");
                put_line("Loop Contents: ");
                for K in 1..NA loop
                    SortStructure(K).Count := 0;
                end loop;
    

            --Step 6
            For K in 1..NA loop
                P := SortStructure(K).Top;
                while (p /= null) and then (SortStructure(K).Count = 0) loop
                    
                    SortStructure(K).Count := ActionType2Int(P.Suc);
                    if p /= null then
                        p := P.Next;
                    end if;
                end loop;
            end loop;

            --Step 7
            Knt := 1;
            while SortStructure(Knt).Count = 0 loop
                Knt := Knt + 1;
            end loop;

            --Step 8
            loop
                P := new node;
                SortStructure(Knt).Top := P;
                Knt := SortStructure(Knt).Count;
                if SortStructure(Knt).Top /= null then
                    exit;
                end if;
            end loop;

            --Step 9
            While SortStructure(Knt).Top /= null loop
                ActionIO.put(SortStructure(Knt).Top.Suc);
                SortStructure(Knt).Top := null;
                Knt := SortStructure(Knt).Count;
            end loop;
            end if;
        end;
    end TopoSort;
end gtoposort;