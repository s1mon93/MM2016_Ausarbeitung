#ifndef GLMAN_H
#define GLMAN_H

#include "glsphere.h"

class GlMan : public GLSphere
{
public:
    GlMan(float radius = 1.0, const GLColorRgba & color = GLColorRgba::clBlue, const QString textureFile = "",
          int m_stacks = 18, int m_slices = 36, double coneHeight = 4.0);

    void makeSurface(QVector<GLPoint> * pointContainer, QVector<GLuint> * indexContainer);
private:
    double m_coneHeight;
};

#endif // GLMAN_H
