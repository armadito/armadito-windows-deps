del /q deps.zip
rmdir /q /s deps
mkdir deps
pause

REM copy the json-c tree
mkdir deps\json-c\include
xcopy /Y /I json-c\include\*.h deps\json-c\include
mkdir deps\json-c\lib
xcopy /Y /I json-c\lib deps\json-c\lib 

REM copy the openssl tree
mkdir deps\libopenssl\include\32bit\openssl
xcopy /Y /I openssl\src\openssl-1.0.1p-32bit-release-DLL-VS2013\include\openssl\*.h deps\libopenssl\include\32bit\openssl
mkdir deps\libopenssl\include\64bit\openssl
xcopy /Y /I openssl\src\openssl-1.0.1p-64bit-release-DLL-VS2013\include\openssl\*.h deps\libopenssl\include\64bit\openssl
mkdir deps\libopenssl\lib\32bit
xcopy /Y /I openssl\src\openssl-1.0.1p-32bit-release-DLL-VS2013\bin\*.dll deps\libopenssl\lib\32bit 
mkdir deps\libopenssl\lib\64bit
xcopy /Y /I openssl\src\openssl-1.0.1p-64bit-release-DLL-VS2013\bin\*.dll deps\libopenssl\lib\64bit 

REM copy the libclamav tree
mkdir deps\libclamav\lib\32bit
xcopy /Y /I clamav\clamav-devel\win32\Win32\Debug\libclamav.dll deps\libclamav\lib\32bit
xcopy /Y /I clamav\clamav-devel\win32\Win32\Debug\libclamav.lib deps\libclamav\lib\32bit

mkdir deps\libclamav\include
xcopy /Y /I clamav\clamav-devel\libclamav\*.h deps\libclamav\include

REM copy the glib tree (thanks bash and awk for the generation ;-)
REM find glib/vs12 -type d | awk '{gsub("/", "\\", $1); printf("mkdir %s\nxcopy /Y /I %s\\* deps\\%s\n", $1, $1, $1);}'
mkdir glib\vs12
mkdir glib\vs12\Win32
mkdir glib\vs12\Win32\bin
xcopy /Y /I glib\vs12\Win32\bin\* deps\glib\vs12\Win32\bin
mkdir glib\vs12\Win32\include
xcopy /Y /I glib\vs12\Win32\include\* deps\glib\vs12\Win32\include
mkdir glib\vs12\Win32\include\gio-win32-2.0
xcopy /Y /I glib\vs12\Win32\include\gio-win32-2.0\* deps\glib\vs12\Win32\include\gio-win32-2.0
mkdir glib\vs12\Win32\include\gio-win32-2.0\gio
xcopy /Y /I glib\vs12\Win32\include\gio-win32-2.0\gio\* deps\glib\vs12\Win32\include\gio-win32-2.0\gio
mkdir glib\vs12\Win32\include\glib-2.0
xcopy /Y /I glib\vs12\Win32\include\glib-2.0\* deps\glib\vs12\Win32\include\glib-2.0
mkdir glib\vs12\Win32\include\glib-2.0\gio
xcopy /Y /I glib\vs12\Win32\include\glib-2.0\gio\* deps\glib\vs12\Win32\include\glib-2.0\gio
mkdir glib\vs12\Win32\include\glib-2.0\glib
xcopy /Y /I glib\vs12\Win32\include\glib-2.0\glib\* deps\glib\vs12\Win32\include\glib-2.0\glib
mkdir glib\vs12\Win32\include\glib-2.0\glib\deprecated
xcopy /Y /I glib\vs12\Win32\include\glib-2.0\glib\deprecated\* deps\glib\vs12\Win32\include\glib-2.0\glib\deprecated
mkdir glib\vs12\Win32\include\glib-2.0\gobject
xcopy /Y /I glib\vs12\Win32\include\glib-2.0\gobject\* deps\glib\vs12\Win32\include\glib-2.0\gobject
mkdir glib\vs12\Win32\lib
xcopy /Y /I glib\vs12\Win32\lib\* deps\glib\vs12\Win32\lib
mkdir glib\vs12\Win32\lib\glib-2.0
xcopy /Y /I glib\vs12\Win32\lib\glib-2.0\* deps\glib\vs12\Win32\lib\glib-2.0
mkdir glib\vs12\Win32\lib\glib-2.0\include
xcopy /Y /I glib\vs12\Win32\lib\glib-2.0\include\* deps\glib\vs12\Win32\lib\glib-2.0\include
mkdir glib\vs12\Win32\lib\pkgconfig
xcopy /Y /I glib\vs12\Win32\lib\pkgconfig\* deps\glib\vs12\Win32\lib\pkgconfig
mkdir glib\vs12\Win32\manifest
xcopy /Y /I glib\vs12\Win32\manifest\* deps\glib\vs12\Win32\manifest
mkdir glib\vs12\Win32\share
xcopy /Y /I glib\vs12\Win32\share\* deps\glib\vs12\Win32\share
mkdir glib\vs12\Win32\share\gettext
xcopy /Y /I glib\vs12\Win32\share\gettext\* deps\glib\vs12\Win32\share\gettext
mkdir glib\vs12\Win32\share\gettext\intl
xcopy /Y /I glib\vs12\Win32\share\gettext\intl\* deps\glib\vs12\Win32\share\gettext\intl
mkdir glib\vs12\Win32\share\glib-2.0
xcopy /Y /I glib\vs12\Win32\share\glib-2.0\* deps\glib\vs12\Win32\share\glib-2.0
mkdir glib\vs12\Win32\share\glib-2.0\codegen
xcopy /Y /I glib\vs12\Win32\share\glib-2.0\codegen\* deps\glib\vs12\Win32\share\glib-2.0\codegen
mkdir glib\vs12\Win32\share\glib-2.0\schemas
xcopy /Y /I glib\vs12\Win32\share\glib-2.0\schemas\* deps\glib\vs12\Win32\share\glib-2.0\schemas

REM Add prebuilt libraries : libintl, libiconv and pcre dll.
mkdir deps\libintl\lib
xcopy /Y /I libintl\libintl3.dll deps\libintl\lib
mkdir deps\libiconv\lib
xcopy /Y /I libiconv\libiconv2.dll deps\libiconv\lib
mkdir deps\pcre\lib
xcopy /Y /I pcre\pcre3.dll deps\pcre\lib

7z a -r -tzip deps.zip deps
