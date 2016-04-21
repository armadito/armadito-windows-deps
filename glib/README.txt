To build glib, you need an additional dependency:
libintl-0.14.4-lib.zip
which can be downloaded from:
http://gnuwin32.sourceforge.net/packages/libintl.htm
The package that has to be downloaded is the "Developer files":
http://gnuwin32.sourceforge.net/downlinks/libintl-lib-zip.php

Once downloaded it must be extracted into:
vs12\Win32
so that the tree is the following:
VS12
└───Win32
    ├───include
    │       libintl.h
    │
    ├───lib
    │       libintl-bcc.lib
    │       libintl.def
    │       libintl.dll.a
    │       libintl.lib
    │
    ├───manifest
    │       ...
    │
    └───share
        └───gettext
            │   gettext.h
            │
            └───intl
                    *.h

Once extracted, copy lib\libintl.lib to lib\intl.lib. This is needed for linking the glib
