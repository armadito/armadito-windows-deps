
msbuild json-c-master-2016-04-21\json-c.vcxproj /t:rebuild /p:Configuration=Debug
call :copyOne Debug
msbuild json-c-master-2016-04-21\json-c.vcxproj /t:rebuild /p:Configuration=Release
call :copyOne Release
goto :eof

:copyOne
setlocal
set configuration=%~1
if not exist %configuration%\include mkdir %configuration%\include
xcopy json-c-master-2016-04-21\*.h %configuration%\include /D /I /Y
if not exist %configuration%\lib mkdir %configuration%\lib
xcopy json-c-master-2016-04-21\Debug\json-c.lib %configuration%\lib /D /I /Y
endlocal
goto :eof
