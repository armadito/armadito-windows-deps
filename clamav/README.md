Prerequisites
==============

Get clamav 0.98.7 sources :
   git clone https://github.com/vrtadmin/clamav-devel.git -b 0.98.7

Clamav need openssl to be compiled, it means that you have to build openssl from armadito-dependencies\openssl before building clamav.

Now, in order to configure Libclamav Visual Studio project, you can apply patch clamav_openssl.patch.
Thus, the next Libclamav build will use your recently builded openssl from armadito-windows-dependencies.
To do so :
 
   $ cd armadito-windows-dependencies/clamav
   $ git apply clamav_openssl.patch
   
   
Build Instructions
==================

Open armadito-dependencies\clamav\clamav-devel\win32\libclamav.vcxproj with your Visual Studio.


