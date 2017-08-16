# shiftSMI
Shift .smi formatted subtitle to given delay.
### Usage
``sh
$ ./shiftSmi.sh <SMI_PATH> <DELAY_IN_MS>
``

### Examples
Shift an smi, hello.smi, to 5 seconds forward:

``sh
$ ./shiftSmi.sh hello.smi 5000
``

Shift an smi, hello.smi, to 0.5 seconds backward:

``sh
$ ./shiftSmi.sh hello.smi -500
``

