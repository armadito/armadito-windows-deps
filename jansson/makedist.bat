
call :buildAndCopy x64 Debug
call :buildAndCopy x64 Release
goto :eof

:buildAndCopy
setlocal
set platform=%~1
set configuration=%~2

msbuild jansson\build\jansson.vcxproj /t:rebuild /p:Platform=%platform% /p:Configuration=%configuration%

if not exist %platform%\%configuration%\include mkdir %platform%\%configuration%\include
xcopy jansson\build\include\*.h %platform%\%configuration%\include /D /I /Y

if not exist %platform%\%configuration%\lib mkdir %platform%\%configuration%\lib
if %configuration% == Debug (
   copy jansson\build\lib\%configuration%\jansson_d.lib %platform%\%configuration%\lib\jansson.lib
) else (
   copy jansson\build\lib\%configuration%\jansson.lib %platform%\%configuration%\lib\jansson.lib
)
endlocal
goto :eof
