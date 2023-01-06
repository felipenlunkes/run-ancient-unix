<p align="center">
<img src="https://github.com/felipenlunkes/run-ancient-unix/blob/main/doc/banner.png">
</p>

<div align="center">

![](https://img.shields.io/github/license/felipenlunkes/run-ancient-unix.svg)
![](https://img.shields.io/github/stars/felipenlunkes/run-ancient-unix.svg)
![](https://img.shields.io/github/issues/felipenlunkes/run-ancient-unix.svg)
![](https://img.shields.io/github/issues-closed/felipenlunkes/run-ancient-unix.svg)
![](https://img.shields.io/github/issues-pr/felipenlunkes/run-ancient-unix.svg)
![](https://img.shields.io/github/issues-pr-closed/felipenlunkes/run-ancient-unix.svg)
[![](https://img.shields.io/twitter/follow/felipeldev.svg?style=social&label=Follow%20%40felipeldev)](https://twitter.com/felipeldev)

</div>

<hr>
<hr>

# Run ancient UNIX on modern hardware

<div align="justify">

The contents of this repository allow older versions of [UNIX](https://en.wikipedia.org/wiki/Unix) ([ancient UNIX](https://en.wikipedia.org/wiki/Ancient_UNIX)) to run on [Unix-like](https://en.wikipedia.org/wiki/Unix-like) systems with ease.

At this time, you can run the following versions of UNIX:

- UNIX versions for [PDP-11](https://en.wikipedia.org/wiki/PDP-11) (run on a PDP-11 simulator):
  - [x] [Version 1 UNIX](https://github.com/jserv/unix-v1);
  - [x] [Version 5 UNIX](https://gunkies.org/wiki/UNIX_Fifth_Edition);
  - [x] [Version 7 UNIX](https://en.wikipedia.org/wiki/Version_7_Unix);
  - [x] [2.11BSD UNIX](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution).

- Version 7 UNIX ported to x86 architecture by [Robert Nordier](https://www.nordier.com/) (original port in 1999 and patches in 2006-2007).

## License, Credits and Copyright

First of all, credits and acknowledgment for material available in this repository that is not my own (or has been modified by me based on previous work).

- The UNIX versions available in this repository have been released as open source under the [Caldera license](doc/Caldera-license.pdf) available in this repository. Please read the document carefully for concrete information about your rights and obligations when using the software.
  - Note that various components within the system images may have been made available under other license conditions. Pay attention to these components. A clear example is version 2.11BSD UNIX, which features code covered by the Caldera license made available, in addition to code released under the [BSD license](doc/BSD-license.txt). Source files available in the images show the license and due copyright. Check this data before reuse.
  - The UNIX images available in this repository were obtained from the w11 project (which uses these images for other purposes). You can get them directly [here](https://wfjm.github.io/home/w11/inst/systems.html#h_os_kits), as well as more information about the project, images, licenses and other data.
- The scripts used to simulate the systems using SIMH for v5 and v7 UNIX were obtained from a w11 project repository, which can be accessed [here](https://github.com/wfjm/w11/tree/master/tools/oskit). The original scripts are available under license GLP v3 or later. Modifications in these files were made by me, to fit the purpose of this repository. These modifications are restricted to the same license as the original script.
  - In addition, the general script for configuring the execution environment of versions v5 and v7 was obtained from the project, authored by [Walter F.J. Mueller](https://github.com/wfjm). You can get the original script [here](https://github.com/wfjm/w11/blob/master/tools/simh/setup_w11a_max.scmd). The original script are available under license GLP v3 or later. Modifications in these files were made by me, to fit the purpose of this repository. These modifications are restricted to the same license as the original script.
- The port of Version 7 UNIX to the x86 architecture was performed by [Robert Nordier](https://www.nordier.com/). These modifications are released under the simplified BSD license. For more information on all aspects of the distribution, read [this file](v7_x86/LICENSE).
- All my contributions and modifications `(except for material that requires redistribution under the same license, such as the running scripts)` are available in this repository under the BSD-3-Clause [license](LICENSE).

<hr>
<hr>

## Running UNIX

### Section 1

#### Requeriments

You will need the following tools and utilities to run the available UNIX versions:

<div align="center">

![gnu_bash](https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white)
![git](https://img.shields.io/badge/Git-8117EB?style=for-the-badge&logo=git&logoColor=white)
![wget](https://img.shields.io/badge/wget-0077B5?style=for-the-badge&logo=wget&logoColor=white)
![python](https://img.shields.io/badge/Python-8419D1?style=for-the-badge&logo=Python&logoColor=white)
![qemu](https://img.shields.io/badge/Qemu-0A0A0A?style=for-the-badge&logo=qemu&logoColor=white)
![simh](https://img.shields.io/badge/SIMH-DE2218?style=for-the-badge&logo=SIMH&logoColor=white)

</div>

First of all, you must have the `PDP-11 Simulator` (SIMH), `qemu`, `GNU bash`, `Python`, `wget` and `git` installed on your device. If you already have them installed, skip to [section 2](#section-2).

> To install on Debian, Ubuntu, Pop!_OS and derivatives, use:

```
sudo apt install simh qemu qemu-system-i386 git wget python
```

> To install on Fedora and derivatives, use:

```
sudo dnf install simh qemu qemu-system-i386 git wget python
```

> To install on FreeBSD, use (for FreeBSD, installing GNU bash is also required. This shell is not normally installed in a default installation. Installation of GNU bash is not required on Linux systems, where bash is already installed by default):

```
su root # <= Enter your password to login as root user
pkg install simh bash qemu git wget python
```

> To install on NetBSD, use (for NetBSD, installing GNU bash is also required. This shell is not normally installed in a default installation. Installation of GNU bash is not required on Linux systems, where bash is already installed by default):

```
su root # <= Enter your password to login as root user
pkgin install simh bash qemu git wget python
```

> To install on OpenBSD, use (for OpenBSD, installing GNU bash is also required. This shell is not normally installed in a default installation. Installation of GNU bash is not required on Linux systems, where bash is already installed by default):

```
su root # <= Enter your password to login as root user
pkg_add simh bash qemu git wget python
```

After installation, proceed to [section 2](#section-2).

<hr>

### Section 2

You must clone this repository to your computer. For that, use:

```
git clone https://github.com/felipenlunkes/run-ancient-unix
cd run-ancient-unix
```

After cloning the repository with the configuration files, you must populate the directories of each UNIX version with their respective image files. For that, go to the [next section](#section-3).

<hr>

### Section 3

Now, you have to run the available `run.sh` script. For that, use:

```
chmod +x run.sh
./run.sh
```

First, you have to run the script and select the option to install system images. You will see the following screen:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 
```

In this case, you should select option `7`, which will install the system images. After pressing 7, press ENTER to make your choice effective. Wait for the process of obtaining, extracting, configuring and installing the images.

After the installation is complete, you must run `run.sh` again to start a UNIX version.

When running the script, you will be asked to choose one of the available UNIX versions. After typing only the number relative to the choice, press ENTER to make your decision effective. Then wait for the desired version to run.

Now, you need to know peculiarities in the execution of each version of the system. For this, go to [section 4](#section-4).

<hr>

### Section 4

Select the desired UNIX version option below for details on how to start and operate the system. Each version of UNIX has different boot procedures. Pay attention to each particularity.

<details title="Particularities for Version 1 UNIX" align='left'>
<summary align='left'>Particularities for Version 1 UNIX</summary>

#### Particularities for Version 1 UNIX

After the start of execution after selecting v1 version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 1

PDP-11 simulator V3.8-1
Disabling CR
Disabling XQ
RF: buffering file in memory
TC0: 16b format, buffering file in memory

:login: 
```

Just type `root`, in lower case, and press ENTER. You will immediately be taken to the UNIX v1 shell.

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

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

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the `simh>` prompt appears on the screen.

</details>

<details title="Particularities for Version 5 UNIX" align='left'>
<summary align='left'>Particularities for Version 5 UNIX</summary>

#### Particularities for Version 5 UNIX

After the start of execution after selecting v5 version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 2

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
@
```

To start UNIX, you must type `unix` and press ENTER after the @ character, without spaces and in lower case. After pressing ENTER, UNIX will load and you will be taken to a login screen as below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

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

You must then type `root` and press ENTER. You will then be taken to the shell and be able to use the system. See below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

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

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the `simh>` prompt appears on the screen.

</details>

<details title="Particularities for Version 7 UNIX" align='left'>
<summary align='left'>Particularities for Version 7 UNIX</summary>

#### Particularities for Version 7 UNIX

After the start of execution after selecting v7 version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 3

PDP-11 simulator V3.8-1
Disabling XQ
Logging to file "simh_dl0.log"
Listening on port 5671 (socket 5)
Listening on port 5672 (socket 7)
Modem control activated
```

After seeing the screen above, you must type `boot` in lower case and press ENTER. You will see the screen below after that:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

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

After the appearance of `:`, you must type, without spaces and in lower case, the command `hp(0,0)unix` and press ENTER, as below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

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

Pressing ENTER will immediately take you to the UNIX v7 shell.

- [x] To enter multiuser mode and access all system functions, press CTRL-D. Afterwards, provide `root` as username and password. You will again be taken to the UNIX v7 shell, as below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

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

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the `simh>` prompt appears on the screen.

</details>

<details title="Particularities for 2.11BSD UNIX" align='left'>
<summary align='left'>Particularities for 2.11BSD UNIX</summary>

#### Particularities for 2.11BSD UNIX

After the start of execution after selecting 2.11BSD UNIX version, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 4

PDP-11 simulator V3.8-1
Listening on port 4000 (socket 4)
Modem control activated
Auto disconnect activated
211bsd.simh> attach xq eth0
File open error
Disabling CR

73Boot from ra(0,0,0) at 0172150
: 
```

You can just press ENTER when you see the screen to start UNIX. Afterwards, you will see the following screen:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 4

PDP-11 simulator V3.8-1
Listening on port 4000 (socket 4)
Modem control activated
Auto disconnect activated
211bsd.simh> attach xq eth0
File open error
Disabling CR

73Boot from ra(0,0,0) at 0172150
: 
: ra(0,0,0)unix
Boot: bootdev=02400 bootcsr=0172150

2.11 BSD UNIX #1: Fri Jun 9 08:42:54 PDT 1995
    root@SSU-64EN137:/usr/src/sys/SYSTEM

ra0: Ver 3 mod 3
ra0: RD54  size=311200
attaching qe0 csr 174440
qe0: DEC DELQA addr 00:50:56:01:01:01
attaching lo0

phys mem  = 3145728
avail mem = 1737664
user mem  = 307200

June  9 12:21:04 init: configure system

dz 0 csr 160100 vector 300 attached
ra 0 csr 172150 vector 154 vectorset attached
ts 0 csr 172520 vector 224 attached
erase, kill ^U, intr ^C
# 
```

The `#` symbol indicates that the shell is ready to receive commands. Try using `uname -a` or `ls` to get started.

- [x] To enter multiuser mode and access all system functions, press CTRL-D. Afterwards, provide `root` as username and password. You will again be taken to the 2.11BSD shell.

To end the simulation, press CTRL-E followed by CTRL-C or by typing quit when the `simh>` prompt appears on the screen.

</details>

<details title="Particularities for Version 7 UNIX for x86" align='left'>
<summary align='left'>Particularities for Version 7 UNIX for x86</summary>

#### Particularities for Version 7 UNIX for x86

After the start of execution after selecting v7 UNIX for x86, you will see a screen like below:

```
You must select, from the list below, which edition/version of
UNIX you want to start. The available options are:

1) v1 UNIX
2) v5 UNIX
3) v7 UNIX
4) 2.11BSD UNIX
5) v7 UNIX for x86
6) Clear temporary files
7) Install the disk images for UNIX

Select a number and press <ENTER>: 5
```

Upon selection, `qemu` will automatically start with the Version 7 UNIX for x86 disk image. After the initial boot, you will see the following screen:

<p align="center">
<img src="https://github.com/felipenlunkes/run-ancient-unix/blob/main/doc/qemu1.png" width="600" height="500">
</p>

Then press ENTER to load and start UNIX. After pressing ENTER, you will see the following screen, and you will be able to interact with the Version 7 UNIX shell:

<p align="center">
<img src="https://github.com/felipenlunkes/run-ancient-unix/blob/main/doc/qemu2.png" width="600" height="500">
</p>

- [x] To enter multiuser mode and access all system functions, press CTRL-D. Afterwards, provide `root` as username and `password` as password. You will again be taken to the Version 7 UNIX shell.

</details>

When you are finished running the system on the PDP-11 simulator, you can clean up temporary and log files that may have been created by SIMH. To do so, go to [section 5](#section-5).

<hr>

### Section 5

The simulator can create temporary and log files to simulate peripheral devices that would be connected to a PDP-11 minicomputer. These files typically have `.log` and `.dat` extensions. You can remove these files using the `run.sh` script and selecting the cleanup temporary files option, as well as manually going into each system directory and entering, in your system shell:

```
cd UNIX_VERSION_DIRECTORY
rm *.log *.dat
cd ..
```

</div>
