
call :buildAndCopy x64 Debug
call :buildAndCopy x64 Release
goto :eof

:buildAndCopy
setlocal
set platform=%~1
set configuration=%~2

msbuild yara\windows\vs2015\libyara\libyara.vcxproj /t:rebuild /p:Platform=x64 /p:Configuration=Debug

REM if not exist %platform%\%configuration%\include mkdir %platform%\%configuration%\include
REM xcopy jansson\build\include\*.h %platform%\%configuration%\include /D /I /Y

REM if not exist %platform%\%configuration%\lib mkdir %platform%\%configuration%\lib
REM if %configuration% == Debug (
REM    copy jansson\build\lib\%configuration%\jansson_d.lib %platform%\%configuration%\lib\jansson.lib
REM ) else (
REM    copy jansson\build\lib\%configuration%\jansson.lib %platform%\%configuration%\lib\jansson.lib
REM )
endlocal
goto :eof




