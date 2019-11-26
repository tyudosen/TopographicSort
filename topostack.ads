generic
    Max: Integer;
    type Item is private; -- type of stack

package topostack is
    procedure Push(x: in item; overflow: out Boolean);
    procedure Pop(x: out item; underflow: out Boolean);
private
    type entries is array( integer range <>) of item;
    
end topostack;


