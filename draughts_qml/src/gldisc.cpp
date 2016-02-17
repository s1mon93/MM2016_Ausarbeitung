#include "gldisc.h"
#include <math.h>

GLDisc::GLDisc(const QPoint &fieldCoord, float discRadius, const GLColorRgba &color, const QString textureFile, double height, int slices)
    :GLBody("Disc", discRadius, color, textureFile)
{
    m_FieldCoord = fieldCoord;
    m_discRadius = discRadius;
    m_height = height;
    m_slices = slices;
    m_drawingMode = GL_TRIANGLE_STRIP;
    m_isKing = false;
}

void GLDisc::makeSurface(QVector<GLPoint> *pointContainer, QVector<GLuint> *indexContainer)
{
    GLBody::makeSurface(pointContainer, indexContainer);
    QVector3D southPole = v_Zero;
    double height = m_height;
    if(isKing())
        height *= 2.0;
    QVector3D northPole = v_Y * height;
    QVector3D vertex = v_Z * m_discRadius;
    QVector3D normal;
    QVector3D texCoord;
    QMatrix4x4 longitudeMatrix;
    int iSouthPole = 0; //indices for the poles
    int iNorthPole = 0;

    //start with south pole
    m_firstPoint = m_points->size();
    m_firstIndex = m_indices->size();
    iSouthPole = m_firstPoint;
    m_points->append(GLPoint(southPole + m_center,      //vertex
                            -v_Y,            //normal
                           QVector3D(0.5, 0.5, 0.0),//texCoord
                           m_color));

    int slice;
    QVector3D texCenter(0.5,0.5,0.0);
    for(slice = 0; slice <= m_slices; slice ++)
    {
        vertex = v_Z * m_discRadius;
        longitudeMatrix.setToIdentity();//always start from scratch
        if(slice != m_slices) //do not rotate by 360 deg for last points, use 0 deg to match first points
           longitudeMatrix.rotate(slice * 360.0 / m_slices, -v_Y);
        //bottom disc 1
        vertex = vertex * longitudeMatrix;
        normal = -v_Y;
        texCoord = texCenter + QVector3D(0.5 * vertex.x() / m_discRadius, -0.5 * vertex.z() / m_discRadius, 0.0);
        m_points->append(GLPoint(vertex + m_center, normal, texCoord, m_color));
        //lower cylinder 2
        normal = vertex;

        //leave tex coord as it is
        m_points->append(GLPoint(vertex + m_center, normal, texCoord, m_color));
       //upper cylinder 3
        vertex += northPole;
        m_points->append(GLPoint(vertex + m_center, normal, texCoord, m_color));
        //top disc 4
        normal = v_Y;
        m_points->append(GLPoint(vertex + m_center, normal, texCoord, m_color));
    }
    //end with north pole
    iNorthPole = m_points->size();
    m_points->append(GLPoint(northPole + m_center,      //vertex
                            v_Y,               //normal
                           QVector3D(0.5, 0.5, 0.0),//texCoord
                           m_color));
    m_nextPoint = m_points->size();

    for(slice = 0; slice < m_slices; slice += 2)
    {
        int leftSlice = iSouthPole + 4 * slice;
        int rightSlice = iSouthPole + 4 * (slice + 1);
        //we go upwards from south pole to north pole first
        m_indices->append(iSouthPole);
        m_indices->append(leftSlice + 1); //left bottom disc
        m_indices->append(rightSlice + 1); //right bottom disc
        m_indices->append(rightSlice + 2); //right bottom cylinder
        m_indices->append(leftSlice + 2); //left bottom cylinder
        m_indices->append(rightSlice + 3); //right top cylinder
        m_indices->append(leftSlice + 3 ); //left top cylinder
        m_indices->append(leftSlice + 4); //left top disc
        m_indices->append(rightSlice + 4); //right top disc
        m_indices->append(iNorthPole);
        //we go downwards, back to southpole
        leftSlice += 4;
        rightSlice += 4;
        m_indices->append(rightSlice + 4); //right top disc
        m_indices->append(leftSlice + 4); //left top disc
        m_indices->append(rightSlice + 3); //right top cylinder
        m_indices->append(leftSlice + 3); //left top cylinder
        m_indices->append(rightSlice + 2); //right bottom cylinder
        m_indices->append(leftSlice + 2); //left bottom cylinder
        m_indices->append(leftSlice + 1); //left bottom disc
        m_indices->append(rightSlice + 1); //right bottom disc
        //southpole will be added in next slice
    }

    m_indices->append(iSouthPole); //finally add south pole

    m_nextIndex = m_indices->size();
}


QPoint GLDisc::getFieldCoord() const
{
    return m_FieldCoord;
}

void GLDisc::setFieldCoord(const QPoint &FieldCoord)
{
    m_FieldCoord = FieldCoord;
}

void GLDisc::becomeKing()
{
    if(isKing())
            return;
   // m_height = 2* m_height;
    m_isKing = true;
    invalidateSurface();
}

bool GLDisc::isColliding(const GLDisc *other) const
{
    if(this == other)
        return false;

    if((getCenter() - other->getCenter()).length() > getDiscRadius() + other->getDiscRadius())
        return false;
    else
    {
        double otherHeight = other->m_height;
        if(other->isKing())
            otherHeight *= 2.0;
        double ourHeight = m_height;
        if(isKing())
            ourHeight *= 2.0;
        if(getCenter().y() < other->getCenter().y())
            return other->getCenter().y() - getCenter().y() <= ourHeight;
        else return getCenter().y() - other->getCenter().y() <= otherHeight;
    }
}
