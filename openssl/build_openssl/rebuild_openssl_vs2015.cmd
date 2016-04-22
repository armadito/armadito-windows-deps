
T:
set OPENSSL_VERSION=1.0.1p
set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set VS2015="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\vcvars32.bat"
set VS2015_AMD64="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat"


REM Remove openssl source directories
IF NOT EXIST "T:\openssl-src-win32" GOTO NO_WIN32_SOURCE
DEL "T:\openssl-src-win32" /Q /F /S
RMDIR /S /Q "T:\openssl-src-win32"
:NO_WIN32_SOURCE

IF NOT EXIST "T:\openssl-src-win64" GOTO NO_WIN64_SOURCE
DEL "T:\openssl-src-win64" /Q /F /S
RMDIR /S /Q "T:\openssl-src-win64"
:NO_WIN64_SOURCE

IF NOT EXIST "T:\openssl-%OPENSSL_VERSION%" GOTO NO_OPENSSL_SOURCE
DEL "T:\openssl-%OPENSSL_VERSION%" /Q /F /S
RMDIR /S /Q "T:\openssl-%OPENSSL_VERSION%"
:NO_OPENSSL_SOURCE

del openssl-%OPENSSL_VERSION%.tar
%SEVENZIP% e openssl-%OPENSSL_VERSION%.tar.gz
%SEVENZIP% x openssl-%OPENSSL_VERSION%.tar
ren openssl-%OPENSSL_VERSION% openssl-src-win32-VS2015
%SEVENZIP% x openssl-%OPENSSL_VERSION%.tar
ren openssl-%OPENSSL_VERSION% openssl-src-win64-VS2015

CALL %VS2015%

cd \openssl-src-win32-VS2015
perl Configure VC-WIN32 --prefix=T:\openssl-%OPENSSL_VERSION%-32bit-release-DLL-VS2015
call ms\do_ms.bat
REM call ms\do_nasm.bat
nmake -f ms\ntdll.mak
nmake -f ms\ntdll.mak install

CALL %VS2015_AMD64%

cd \openssl-src-win64-VS2015
perl Configure VC-WIN64A --prefix=T:\openssl-%OPENSSL_VERSION%-64bit-release-DLL-VS2015
call ms\do_win64a.bat
nmake -f ms\ntdll.mak
nmake -f ms\ntdll.mak install