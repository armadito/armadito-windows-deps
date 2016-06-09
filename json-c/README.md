Instructions 
============

To build from Visual Studio:
1. Open armadito-windows-dependencies\json-c\json-c-master-2016-04-21\json-c.vcxproj
2. Build Solution in Visual Studio

To build from command line and create distribution:
1. Call makedist.bat

Note: as makedist.bat calls msbuild, this batch file must be launched from "Developer Command Prompt for VSxxxx" (command prompt for Visual Studio that has the right build environment)

Note : If you want to upgrade json-c sources here, you need to apply linkhash_C_build.patch. 
Warning : Don't forget to call makedist.bat if you make any modifications inside json-c-master-2016-04-21.