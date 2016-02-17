#ifndef GLCUBE_H
#define GLCUBE_H

#include "glbody.h"


#include <QVector3D>

/**
 * @brief The GlCube class creates a cube form llb to urf corners.
 */
class GlCube : public GLBody
{
public:
    /**
     * @brief GlCube
     * @param llb Lower left back corner
     * @param urf Upper right front corner
     */
    GlCube(const QVector3D & llb = v_Zero, const QVector3D & urf = v_XYZ);
    void makeSurface(QVector<GLPoint> * pointContainer, QVector<GLuint> *indexContainer);
private:
    QVector3D m_llb;
    QVector3D m_urf;
};

#endif // GLCUBE_H
