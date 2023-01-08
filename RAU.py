#!/usr/bin/python3

# Automated execution of UNIX systems, by Felipe Miguel Nery Lunkes
# Licenced under BSD-3-Clause
#
# Frontend for run.sh

from tkinter import *
import os

class RAU:

    def __init__(self, win):

        # Labels

        self.lbl1=Label(win, text='Ancient UNIX running tool')
        self.lbl2=Label(win, text='Select one of the options below to continue')
        self.lbl3=Label(win, text='Configuration options')
        self.lbl4=Label(win, text='Running options')

        # Buttons 

        self.btn0=Button(win, text='Run Version 1 UNIX for PDP-11', command=self.runV1UNIX)
        self.btn1=Button(win, text='Run Version 5 UNIX for PDP-11', command=self.runV5UNIX)
        self.btn2=Button(win, text='Run Version 7 UNIX for PDP-11', command=self.runV7UNIX)
        self.btn3=Button(win, text='Run 2.11BSD UNIX for PDP-11', command=self.run211BSD)
        self.btn4=Button(win, text='Run Version 7 UNIX for x86', command=self.runV7UNIXx86)
        self.btn5=Button(win, text='Install UNIX system images', command=self.installImages)
        self.btn6=Button(win, text="Clear temporary files", command=self.clearTemp)

        self.lbl1.place(x=170, y=5)
        self.lbl2.place(x=100, y=50)
        self.lbl3.place(x=180, y=100)

        self.btn5.place(x=10, y=140)
        self.btn6.place(x=250, y=140)

        self.lbl4.place(x=195, y=200)

        self.btn0.place(x=10, y=240)
        self.btn1.place(x=250, y=240)
        self.btn2.place(x=10, y=280)
        self.btn3.place(x=250, y=280)
        self.btn4.place(x=10, y=320)
        

    def runV1UNIX(self):
    
        print(" > Version 1 UNIX (PDP-11) was selected to run.")

        os.system("gnome-terminal -- bash -c './run.sh v1UNIX'")

        self.complete() 
    
    def runV5UNIX(self):

        print(" > Version 5 UNIX (PDP-11) was selected to run.")

        os.system("gnome-terminal -- bash -c './run.sh v5UNIX'")

        self.complete() 

    def runV7UNIX(self):

        print(" > Version 7 UNIX (PDP-11) was selected to run.")

        os.system("gnome-terminal -- bash -c './run.sh v7UNIX'")

        self.complete() 

    def run211BSD(self):
    
        print(" > 2.11BSD UNIX (PDP-11) was selected to run.")

        os.system("gnome-terminal -- bash -c './run.sh 211BSDUNIX'")

        self.complete() 

    def runV7UNIXx86(self):
    
        print(" > Version 7 UNIX (x86) was selected to run.")

        os.system("gnome-terminal -- bash -c './run.sh v7UNIXx86'")

        self.complete() 

    def installImages(self):

        print(" > Installing UNIX system images...")

        os.system("gnome-terminal -- bash -c './run.sh installUNIX'")

        self.complete() 
    
    def clearTemp(self):

        print(" > Clear temporary files.")

        os.system("gnome-terminal -- bash -c './run.sh clearTemp'")

        self.complete() 

    def complete(self):

        print("Request completed.\n")

# Main code

version='v0.3'
window=Tk()
RunAncientUNIX=RAU(window)
window.title('Run ancient UNIX '+version)
window.geometry("500x400+10+10")
print("\nRun ancient UNIX frontend "+version)
print("Copyright (C) 2023 Felipe Miguel Nery Lunkes")
print("All rights reserved.")
print("Licensed under BSD-3-Clause license")
print("\nWaiting for user interaction...")
window.mainloop()
print("Finished by user.")