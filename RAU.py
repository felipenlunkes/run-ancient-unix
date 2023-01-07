#!/usr/bin/python3

# Automated execution of UNIX systems, by Felipe Miguel Nery Lunkes
# Licenced under BSD-3-Clause
#
# Frontend for run.sh

from tkinter import *
import os

class RAU:

    def __init__(self, win):

# TODO :labels for runnig and config options

        self.lbl1=Label(win, text='Ancient UNIX running tool')
        self.lbl2=Label(win, text='Select one of the options below to continue')

        self.lbl1.place(x=150, y=5)
        self.lbl2.place(x=100, y=50)

        self.botao0=Button(win, text='Run Version 1 UNIX for PDP-11', command=self.runV1UNIX)
        self.botao1=Button(win, text='Run Version 5 UNIX for PDP-11', command=self.runV5UNIX)
        self.botao2=Button(win, text='Run Version 7 UNIX for PDP-11', command=self.runV7UNIX)
        self.botao3=Button(win, text='Run 2.11BSD UNIX for PDP-11', command=self.run211BSD)
        self.botao4=Button(win, text='Run Version 7 UNIX for x86', command=self.runV7UNIXx86)
        self.botao5=Button(win, text='Install UNIX system images', command=self.installImages)
        self.botao6=Button(win, text="Clear temporary files", command=self.clearTemp)

        self.botao5.place(x=140, y=100)
        self.botao0.place(x=10, y=150)
        self.botao1.place(x=250, y=150)
        self.botao2.place(x=10, y=200)
        self.botao3.place(x=250, y=200)
        self.botao4.place(x=10, y=250)
        self.botao6.place(x=250, y=250)

    def runV1UNIX(self):
    
        os.system("gnome-terminal -- bash -c './run.sh v1UNIX'")

        self.terminar() 
    
    def runV5UNIX(self):

        os.system("gnome-terminal -- bash -c './run.sh v5UNIX'")

        self.terminar() 

    def runV7UNIX(self):

        os.system("gnome-terminal -- bash -c './run.sh v7UNIX'")

        self.terminar() 

    def run211BSD(self):
    
        os.system("gnome-terminal -- bash -c './run.sh 211BSDUNIX'")

        self.terminar() 

    def runV7UNIXx86(self):
    
        os.system("gnome-terminal -- bash -c './run.sh v7UNIXx86'")

        self.terminar() 

    def installImages(self):

        os.system("gnome-terminal -- bash -c './run.sh installUNIX'")

        self.terminar() 
    
    def clearTemp(self):

        os.system("gnome-terminal -- bash -c './run.sh clearTemp'")

        self.terminar() 

    def terminar(self):

        print("Request completed.\n")

# 

janela=Tk()
autobuild=RAU(janela)
janela.title('Run ancient UNIX v0.1')
janela.geometry("500x400+10+10")
print("\nRun ancient UNIX frontend v0.1")
print("Copyright (C) 2023 Felipe Miguel Nery Lunkes")
print("All rights reserved.")
print("\nWaiting for user interaction...")
janela.mainloop()
print("Finished by user.")
