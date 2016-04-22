Introduction
============

An amazing work has been done by Gerson Kurz about compilation of openssl with Visual Studio. This tutorial is mostly based on his work.
Thanks to him. If you got some trouble about this tutorial, please refer to :
 http://p-nand-q.com/programming/windows/building_openssl_with_visual_studio_2013.html
  
Prerequisites
=============

Windows with Visual Studio 2010, 2013 or 2015 installed
Python 2.7 or 3.x installed in your PATH
7-zip installed

Instructions
============

You need to Python 2.7 or 3.5 installed and on your PATH.

Download openssl sources tarball tar.gz file in C:\\<...>\\armadito-windows-dependencies\\openssl\\src.

Note: It has been tested with 1.0.1p actually. You are free to try other versions anyway. 
If you want to compile openssl versions 1.0.2X, you need to uncomment following line multiple times in rebuild_*.cmd file : "call ms\do_nasm.bat".

Create a virtual drive as following for example :
  subst T: C:\\<...>\\armadito-windows-dependencies\\openssl\\src

Later on, to remove T drive : 
  subst T: /D
  
Set openssl version in build_openssl\rebuild_openssl_vsXXXX.cmd 
Then, check for 7-zip and Visual Studio paths in this same file.
 
Finally, open a file explorer and just double click on selected rebuild_openssl_vsXXXX.cmd script. "Great fun !", Gerson.
  