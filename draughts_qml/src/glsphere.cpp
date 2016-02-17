#include "glsphere.h"
#include "glpoint.h"

GLSphere::GLSphere(const QString & name, float radius, const GLColorRgba &color, const QString textureFile, int stacks, int slices)
    :GLBody(name, radius, color, textureFile)
{
    m_stacks = (stacks / 2) * 2; //force even number
    m_slices = (slices / 2) * 2;
    m_drawingMode = GL_POINTS;
}

/**
 * @brief GlSphere::makeSurface North pole is (0,radius, 0), south pole is (0, -radius, 0)
 * We use true normals. On a sphere vertex and normal have the same direction.
 * @param pointContainer
 */
void GLSphere::makeSurface(QVector<GLPoint> *pointContainer, QVector<GLuint> *indexContainer)
{
    GLBody::makeSurface(pointContainer, indexContainer);
    QVector3D southPole = -v_Z; //unit vector, must be scaled by radius later
    QVector3D northPole = v_Z;
    QVector3D vertex;
    QVector3D normal;
    QVector3D texCoord;
    QMatrix4x4 longitudeMatrix;
    QMatrix4x4 latitudeMatrix;
    int iSouthPole = 0; //indices for the poles
    int iNorthPole = 0;

    //start with south pole
    m_firstPoint = m_points->size();
    m_firstIndex = m_indices->size();
    iSouthPole = m_firstPoint;
    m_points->append(GLPoint(southPole * m_radius,  //vertex
                           southPole,               //normal
                           QVector3D(0.5, 0.0, 0.0),//texCoord at 0 longitude
                           m_color));

    int firstRow = 1;
    int lastRow = m_stacks - 1;
    int slice;
    int duplicates = 1;
    for(slice = 0; slice < m_slices; slice ++)
    {
        longitudeMatrix.setToIdentity();//always start from scratch
        longitudeMatrix.rotate(slice * 360.0 / m_slices, -v_Z);
        if(slice == m_slices / 2) //we need to switch from end of texture to start of texture here
            duplicates = 2;
        else duplicates = 1;
        for(int duplicate = 0; duplicate < duplicates; duplicate++) // create an extra column of points
        for(int stack = firstRow; stack <= lastRow; stack ++)       // to switch from end of texture to start of texture
        {
           latitudeMatrix.setToIdentity(); //always start from scratch
           latitudeMatrix.rotate(stack * 180.0 / m_stacks, v_Y);
           vertex = (southPole * latitudeMatrix) * longitudeMatrix;
           normal = vertex;
           vertex *= m_radius;
           double texX = (double)slice / (double) m_slices + 0.5;
           if(texX > 1.01)
               texX -= 1.0;
           if(duplicate == 1)
               texX = 0.0;
           texCoord = QVector3D(texX, (double)stack / (double)m_stacks, 0.0);  //floats required!!
           m_points->append(GLPoint(vertex, normal, texCoord, m_color));
        }
    }
    //end with north pole
    iNorthPole = m_points->size();
    m_points->append(GLPoint(northPole * m_radius,  //vertex
                           northPole,               //normal
                           QVector3D(0.5, 1.0, 0.0),//texCoord at 0 longitude
                           m_color));
    m_nextPoint = m_points->size();

    for(int i = m_firstPoint; i < m_nextPoint; i++) //move to final position
        (*m_points)[i].move(m_center);


    int rows = m_stacks - 1;
    for(slice = 0; slice < m_slices; slice += 2)
    {
        //go upwards from south pole to north pole
        m_indices->append(iSouthPole);
        for(int stack = firstRow; stack <= lastRow; stack ++)
        {
           m_indices->append(iSouthPole + rows * slice + stack); //left meridian
           m_indices->append(iSouthPole + rows * slice + rows + stack ); //right meridian
        }
        m_indices->append(iNorthPole);

        //now go downwards back to southpole
        for(int stack = lastRow; stack >= firstRow; stack --)
        {
           m_indices->append(iSouthPole + rows * slice + rows + stack); //left meridian
           m_indices->append(iSouthPole + rows * slice + rows + rows + stack); //right meridian
        }
        //southpole will be added in next slice
    }

    //Close the sphere
    //go upwards from south pole to north pole
    m_indices->append(iSouthPole);
    for(int stack = firstRow; stack <= lastRow; stack ++)
    {
       m_indices->append(iSouthPole + rows * slice + stack); //left meridian = last meridian
       m_indices->append(iSouthPole + stack ); //right meridian = first meridian
    }
    m_indices->append(iNorthPole);

    m_indices->append(iSouthPole); //finally add south pole

    m_nextIndex = m_indices->size();

}

void GLSphere::draw(GLESRenderer *renderer)
{
    int oldPointSize = renderer->pointSize();
    if(m_drawingMode == GL_POINTS)
    {
         renderer->setPointSize(2.0);
    }
    GLBody::draw(renderer);
    renderer->setPointSize(oldPointSize);
}
