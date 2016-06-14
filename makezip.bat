set VERSION=1.0.1
set OPENSSL_VERSION=1.0.1t

set ZIP_FILE=deps-%VERSION%.zip
rmdir /q /s deps
mkdir deps
del /q %ZIP_FILE%


call :copy_json Debug
call :copy_json Release
call :copy_glib Debug
call :copy_glib Release
call :copy_openssl 32 %OPENSSL_VERSION%
call :copy_openssl 64 %OPENSSL_VERSION%

7z a -r -tzip %ZIP_FILE% deps

goto :eof

REM copy the json-c tree
:copy_json
setlocal
set configuration=%~1
mkdir deps\json-c\%configuration%\include
xcopy /Y /I json-c\%configuration%\include\*.h deps\json-c\%configuration%\include
mkdir deps\json-c\%configuration%\lib
xcopy /Y /I json-c\%configuration%\lib deps\json-c\%configuration%\lib 
endlocal
goto :eof


REM copy the glib tree
:copy_glib
setlocal
set configuration=%~1
xcopy /Y /I glib\vs12\Win32\%configuration%\bin\* deps\glib\vs12\Win32\%configuration%\bin
xcopy /Y /I glib\vs12\Win32\%configuration%\include\* deps\glib\vs12\Win32\%configuration%\include
xcopy /Y /I glib\vs12\Win32\%configuration%\include\gio-win32-2.0\* deps\glib\vs12\Win32\%configuration%\include\gio-win32-2.0
xcopy /Y /I glib\vs12\Win32\%configuration%\include\gio-win32-2.0\gio\* deps\glib\vs12\Win32\%configuration%\include\gio-win32-2.0\gio
xcopy /Y /I glib\vs12\Win32\%configuration%\include\glib-2.0\* deps\glib\vs12\Win32\%configuration%\include\glib-2.0
xcopy /Y /I glib\vs12\Win32\%configuration%\include\glib-2.0\gio\* deps\glib\vs12\Win32\%configuration%\include\glib-2.0\gio
xcopy /Y /I glib\vs12\Win32\%configuration%\include\glib-2.0\glib\* deps\glib\vs12\Win32\%configuration%\include\glib-2.0\glib
xcopy /Y /I glib\vs12\Win32\%configuration%\include\glib-2.0\glib\deprecated\* deps\glib\vs12\Win32\%configuration%\include\glib-2.0\glib\deprecated
xcopy /Y /I glib\vs12\Win32\%configuration%\include\glib-2.0\gobject\* deps\glib\vs12\Win32\%configuration%\include\glib-2.0\gobject
xcopy /Y /I glib\vs12\Win32\%configuration%\lib\* deps\glib\vs12\Win32\%configuration%\lib
xcopy /Y /I glib\vs12\Win32\%configuration%\lib\glib-2.0\* deps\glib\vs12\Win32\%configuration%\lib\glib-2.0
xcopy /Y /I glib\vs12\Win32\%configuration%\lib\glib-2.0\include\* deps\glib\vs12\Win32\%configuration%\lib\glib-2.0\include
xcopy /Y /I glib\vs12\Win32\%configuration%\lib\pkgconfig\* deps\glib\vs12\Win32\%configuration%\lib\pkgconfig
xcopy /Y /I glib\vs12\Win32\%configuration%\manifest\* deps\glib\vs12\Win32\%configuration%\manifest
xcopy /Y /I glib\vs12\Win32\%configuration%\share\* deps\glib\vs12\Win32\%configuration%\share
xcopy /Y /I glib\vs12\Win32\%configuration%\share\gettext\* deps\glib\vs12\Win32\%configuration%\share\gettext
xcopy /Y /I glib\vs12\Win32\%configuration%\share\gettext\intl\* deps\glib\vs12\Win32\%configuration%\share\gettext\intl
xcopy /Y /I glib\vs12\Win32\%configuration%\share\glib-2.0\* deps\glib\vs12\Win32\%configuration%\share\glib-2.0
xcopy /Y /I glib\vs12\Win32\%configuration%\share\glib-2.0\codegen\* deps\glib\vs12\Win32\%configuration%\share\glib-2.0\codegen
xcopy /Y /I glib\vs12\Win32\%configuration%\share\glib-2.0\schemas\* deps\glib\vs12\Win32\%configuration%\share\glib-2.0\schemas
endlocal
goto :eof

REM copy the openssl tree
:copy_openssl
setlocal
set bits=%~1
set version=%~2
mkdir deps\libopenssl\include\%bits%bit\openssl
xcopy /Y /I openssl\src\openssl-%version%-%bits%bit-release-DLL-VS2013\include\openssl\*.h deps\libopenssl\include\%bits%bit\openssl
mkdir deps\libopenssl\lib\%bits%bit
xcopy /Y /I openssl\src\openssl-%version%-%bits%bit-release-DLL-VS2013\bin\*.dll deps\libopenssl\lib\%bits%bit 
endlocal
goto :eof

REM copy the libclamav tree
mkdir deps\libclamav\lib\32bit
xcopy /Y /I clamav\clamav-devel\win32\Win32\Debug\libclamav.dll deps\libclamav\lib\32bit
xcopy /Y /I clamav\clamav-devel\win32\Win32\Debug\libclamav.lib deps\libclamav\lib\32bit

mkdir deps\libclamav\include
xcopy /Y /I clamav\clamav-devel\libclamav\*.h deps\libclamav\include

REM Add prebuilt libraries : libintl, libiconv and pcre dll.
mkdir deps\libintl\lib
xcopy /Y /I libintl\libintl3.dll deps\libintl\lib
mkdir deps\libiconv\lib
xcopy /Y /I libiconv\libiconv2.dll deps\libiconv\lib
mkdir deps\pcre\lib
xcopy /Y /I pcre\pcre3.dll deps\pcre\lib
