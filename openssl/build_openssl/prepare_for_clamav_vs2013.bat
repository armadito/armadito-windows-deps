REM -- Prepare openssl before clamav building - VS2013

set OPENSSL_VERSION=1.0.1p

mkdir ..\out\include\32bit\openssl
xcopy /Y /I ..\src\openssl-%OPENSSL_VERSION%-32bit-release-DLL-VS2013\include\openssl\*.h ..\out\include\32bit\openssl

mkdir ..\out\include\64bit\openssl
xcopy /Y /I ..\src\openssl-%OPENSSL_VERSION%-64bit-release-DLL-VS2013\include\openssl\*.h ..\out\include\64bit\openssl

mkdir ..\out\lib\32bit\
xcopy /Y /I ..\src\openssl-%OPENSSL_VERSION%-32bit-release-DLL-VS2013\lib\*.lib ..\out\lib\32bit\

mkdir ..\out\lib\64bit\
xcopy /Y /I ..\src\openssl-%OPENSSL_VERSION%-64bit-release-DLL-VS2013\lib\*.lib ..\out\lib\64bit\