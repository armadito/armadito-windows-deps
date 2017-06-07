
call :buildAndCopy x64 Debug Debug_BundledPCRE
call :buildAndCopy x64 Release Release_BundledPCRE

goto :eof

:buildAndCopy
setlocal
set platform=%~1
set configuration=%~2
set pcre_configuration=%~3

set msvs=vs14

msbuild glib-2.47.92\build\win32\%msvs%\glib.sln /t:rebuild /p:Platform=%platform% /p:Configuration=%pcre_configuration%

if not exist %platform%\%configuration% mkdir %platform%\%configuration%
xcopy %msvs%\%platform%\bin %platform%\%configuration%\bin /D /S /I /Y
xcopy %msvs%\%platform%\lib %platform%\%configuration%\lib /D /S /I /Y
xcopy %msvs%\%platform%\include %platform%\%configuration%\include /D /S /I /Y
xcopy %msvs%\%platform%\manifest %platform%\%configuration%\manifest /D /S /I /Y
xcopy %msvs%\%platform%\share %platform%\%configuration%\share /D /S /I /Y
endlocal
goto :eof
