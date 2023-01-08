#!/bin/bash
#
#;; BSD 3-Clause License
#;;
#;; Copyright (c) 2022-2023, Felipe Miguel Nery Lunkes
#;; All rights reserved.
#;; 
#;; Redistribution and use in source and binary forms, with or without
#;; modification, are permitted provided that the following conditions are met:
#;; 
#;; 1. Redistributions of source code must retain the above copyright notice, this
#;;    list of conditions and the following disclaimer.
#;;
#;; 2. Redistributions in binary form must reproduce the above copyright notice,
#;;    this list of conditions and the following disclaimer in the documentation
#;;    and/or other materials provided with the distribution.
#;;
#;; 3. Neither the name of the copyright holder nor the names of its
#;;    contributors may be used to endorse or promote products derived from
#;;    this software without specific prior written permission.
#;; 
#;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#;; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#;; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#;; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

run_v7x86()
{

cd "v7_x86"

qemu-system-i386 -hda hd0.img 

cd ..

clean

exit 

}

run_211BSD()
{

cd "2.11BSD"

pdp11 211bsd.simh

cd ..

clean

exit 

}

run_v7UNIX()
{

cd "v7"

pdp11 v7.simh

cd ..

clean

exit 

}

run_v5UNIX()
{

cd "v5"

pdp11 v5.simh

cd ..

clean 

exit 

}

run_v1UNIX()
{

cd "v1"

pdp11 v1.simh

cd ..

clean

exit 

}

clean()
{

cd v1 

rm -rf *.log *.dat

cd ..

cd v5

rm -rf *.log *.dat

cd ..

cd v7 

rm -rf *.log *.dat

cd ..

cd "2.11BSD"

rm -rf *.log *.dat

cd ..

echo 
echo -e "\e[1;32m[Done]\e[0m"
echo 

exit 

}

help()
{

clear 

echo 
echo -e "You can use this script to start simulating older versions of UNIX."
echo -e "For this, you must select a version from the displayed list."
echo -e "To try, run this script ($NAME) again."
echo

exit

}

install_images()
{

clear 

echo 
echo -e "Please wait while the UNIX disk images are installed locally."
echo -e "This process may take a few minutes, depending on the speed of"
echo -e "your internet connection."
echo 

mkdir -p temp 
cd temp

mkdir -p v5
mkdir -p v7 
mkdir -p "2.11BSD"
mkdir -p "v7_x86"

echo -e "\e[1;32m > Downloading v5 UNIX...\e[0m"

# v5

wget -q https://www.retro11.de/data/oc_w11/oskits/u5ed_rkset.tgz

echo -e "\e[1;32m   > Unpacking v5 UNIX...\e[0m"

tar -xvzf u5ed_rkset.tgz -C v5/ >> /dev/null

# v7

echo
echo -e "\e[1;32m > Downloading v7 UNIX...\e[0m"

wget -q https://www.retro11.de/data/oc_w11/oskits/u7ed_rpset.tgz

echo -e "\e[1;32m   > Unpacking v7 UNIX...\e[0m"

tar -xvzf u7ed_rpset.tgz -C v7/ >> /dev/null

# 2.11BSD

echo
echo -e "\e[1;32m > Downloading 2.11BSD UNIX...\e[0m"

wget -q https://www.retro11.de/data/oc_w11/oskits/211bsd_rpethset.tgz

echo -e "\e[1;32m   > Unpacking 2.11BSD UNIX...\e[0m"
echo

tar -xvzf 211bsd_rpethset.tgz -C "2.11BSD/" >> /dev/null

# v7 UNIX for x86

echo -e "\e[1;32m > Downloading v7 UNIX for x86...\e[0m"

wget -q https://www.nordier.com/v7x86/v7x86-0.8a-all.tar.xz

echo -e "\e[1;32m   > Unpacking v7 UNIX for x86...\e[0m"
echo

tar xvf v7x86-0.8a-all.tar.xz -C "v7_x86/" >> /dev/null

cd "v7_x86"
cd v7x86-0.8a-all
cd releases
unzip v7x86-0.8a-vm.zip >> /dev/null
cd v7x86-0.8a-vm
cp hd0.img ../../../hd0.img
cd ..
cd ..
cd ..
cd ..
rm -Rf v7x86-0.8a-all

# Install the images

echo
echo -e "\e[1;32m > Installing v5 UNIX...\e[0m"

cd v5 

cp u5ed_rk.dsk ../../v5/v5.dsk 

cd ..

echo -e "\e[1;32m > Installing v7 UNIX...\e[0m"

cd v7

cp u7ed_rp.dsk ../../v7/v7.dsk 

cd ..

echo -e "\e[1;32m > Installing 2.11BSD UNIX...\e[0m"

cd "2.11BSD"

cp 211bsd_rpeth.dsk "../../2.11BSD/211bsd.dsk"

cd ..

echo -e "\e[1;32m > Installing v7 UNIX for x86...\e[0m"

cd "v7_x86"

cp hd0.img "../../v7_x86/hd0.img"

cd ..
cd ..


rm -Rf temp/

echo 
echo -e "\e[1;32m[Done]\e[0m"
echo 

exit 

}

init()
{

clear

echo
echo -e "You must select, from the list below, which edition/version of"
echo -e "UNIX you want to start. The available options are:"
echo 
echo -e "1) v1 UNIX"
echo -e "2) v5 UNIX"
echo -e "3) v7 UNIX"
echo -e "4) 2.11BSD UNIX"
echo -e "5) v7 UNIX for x86"
echo -e "6) Clear temporary files"
echo -e "7) Install the disk images for UNIX" 
echo 
echo -n "Select a number and press <ENTER>: "

read UNIXVERSION

case $UNIXVERSION in

1) run_v1UNIX; exit;;
2) run_v5UNIX; exit;;
3) run_v7UNIX; exit;;
4) run_211BSD; exit;;
5) run_v7x86; exit;;
6) clean; exit;;
7) install_images; exit;;

*) help; exit;;

esac 

}

export NAME=$0

case $1 in 

v1UNIX) run_v1UNIX; exit;;
v5UNIX) run_v5UNIX; exit;;
v7UNIX) run_v7UNIX; exit;;
211BSDUNIX) run_211BSD; exit;;
v7UNIXx86) run_v7x86; exit;;
installUNIX) install_images; exit;;
clearTemp) clean; exit;;

*) init; exit;;

esac 
