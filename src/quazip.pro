TEMPLATE = lib
CONFIG += qt warn_on
QT -= gui
DEPENDPATH += .
INCLUDEPATH += .

DEFINES += QUAZIP_BUILD
CONFIG(staticlib): DEFINES += QUAZIP_STATIC
#Windows XP compatability
DEFINES += "WINVER=0x0501"
DEFINES += "_WIN32_WINNT=0x0501"

win32 {
    ZLIBDIR = F:\Qt\5.5\Src\qtbase\src\3rdparty\zlib
}
INCLUDEPATH += $${ZLIBDIR}

# Input
HEADERS += \
    crypt.h\
    ioapi.h\
    JlCompress.h\
    quaadler32.h\
    quachecksum32.h\
    quacrc32.h\
    quazip.h\
    quazipfile.h\
    quazipfileinfo.h\
    quazipnewinfo.h\
    quazip_global.h\
    unzip.h\
    zip.h\

SOURCES += *.c *.cpp

unix:!symbian {
    headers.path=$$PREFIX/include/quazip
    headers.files=$$HEADERS
    target.path=$$PREFIX/lib
    INSTALLS += headers target

	OBJECTS_DIR=.obj
	MOC_DIR=.moc
	
}

win32 {
    headers.path=$$PREFIX/include/quazip
    headers.files=$$HEADERS
    target.path=$$PREFIX/lib
    INSTALLS += headers target

}
