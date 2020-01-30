-------------------------------------------------
#
# Project created by QtCreator 2018-08-09T10:01:48
#
#-------------------------------------------------

QT       += core gui widgets

TARGET = Player
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS QT_UI_USE GST_USE

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        main.cpp \
	player.cpp \
	mediaapp.cpp


	
HEADERS += \
	player.h \
	mediaapp.h 

	

#FORMS += \
#    devicestatus.ui \
#    setting.ui \
#    password.ui 

	
# Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin

target.path = /smrt/bin
!isEmpty(target.path): INSTALLS += target


INCLUDEPATH += $$PWD $$PWD/../ItLib/include 
DEPENDPATH += $$PWD/../ItLib/include 


message($$QMAKESPEC)

linux-g++-64 {

    message("linux-g++-64 config ( x86_64 )")
	
	LIBS += -L$$PWD/../ItLib/x86_64/lib/ -lit -L$$PWD/../ItLibSMRT/x86_64/lib/ -lsmrt -L$$PWD/../ItQLib/x86_64/lib/ -lItQLib
	
	INCLUDEPATH += /usr/include/gstreamer-1.0/ /usr/include/glib-2.0/ /usr/lib/x86_64-linux-gnu/glib-2.0/include /usr/lib/x86_64-linux-gnu/gstreamer-1.0/include/
	DEPENDPATH += /usr/include/gstreamer-1.0/ /usr/include/glib-2.0/ /usr/lib/x86_64-linux-gnu/glib-2.0/include /usr/lib/x86_64-linux-gnu/gstreamer-1.0/include/

	LIBS+=-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0

	################################################################
    QMAKE_POST_LINK = $$PWD/post_build_event.sh $$PWD $$OUT_PWD x86_64
}
else: linux-g++ {
################################################################
# Desktop - x86 compile
    message("linux-g++ config ( x86 )")

	LIBS += -L$$PWD/../ItLib/x86_64/lib/ -lit -L$$PWD/../ItLibSMRT/x86_64/lib/ -lsmrt -L$$PWD/../ItQLib/x86_64/lib/ -lItQLib

################################################################
# 빌드 후 이벤트 : post_build_event.sh $$PWD $$OUT_PWD
#   헤더파일 copy
    QMAKE_POST_LINK = $$PWD/post_build_event.sh $$PWD $$OUT_PWD x86_64
################################################################

#unix:!macx: LIBS += -L$$PWD/../../HitLib/x86/lib -litcmn
}

linux-oe-g++{
    message("linux-oe-g++ config")
    LIBS+=-lgstreamer-1.0

    CONFIG += silent
    CONFIG += link_pkgconfig

    PKGCONFIG += Qt5GStreamer-1.0 Qt5GStreamerUi-1.0
    QT += widgets
	
	INCLUDEPATH += $$PWD/../ItLib/include/linux 
	DEPENDPATH += $$PWD/../ItLib/include/linux 

	#LIBS += -L$$PWD/../ItLib/x86/lib/ -lit -L$$PWD/../ItLibSMRT/x86/lib/ -lsmrt
	LIBS += -L$$PWD/../ItLib/x86/lib/ -lit 


################################################################
# Qmake 수행시 Version.h 생성.
#	Gen Version.h
	system($$PWD/Version.sh $$PWD/Version.h.template $$PWD/Version.h)
	
################################################################

################################################################
# 링크 전 이벤트 
#	QMAKE_PRE_LINK = 

################################################################
# 빌드 후 이벤트 : post_build_event.sh $$PWD $$OUT_PWD
#   헤더파일 copy
	QMAKE_POST_LINK = $$PWD/post_build_event.sh $$PWD $$OUT_PWD x86
################################################################

}
else: linux {
    message("linux host config")

    CONFIG += silent
    CONFIG += link_pkgconfig

    contains(QT_VERSION, ^5\\..*) {
    message("qt5 - config")

    PKGCONFIG += Qt5GStreamer-1.0 Qt5GStreamerUi-1.0
    QT += widgets

	INCLUDEPATH += $$PWD/../ItLib/include/linux 
	DEPENDPATH += $$PWD/../ItLib/include/linux 

    INCLUDEPATH += /usr/include \
                   /usr/include/glib-2.0 \

}

DEFINES += QT_NO_KEYWORDS

#     PKGCONFIG += Qt5GStreamer-1.0 Qt5GStreamerUi-1.0
#                   /usr/include/gstreamer-1.0 \
#                   /usr/include/gstreamer-1.0/gst \
#                   /usr/include/Qt5GStreamer \
#                   /usr/include/Qt5GStreamer/QGlib \
#                   /usr/include/Qt5GStreamer/QGst \
#                   /usr/include/Qt5GStreamer/QGst/Ui \
#                   /usr/local/include \
#                   /usr/local/include/QtGStreamer \
#                   /usr/local/include/QtGStreamer/QGlib \
#                   /usr/local/include/QtGStreamer/QGst \
#                   /usr/local/include/QtGStreamer/QGst/Ui \
#                   /usr/lib/x86_64-linux-gnu/glib-2.0/include \
#                   /usr/lib/x86_64-linux-gnu/gstreamer-1.0/ \
#                   /home/kuku/gstreamer/libs/gst

#    LIBS += -L/usr/local/lib/ \
#            -L/usr/lib/x86_64-linux-gnu/gstreamer-1.0/ \
#            -L/home/kuku/gstreamer/libs/gst

#    LIBS += -lQt5GStreamer-1.0 \
#            -lQt5GStreamerUi-1.0 \
#            -lQt5GStreamerUtils-1.0
#            #-lgstreamer-1.0 \
#            -lgobject-2.0 \
#            -lglib-2.0 \
#            -lQtLib-2.0 \
}
win32 {
    message("win32 config")

	INCLUDEPATH += \
		$$PWD/../ItLib\include \
        $$PWD/../ItLibSMRT\include \ 
		$$PWD/../qt-gstreamer\src

    LIBS += -L$$PWD/../ItLib\x64\Debug  \
            -L$$PWD/../ItLibSMRT\x64\Debug \
            -L$$PWD/../qt-gstreamer\x64\Debug \

    LIBS += -lgstreamer-1.0 -lglib-2.0  \
			-lQt5GLib-2.0 -lQt5GStreamer-1.0 -lQt5GStreamerUi-1.0

#    LIBS += -lItLibSMRT \
            #-lItLib

#	GSTREAMER_1_0_ROOT_X86_64
	GSTREAMER_1_0_ROOT_X86_64 = $$(GSTREAMER_1_0_ROOT_X86_64)
	isEmpty(GSTREAMER_1_0_ROOT_X86_64) {
	  error("Please set GSTREAMER_1_0_ROOT_X86_64 to the location of the GStreamer-1.0 libraries")
	} else {
	  message(Using GStreamer from: $$GSTREAMER_1_0_ROOT_X86_64)
	}

	INCLUDEPATH += $$GSTREAMER_1_0_ROOT_X86_64/include
	LIBS += -L$${GSTREAMER_1_0_ROOT_X86_64}/lib

# 	Ensure that the BOOST_ROOT environment variable has been set
	BOOST_ROOT = $$(BOOST_ROOT)
	isEmpty(BOOST_ROOT) {
	  error("Please set BOOST_ROOT to the location of the Boost libraries")
	} else {
	  message(Using Boost from: $$BOOST_ROOT)
	}

	INCLUDEPATH += $$BOOST_ROOT
	LIBS += -L$${BOOST_ROOT}/stage/lib

################################################################
# Qmake 수행시 Version.h 생성.
#	Gen Version.h
	system($$PWD/Version.bat $$PWD/Version.h.template $$PWD/Version.h)
	
################################################################
# 링크 전 이벤트 
#	QMAKE_PRE_LINK = 

#    QMAKE_PRE_LINK = $$PWD/Version.bat $$PWD/Version.h.template $$PWD/Version.h
################################################################

################################################################
# 빌드 후 이벤트 : post_build_event.bat $$PWD $$OUT_PWD
#   헤더파일 copy
    QMAKE_POST_LINK = $$PWD/post_build_event.bat $$PWD $$OUT_PWD
################################################################


}
