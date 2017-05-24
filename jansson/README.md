Prerequisites
==============

Get jansson 2.7 sources :
   git clone https://github.com/akheron/jansson.git -b v2.7


Jansson needs CMake to generate the Visual Studio solutions and projects.

CMake can be downloaded from:
   https://cmake.org/

Once CMake installed, you can create Visual studio project files from the command line:

   cd jansson
   md build
   cd build
   cmake -G "Visual Studio 12 2013 Win64" -DJANSSON_BUILD_DOCS=OFF ..

To build from Visual Studio:

* Open armadito-windows-dependencies\jansson\jansson\jansson.sln
* Build Solution in Visual Studio

To build from command line and create distribution:

   makedist.bat

Note: as makedist.bat calls msbuild, this batch file must be launched
from "Developer Command Prompt for VSxxxx" (command prompt for Visual
Studio that has the right build environment)


