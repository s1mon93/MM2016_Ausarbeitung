#include "glman.h"

GlMan::GlMan(float m_radius, const GLColorRgba & color, const QString textureFile,
             int stacks, int slices, double coneHeight)
    :GLSphere("Head", m_radius, color, textureFile, stacks, slices)
{
    m_coneHeight = coneHeight;
}

void GlMan::makeSurface(QVector<GLPoint> *pointContainer, QVector<GLuint> *indexContainer)
{
    GLSphere::makeSurface(pointContainer, indexContainer);
    move(m_coneHeight * v_Y); //move the sphere to tip of cone

    int iBottomCenter = m_nextPoint;
    QVector3D tip = m_coneHeight * v_Y;
    QVector3D bottomCenter = v_Zero;
    QVector3D texCenter(0.5,0.5,0.0);
    pointContainer->append(GLPoint(bottomCenter, -v_Y, texCenter, m_color));

    // create GLPoints for cone
    int slice;
    QVector3D vertex;
    QVector3D normal;
    QVector3D texCoord;
    QMatrix4x4 longitudeMatrix;

    for(slice = 0; slice <= m_slices; slice ++)
    {
        vertex = v_Z * m_radius * 1.5;
        longitudeMatrix.setToIdentity();//always start from scratch
        if(slice != m_slices) //do not rotate by 360 deg for last points, use 0 deg to match first points
           longitudeMatrix.rotate(slice * 360.0 / m_slices, -v_Y);
        //bottom disc
        vertex = vertex * longitudeMatrix;
        normal = -v_Y;
        texCoord = texCenter + QVector3D(0.5 * vertex.x(), -0.5 * vertex.z(), 0.0);
        m_points->append(GLPoint(vertex, normal, texCoord, m_color));
        //lower cone
        normal = QVector3D(0.0, m_radius, m_coneHeight).normalized();
        normal = normal * longitudeMatrix;
        //leave tex coord as it is
        m_points->append(GLPoint(vertex, normal, texCoord, m_color));
       //cone tip
        vertex = tip;
        //leave normal as it is
        texCoord = texCenter;
        m_points->append(GLPoint(vertex, normal, texCoord, m_color));
     }
     m_nextPoint = m_points->size();

     //move to bottom center
     m_indices->append(iBottomCenter);
     m_indices->append(iBottomCenter);

    // set the indices for the cone
    for(slice = 0; slice < m_slices; slice += 2)
    {
        int leftSlice = iBottomCenter + 3 * slice;
        int rightSlice = iBottomCenter + 3 * (slice + 1);
        //we go upwards from south pole to north pole first
        m_indices->append(iBottomCenter);
        m_indices->append(rightSlice + 1); //right bottom disc
        m_indices->append(leftSlice + 1); //left bottom disc
        m_indices->append(leftSlice + 2); //left bottom cone
        m_indices->append(rightSlice + 2); //right bottom cone
        m_indices->append(leftSlice + 3 ); //left top cone
        m_indices->append(rightSlice + 3); //right top cone
        m_indices->append(rightSlice + 2); //right bottom cone
        //we go downwards, back to southpole
        leftSlice += 3;
        rightSlice += 3;
        m_indices->append(rightSlice + 3); //right top cone
        m_indices->append(rightSlice + 2); //right bottom cone
        m_indices->append(rightSlice + 1); //right disc
        m_indices->append(leftSlice + 1); //left disc
    }

    m_indices->append(iBottomCenter); //finally add south pole

    m_nextIndex = m_indices->size();


}
