# salome-arch-installer

## Introduction
An installer script for Salome Platform for Arch Linux.

[Salome](https://www.salome-platform.org/), The Open Source Integration Platform for Numerical Simulation, is an open-source software that provides a generic Pre- and Post-Processing platform for numerical simulation. It is based on an open and flexible architecture made of reusable components.

Salome is available on the [AUR](https://aur.archlinux.org/packages/?K=salome), but unfortunately most packages are out of date, and very cumbersome and time consuming to compile.

On the other hand, the Salome website offers an universal Linux precompiled binary that does not install right away on Arch Linux. This script was born to run the universal Salome installer on Arch Linux successfully.

## Prerequisites
The universal salome installer only support 64 bit machines. Before installing, install the following pakages: python, python2 and gconf:
```bash
pacman -S python python2
```
gconf is available on the [AUR](https://aur.archlinux.org/packages/gconf/).

Then, clone this repo:
```bash
git clone https://github.com/CrocoDuckoDucks/salome-arch-installer.git
```
This will create the salome-arch-installer directory in the path in which you run the cloning command.

Then, go to the [Salome download page](https://www.salome-platform.org/downloads/current-version) and download the universal binary. Save it in the salome-arch-installer directory.

## Running the Installer
Navigate to the salome-arch-installer directory, ensure that installer.sh is executable and run it. This will install Salome in folder in your home directory called Salome-XYZ, where XYZ are the version numbers.

```bash
cd salome-arch-installer
chmod +x install.sh
./install.sh
```
## A Note About Tagged Versions
Every time I test this script with a certain version of Salome, and find it seems to work OK, I will tag a matching version. For example, the version 9.3.0 is tested on Salome 9.3.0.

## DISCLAIMER!
I am not able to assess whether Salome as installed with this script works 100% correctly. Use at your own risk!

