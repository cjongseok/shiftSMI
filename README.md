# shiftSMI
Simple BASh script shifting .smi formatted subtitle to given delay.
It accepts any unicode subtitles.


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


### Tested Environments
- *Korean* on *macOS Sierra (10.12.5)*
