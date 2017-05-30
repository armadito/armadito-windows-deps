Prerequisites
==============

Get YARA 3.6.0 sources:

    git clone https://github.com/VirusTotal/yara.git -b v3.6.0


YARA needs VisualStudio >= 2015 to compile.

To build from Visual Studio:

* open yara/windows/vs2015/yara.sln
* build solution

To build from command line and create distribution:

   makedist.bat

Note: as makedist.bat calls msbuild, this batch file must be launched
from "Developer Command Prompt for VSxxxx" (command prompt for Visual
Studio that has the right build environment)
