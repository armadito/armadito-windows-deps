del /q deps.zip
rmdir /q /s deps
mkdir deps
pause

mkdir deps\json-c\include
xcopy /Y /I json-c\include\*.h deps\json-c\include
mkdir deps\json-c\lib
xcopy /Y /I json-c\lib deps\json-c\lib 

7z a -r -tzip deps.zip deps
