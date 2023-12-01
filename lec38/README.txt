Lab 8-1 A Generic Register 

Objective: Use nonblocking assignments while describing a register. 

The VeriRISC CPU contains an accumulator register and an instruction register.
One generic register definition can serve both purposes. On the active-high
clock edge the register value becomes zero if the “rst” input is true and
otherwise becomes the data input value if the “load” input is true. 

Further Information 

Statements in different processes that are scheduled to execute in the same
simulation cycle can execute in any order. Thus, any variable that processes use
to communicate between themselves, that is, one process writes and one or more
processes read, must be written using update semantics such that the variable
does not assume the written value until all reading processes have read the
variable. Up to this point, almost all the procedural assignments you have seen
are blocking assignments (=), that is, the assignment statement blocks until
the assignment completes, which is immediately unless you delay it. To support
update semantics, Verilog also provides a nonblocking assignment (<=), that is,
an assignment statement that is scheduled to occur and does not block further
execution while waiting for the assignment to complete. A generally good
heuristic is to use the nonblocking version for any assignment to a variable
that represents design storage (such as a register).

1. Change to the lab8-reg directory and examine the files provided therein: 

README.txt       Lab instructions
register_test.v  Register test

2. Create the register.v file, and using your favorite editor, describe therein
the register module. Parameterize the register data input and output width so
that the instantiating module can specify the width of each instance. Assign a
default value to the parameter.

3. Using the provided test module, test your register description; enter: 

irun register.v register_test.v 

You should see “TEST PASSED”. 

4. Correct your register description as needed. 

