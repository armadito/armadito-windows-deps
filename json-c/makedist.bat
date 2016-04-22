if not exist "include" mkdir "include"
xcopy json-c-master-2016-04-21\*.h include /D /I /Y
if not exist "lib" mkdir "lib"
xcopy json-c-master-2016-04-21\Debug\json-c.lib lib /D /I /Y
