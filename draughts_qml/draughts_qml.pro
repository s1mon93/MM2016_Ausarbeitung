# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

QT += qml opengl quick multimedia

HEADERS += \
    src/gldefines.h \
    src/glitem.h \
    src/glbody.h \
    src/glpoint.h \
    src/glesrenderer.h \
    src/glcolorrgba.h \
    src/shaderdebugger.h \
    src/glsphere.h \
    src/glcube.h \
    src/gldisc.h \
    src/chessboard.h \
    src/glman.h \
    src/draughts.h \
    src/draughtsscene.h \
    src/soundengine.h

SOURCES += \
    src/main.cpp \
    src/glitem.cpp \
    src/glbody.cpp \
    src/glpoint.cpp \
    src/glesrenderer.cpp \
    src/glcolorrgba.cpp \
    src/shaderdebugger.cpp \
    src/glsphere.cpp \
    src/glcube.cpp \
    src/gldisc.cpp \
    src/chessboard.cpp \
    src/glman.cpp \
    src/draughts.cpp \
    src/draughtsscene.cpp \
    src/soundengine.cpp

RESOURCES += \
    resources.qrc

LIBS += -lopengl32

#linux{
# LIBS += -lplibjs
#}
