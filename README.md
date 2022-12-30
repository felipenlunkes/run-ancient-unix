# Run ancient UNIX

<div align="justify">

The contents of this repository allow older versions of UNIX to run on Unix-like systems with ease.

## License, Credits and Copyright

First of all, credits and acknowledgment for material available in this repository that is not my own (or has been modified by me based on previous work).

- The UNIX versions available in this repository have been released as open source under the [Caldera license](Caldera-license.pdf) available in this repository. Please read the document carefully for concrete information about your rights and obligations when using the software.
  - Note that various components within the system images may have been made available under other license conditions. Pay attention to these components. A clear example is version 2.11BSD UNIX, which features code covered by the Caldera license made available, in addition to code released under the BSD license. Source files available in the images show the license and due copyright. Check this data before reuse.
  - The UNIX images available in this repository were obtained from the w11 project (which uses these images for other purposes). you can get them directly [here](https://wfjm.github.io/home/w11/inst/systems.html#h_os_kits), as well as more information about the project, images, licenses and other data.
- The scripts used to simulate the systems using SIMH for v5 and v7 UNIX were obtained from a w11 project repository, which can be accessed [here](https://github.com/wfjm/w11/tree/master/tools/oskit). The original scripts are available under license GLP v3 or later.
  - In addition, the general script for configuring the execution environment of versions v5 and v7 was obtained from the project, authored by Walter F.J. Mueller. You can get the original script [here](https://github.com/wfjm/w11/blob/master/tools/simh/setup_w11a_max.scmd). The original script are available under license GLP v3 or later.
- All my contributions and modifications are available in this repository under the BSD-3-Clause [license](LICENSE).

## Running UNIX

### Section 1

First of all, you must have the PDP-11 Simulator installed on your device. If you already have it installed, skip to [section 2](#section-2).

> To install on Debian, Ubuntu, Pop!_OS and derivatives, use:

```
sudo apt install simh
```

> To install on Fedoraand derivatives, use:

```
sudo dnf install simh
```

After installation, proceed to [section 2](#section-2).

### Section 2


You must clone this repository to your computer. For that, use:

```
git clone https://github.com/felipenlunkes/run-ancient-unix
cd run-ancient-unix
```

Go to [section 3](#section-3).

### Section 3

Now, you have to run the available `run.sh` script. For that, use:

```
chmod +x run.sh
./run.sh
```

When running the script, you will be asked to choose one of the available UNIX versions. After typing only the number relative to the choice, press <ENTER> to make your decision effective. Then wait for the desired version to run.

Now, you need to know peculiarities in the execution of each version of the system. For this, go to [section 4](#section-4).

### Section 4

#### Particularities for v1 UNIX version

After the start of execution after selecting v1 version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 1

PDP-11 simulator V3.8-1
Disabling CR
Disabling XQ
RF: buffering file in memory
TC0: 16b format, buffering file in memory

:login: 
```

Just type `root`, in lower case, and press <ENTER>. You will immediately be taken to the UNIX v1 shell.

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 1

PDP-11 simulator V3.8-1
Disabling CR
Disabling XQ
RF: buffering file in memory
TC0: 16b format, buffering file in memory

:login: root
root
# ls
bin
dev
etc
tmp
usr
# 
```

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the simh> prompt appears on the screen.

#### Particularities for v5 UNIX version

After the start of execution after selecting v5 version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 2

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
@
```

To start UNIX, you must type `unix` and press <ENTER> after the @ character, without spaces and in lower case. After pressing <ENTER>, UNIX will load and you will be taken to a login screen as below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 2

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
@unix

login:
```

You must then type `root` and press <ENTER>. You will then be taken to the shell and be able to use the system. see below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 2

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
@unix

login: root
# 
```

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the simh> prompt appears on the screen.

#### Particularities for v7 UNIX version

After the start of execution after selecting v7 version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 3

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
```

After seeing the screen above, you must type `boot` in lower case and press <ENTER>. You will see the screen below after that:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 3

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
boot
Boot
:
```

After the appearance of `:`, you must type, without spaces and in lower case, the command `hp(0,0)unix` and press <ENTER>, as below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 3

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
boot
Boot
: hp(0,0)unix
mem = 2020544
# 
```

Pressing <ENTER> will immediately take you to the UNIX v7 shell. To enter multiuser mode and access all system functions, press CTRL-D. Afterwards, provide `root` as username and password. you will again be taken to the UNIX v7 shell, as below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) Clear temporary files

Select a number and press <ENTER>: 3

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
boot
Boot
: hp(0,0)unix
mem = 2020544
# RESTRICTED RIGHTS: USE, DUPLICATION, OR DISCLOSURE
IS SUBJECT TO RESTRICTIONS STATED IN YOUR CONTRACT WITH
WESTERN ELECTRIC COMPANY, INC.
WED DEC 31 19:05:14 EST 1969

login: root
Password:
You have mail.
# 
```

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the simh> prompt appears on the screen.

</div>