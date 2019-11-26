generic
    type ActionType is (<>); -- Discreet element. J or K
    with procedure get(Action: out ActionType);
    with procedure put(Action: in ActionType);
package gtoposort is
    procedure TopoSort;
end gtoposort; 