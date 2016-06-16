Prerequisites
==============

Get clamav 0.98.7 sources :
   git clone https://github.com/vrtadmin/clamav-devel.git -b 0.98.7

Clamav need openssl to be compiled, it means that you have to build openssl from armadito-dependencies\openssl before building clamav.

Now, in order to configure Libclamav Visual Studio project, you have to execute a6o_patch_clamav.pl patch script.
Thus, the next Libclamav build will use your recently builded openssl from armadito-windows-dependencies. You need perl installed in your PATH. 

WARNING: before launching the perl script, you must adjust the openssl version that is defined in the script. Current version is 1.0.1t

To do so :

   $ cd armadito-windows-dependencies\clamav
   $ perl a6o_patch_clamav.pl

If you want to build on VS2013, you may need to apply an other patch :
 
   $ cd armadito-windows-dependencies\clamav\clamav-devel
   $ git apply ..\git-patches\vs2013_min_max_fix.patch
   
Clamav bugfixes : 
   $ cd armadito-windows-dependencies\clamav\clamav-devel
   $ git apply ..\git-patches\fix_system32_crash.patch
   $ git apply ..\git-patches\fix_reload_clamav.patch
   $ git apply ..\git-patches\fix_pdf_clamav.patch
   $ git apply ..\git-patches\fix_isspace_crash.patch
   
To apply all patches in one shot (tested on cygwin) :
   $ cd armadito-windows-dependencies\clamav\clamav-devel
   $ git apply ..\git-patches\*.patch

WARNING: git for windows may give errors when applying patches and complaining about "trailing whitespace". In this case, use the following command line:
   $ git apply --whitespace=strip <<patch files>>

Build Instructions
==================

Run the configure.bat script from within the git shell :
   
   $ cd armadito-windows-dependencies/clamav/clamav-devel/win32
   $ configure.bat

Open armadito-dependencies\clamav\clamav-devel\win32\libclamav.vcxproj with your Visual Studio.
If your version of Visual Studio is > VS2010, you will have to accept upgrading all projects.
To upgrade manually from VS2010 to VS2013, you can right click on clamav solution and select "Retarget Solution".

You can now set libclamav project build configuration to Debug or Release and build platform to Win32 or x64.

Finally, you can build libclamav project from Visual Studio. 

If successful, libclamav.dll will be created in armadito-windows-dependencies\clamav\clamav-devel\win32\$(Platform)\$(Configuration)
where Platform is Win32 or x64
and Configuration is Debug or Release

  