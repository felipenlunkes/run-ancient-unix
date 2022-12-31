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

run_211BSD()
{

cd "2.11BSD"

pdp11 211bsd.simh

clean

exit 

}

run_v7UNIX()
{

cd "v7"

pdp11 v7.simh

clean

exit 

}

run_v5UNIX()
{

cd "v5"

pdp11 v5.simh

clean 

exit 

}

run_v1UNIX()
{

cd "v1"

pdp11 v1.simh

clean

exit 

}

clean()
{

cd v1 

rm *.log *.dat

cd ..

cd v5

rm *.log *.dat

cd ..

cd v7 

rm *.log *.dat

cd ..

cd "2.11BSD"

rm *.log *.dat

cd ..

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
echo -e "Please wait while the UNIX disk images are installed locally. This process may take"
echo -e "a few minutes, depending on the speed of your internet connection."
echo 

mkdir -p temp 
cd temp

mkdir -p v5
mkdir -p v7 
mkdir -p "2.11BSD"

echo -e "\e[1;32m > Downloading v5 UNIX...\e[0m"

# v5

wget https://www.retro11.de/data/oc_w11/oskits/u5ed_rkset.tgz

echo -e "\e[1;32m > Unpacking v5 UNIX...\e[0m"

tar -xvzf u5ed_rkset.tgz -C v5/

# v7

echo -e "\e[1;32m > Downloading v7 UNIX...\e[0m"

wget https://www.retro11.de/data/oc_w11/oskits/u7ed_rpset.tgz

echo -e "\e[1;32m > Unpacking v5 UNIX...\e[0m"

tar -xvzf u7ed_rpset.tgz -C v7/

# 2.11BSD

echo -e "\e[1;32m > Downloading 2.11BSD UNIX...\e[0m"

wget https://www.retro11.de/data/oc_w11/oskits/211bsd_rpethset.tgz

echo -e "\e[1;32m > Unpacking 2.11BSD UNIX...\e[0m"

tar -xvzf 211bsd_rpethset.tgz -C "2.11BSD/"

# Install the images

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
cd ..

rm -R temp/

echo 
echo "\e[1;32m[Done]\e[0m"
echo 

exit 

}

export NAME=$0

clear

echo
echo -e "You must select, from the list below, which edition/version of"
echo -e "UNIX you want to start. The available options are:"
echo 
echo -e "1) v1 UNIX"
echo -e "2) v5 UNIX"
echo -e "3) v7 UNIX"
echo -e "4) 2.11BSD UNIX"
echo -e "5) Clear temporary files"
echo -e "6) Install the disk images for UNIX" 
echo 
echo -n "Select a number and press <ENTER>: "

read UNIXVERSION

case $UNIXVERSION in

1) run_v1UNIX; exit;;
2) run_v5UNIX; exit;;
3) run_v7UNIX; exit;;
4) run_211BSD; exit;;
5) clean; exit;;
6) install_images; exit;;

*) help; exit;;

esac 
