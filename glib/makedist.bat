msbuild glib-2.47.92\build\win32\vs12\glib.sln /t:rebuild /p:Configuration=Debug_BundledPCRE
call :copyOne Debug
msbuild glib-2.47.92\build\win32\vs12\glib.sln /t:rebuild /p:Configuration=Release_BundledPCRE
call :copyOne Release

goto :eof

:copyOne
setlocal
set configuration=%~1
if not exist vs12\Win32\%configuration% mkdir Win32\%configuration%
xcopy vs12\Win32\bin Win32\%configuration%\bin /D /S /I /Y
xcopy vs12\Win32\lib Win32\%configuration%\lib /D /S /I /Y
xcopy vs12\Win32\include Win32\%configuration%\include /D /S /I /Y
xcopy vs12\Win32\manifest Win32\%configuration%\manifest /D /S /I /Y
xcopy vs12\Win32\share Win32\%configuration%\share /D /S /I /Y
endlocal
goto :eof
