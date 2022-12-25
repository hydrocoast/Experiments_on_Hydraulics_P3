# Experiments on Hydraulics P3 (Coastal Engineering)  
## Outlines  
[Here](/README.md) for the Japanese version  
This repository contains the materials for the assignments of P3 (Coastal Engineering), which is a part of the class "Experiments on Hydraulics" in the Undergraduate School of Civil, Environmental and Resources Engineering, Faculty of Engineering, Kyoto University.  
Please refer to the guidance materials distributed to students and the instruction document for general information on this class and other assignments.  

You may use it for any purpose other than the class under the MIT license.  
However, please note that this repository deliberately contains incomplete codes in some parts because of students' assignments.  

This repository is intended for use on a terminal in Linux-based OS, Mac OS, or WSL2 (Windows Subsystem for Linux 2) on Windows.  


## Contents
- [Test](/test): test the environment on your computer  
- [Exercise 1](/ex_small_amplitude_waves): small wave amplitude theory  
- [Exercise 2](/ex_waveeq_1d): 1D wave equation with a constant wave speed
- [Exercise 3](/ex_longwave_1d): long wave run-up on a slope and wave shoaling


## Requirements
- GNU Make (Makefile)
- gfortran or any other Fortran compiler
- gnuplot v5.0 or later version


## Usage
Download and unzip the `*.zip` or `*.tar.gz` file from the Releases page.  
**The same material as this repository will be distributed in PandA for students enrolled in this class, so there is no need to download it additionally.**
If you have a GitHub account, you can fork this repository and git clone it to manage the version in your development environment.
```shell
git clone git@github.com:username/repositoryname
```
```shell
git clone https://github.com/username/repositoryname
```


## Notes
Please do not post anything including solutions to Issues or send pull requests.  
Any bug reports to Issues would be appreciated.  
For questions not related to this assignment, please refer to the contact information in the guidance material and the instruction document.  

## Examples
<p align="center">
<img src="/fig/wave1d_bc_comparison.gif", width="400">
<img src="/fig/ex_longwave.gif", width="400">
</p>


## License
[MIT](/LICENSE)

## Author
Takuya Miyashita (miyashita.takuya.4w $AT$ kyoto-u.ac.jp)  
Disaster Prevention Research Institute, Kyoto University  
Latest update: 2022 September