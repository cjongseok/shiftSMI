shiftSMI
========
Simple BASH script shifting .smi formatted subtitle to given delay.
It accepts any unicode subtitles.


Tested Environments
-------------------
- *Korean* on *macOS Sierra (10.12.5)*


[![Analytics](https://ga-beacon.appspot.com/UA-104778232-1/shiftSMI/README.md?pixel)](https://github.com/igrigorik/ga-beacon)


Install
-------
```sh
# Download the script
$ wget https://raw.githubusercontent.com/cjongseok/shiftSMI/master/shiftSmi.sh

# Grant execute permission
$ chmod +x shiftSmi.sh
```


Usage
-----
```sh
$ ./shiftSmi.sh <SMI_PATH> <DELAY_IN_MS>
```


Examples
--------
Shift an smi, hello.smi, to 5 seconds forward:

```sh
$ ./shiftSmi.sh hello.smi 5000
```

Shift an smi, hello.smi, to 0.5 seconds backward:

```sh
$ ./shiftSmi.sh hello.smi -500
```
