
call :buildAndCopy Win32 Debug
call :buildAndCopy Win32 Release
call :buildAndCopy x64 Debug
call :buildAndCopy x64 Release
goto :eof

:buildAndCopy
setlocal
set platform=%~1
set configuration=%~2
msbuild json-c-master-2016-04-21\json-c.vcxproj /t:rebuild /p:Platform=%platform% /p:Configuration=%configuration%
if not exist %platform%\%configuration%\include mkdir %platform%\%configuration%\include
xcopy json-c-master-2016-04-21\*.h %platform%\%configuration%\include /D /I /Y
if not exist %platform%\%configuration%\lib mkdir %platform%\%configuration%\lib
if %platform% == Win32 (
	xcopy json-c-master-2016-04-21\%configuration%\json-c.lib %platform%\%configuration%\lib /D /I /Y 
) else (
	xcopy json-c-master-2016-04-21\%platform%\%configuration%\json-c.lib %platform%\%configuration%\lib /D /I /Y 
)
endlocal
goto :eof
