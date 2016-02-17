#include <QApplication>
#include <QQmlApplicationEngine>

#include "draughtsscene.h"

/** @file
  * @mainpage
  * <b>A QML 2.0 and OpenGL ES2 example application tested on desktop.</b>
  * @author Walter Roth
  * \version   2.0
  * \date      2016
  * \copyright GNU Public License.
  * \pre       Check the system for QML >= 2.0, OpenGL 2.0 or OpenGLES 2.0

  *
  * OpenGL initialization requires a valid OpenGL context. Therefore, it *must not* be done in the
  * constructor of the GlItem. The GlItem class performs initialization on the first paint() call
  * and skips this code on following calls to paint() using an "initialized" flag.
  * Refer to the documentation of the GLItem class.
  *
  * The GLESRenderer class together with the vshader.vsh and fshader.fsh shaders is used as a
  * simplified replacement for the OpenGL fixed function pipeline.
  * It owns the modelview and projection matrix and viewport settings required for rendering. You
  * can use the predefined vshader.fsh or fshader.fsh shaders or write your own shaders for rendering.
  * The fshader.fsh supports masking of a circular area via uniforms u_maskCenteruniform and u_maskDiameterSquare.
  *
  * GLESRenderer also contains a set of convenience functions for mouse interaction.
  * This works fine on a touch screen.
  */

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    qmlRegisterType<DraughtsScene>("MM2016", 1, 0, "DraughtsScene");

    QQmlApplicationEngine qmlEngine;
    qmlEngine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));


    return app.exec();
}
