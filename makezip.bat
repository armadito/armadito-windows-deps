del /q deps.zip
rmdir /q /s deps
mkdir deps
pause

mkdir deps\json-c\include
xcopy /Y /I json-c\include\*.h deps\json-c\include
mkdir deps\json-c\lib
xcopy /Y /I json-c\lib deps\json-c\lib 

mkdir deps\libopenssl\include\32bit
xcopy /Y /I openssl\src\openssl-1.0.1p-32bit-release-DLL-VS2013\include\openssl\*.h deps\libopenssl\include\32bit

mkdir deps\libopenssl\include\64bit
xcopy /Y /I openssl\src\openssl-1.0.1p-64bit-release-DLL-VS2013\include\openssl\*.h deps\libopenssl\include\64bit

mkdir deps\libopenssl\lib\32bit
xcopy /Y /I openssl\src\openssl-1.0.1p-32bit-release-DLL-VS2013\bin\*.dll deps\libopenssl\lib\32bit 

mkdir deps\libopenssl\lib\64bit
xcopy /Y /I openssl\src\openssl-1.0.1p-64bit-release-DLL-VS2013\bin\*.dll deps\libopenssl\lib\64bit 

7z a -r -tzip deps.zip deps
