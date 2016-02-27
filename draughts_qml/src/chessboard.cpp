#include "chessboard.h"
#include "shaderdebugger.h"
#include "gldisc.h"
#include <QDebug>


#define DEBUG_CHESSBOARD

ChessBoard::ChessBoard(const QVector3D & center, GLfloat squareSize)
    :GLBody("Chessboard", 1.0, GLColorRgba::clDarkGreen, "")
{
    m_firstFieldIndex = 0;
    m_firstDivideLineIndex = 0;
    m_nextFieldIndex = 0;
    m_nextDivideLineIndex = 0;
    m_center = center;
    m_normal = v_Y;
    m_squareSize = squareSize;
    m_radius = m_squareSize * 8.0 * 1.142;
    setDrawingMode(GL_TRIANGLES);
}
/**
  * Returns 3D position of field center. Field coordinates are from 0 to 7
  */
QVector3D ChessBoard::fieldToPosition(QPoint field)
{
    QVector3D result;
    QVector3D vx = v_X * m_squareSize;
    QVector3D vz = v_Z * m_squareSize;
    result = (field.x() - 3.5) * vx + (field.y() - 3.5) * vz;
#ifdef DEBUG_CHESSBOARD
    ShaderDebugger::debugVector3D(result, "Field" + QString::number(field.x()) +"," + QString::number(field.y())
                       + " is at position ");
#endif
    return result;
}

void ChessBoard::makeSurface(QVector<GLPoint> *pointContainer, QVector<GLuint> *indexContainer)
{
    GLBody::makeSurface(pointContainer, indexContainer);
    // bei letzten Indices/Points anfangen
    m_firstPoint = m_points->size();
    m_firstIndex = m_indices->size();

    m_firstFieldIndex = m_indices->size();

    // ---------------- Quadratfelder erstellen ----------------
    QVector3D vx = v_X * m_squareSize;
    QVector3D vz = v_Z * m_squareSize;

    for(int row = 0; row <= 8; row ++){
        QVector3D rowStart = m_center + (row - 4) * vz - 4  * vx;
        for (int column = 0; column <= 8; column ++)
        {
          QVector3D vertex = rowStart + column * vx;
          m_points->append(GLPoint(vertex, m_normal));
          if((row < 8) && (column < 8))
          {
              m_indices->append(m_firstPoint + row * 9 + column);
              m_indices->append(m_firstPoint + (row + 1) * 9 + column);
              m_indices->append(m_firstPoint + row * 9 + column + 1);
              m_indices->append(m_firstPoint + row * 9 + column + 1);
              m_indices->append(m_firstPoint + (row + 1) * 9 + column);
              m_indices->append(m_firstPoint + (row + 1) * 9 + column + 1);
          }
        }
    }
    // Indices fuer Felder merken
    m_nextFieldIndex = m_indices->size();


    // ---------------- Linien erstellen ----------------
    m_firstDivideLineIndex = m_indices->size();

    float abstandFeldLinie = 0.0001;    // Linien etwas über dem Feld zeichnen
    float randbreite = 0.02;            // Breite der Linien

    //Linien fuer Zeilen
    for(int row = 0; row <= 8; row ++){
        int size = m_points->size();
        QVector3D rowStart = m_center + (row - 4) * vz - 4  * vx;

        QVector3D vertex = rowStart - randbreite * vz + 0 * vx;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));
        vertex = rowStart + randbreite * vz + 0 * vx;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));

        vertex = rowStart - randbreite * vz + 8 * vx;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));
        vertex = rowStart + randbreite * vz + 8 * vx;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));

        m_indices->append(size + 2);
        m_indices->append(size + 3);
        m_indices->append(size);
        m_indices->append(size);
        m_indices->append(size + 3);
        m_indices->append(size + 1);
    }
    // Linien fuer Spalten
    for(int col = 0; col <= 8; col ++){
        int size = m_points->size();
        QVector3D colStart = m_center + (-4) * vz - (4 - col)  * vx;

        QVector3D vertex = colStart - randbreite * vx;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));
        vertex = colStart + randbreite * vx;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));

        vertex = colStart - randbreite * vx + 8 * vz;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));
        vertex = colStart + randbreite * vx + 8 * vz;
        m_points->append(GLPoint(vertex + QVector3D(0,abstandFeldLinie,0), m_normal));

        m_indices->append(size + 2);
        m_indices->append(size + 3);
        m_indices->append(size);
        m_indices->append(size);
        m_indices->append(size + 3);
        m_indices->append(size + 1);
    }

    // Lineindices merken
    m_nextDivideLineIndex = m_indices->size();
    // gesamte Indices und Points merken
    m_nextPoint = m_points->size();
    m_nextIndex = m_indices->size();

//    //Testausgabe Indices
//    QString s;
//    for(int i = m_firstIndex; i < m_nextIndex; i++)
//    {
//        s += QString::number(m_indices->at(i)) + " ";
//    }
//    qDebug("indices: %s", qPrintable(s));
}

//**
//  * Raise disc so that it jumps over field.
//  */
//void ChessBoard::raiseDisc(GLDisc * disc, QPoint field, bool jumpOverKing)
//{
//    GLfloat distance = (fieldToPosition(field) - QVector3D(disc->getCenter().x(), 0.0, disc->getCenter().z())).length();
//    GLfloat radius = 1.41 * m_squareSize;
//    GLfloat raiseHeight = 3.0 * disc->getHeight() * (1.0 - distance * distance / radius / radius);
//    if(jumpOverKing)
//        raiseHeight *= 2.0;
//    QVector3D oldCenter = disc->getCenter();
//    GLfloat oldHeight = QVector3D::dotProduct(oldCenter, m_normal);
//    if(raiseHeight < 0.0)
//        raiseHeight = 0.0; //do not dive
//    QVector3D vRaise = m_normal * (raiseHeight - oldHeight);
//    disc->setCenter(oldCenter + vRaise);
//}

/**
  * Returns true, if position is on board.
  */
bool ChessBoard::isOnBoard(const QVector3D & position)
{
    //qDebug() <<"isonBoard: " << position;
    return
            position.x() < m_center.x() + 4.0 * m_squareSize
        &&  position.x() > m_center.x() - 4.0 * m_squareSize
        &&  position.z() < m_center.z() + 4.0 * m_squareSize
        &&  position.z() > m_center.z() - 4.0 * m_squareSize;
}


void ChessBoard::draw(GLESRenderer * renderer){
  if(!m_surfaceIsValid)
    makeSurface(NULL, NULL);
  if(!m_points || m_points->size() == 0) //check for existing points
  {
      qDebug()<< m_name + " GLBody::draw  ERROR: No points!";
      return;
  }
  int stride = sizeof(GLPoint);
  bool textureEnabled = renderer->isTextureEnabled();
  bool lightingEnabled = renderer->isLightingEnabled();
  bool colorArrayEnabled = renderer->isColorArrayEnabled();

  //set colors
  renderer->setAmbientAndDiffuseColor(m_color);

  //enable required arrays
  renderer->activateAttributeArray(GLESRenderer::VERTEX_LOCATION,
                                   m_points->data()[0].vertexPointer(), stride);
  if (renderer->isLightingEnabled())
      renderer->activateAttributeArray(GLESRenderer::NORMAL_LOCATION,
                                      m_points->data()[0].normalPointer(), stride);
  if(m_textureIds.size() > 0){
    QOpenGLFunctions glFuncs(QOpenGLContext::currentContext());
    glFuncs.glActiveTexture(GL_TEXTURE0); //use texture unit 0
    glBindTexture(GL_TEXTURE_2D, m_textureIds[m_activeTextureIndex]);
    renderer->setTextureEnabled(true);
   }
  else renderer->setTextureEnabled(false);
  renderer->activateAttributeArray(GLESRenderer::TEXCOORD_LOCATION,
               m_points->data()[0].texCoordPointer(), stride);
  renderer->activateAttributeArray(GLESRenderer::COLOR_LOCATION,
               m_points->data()[0].colorPointer(), stride);

//   for(int i = 0; i < indices.count(); i++)
//    points[indices[i]].debugOutput("Point" +QString::number(i) + ":" + QString::number(indices[i]) + " ");

  calculateDrawMatrix();
  renderer->pushMvMatrix();
  renderer->addTransformation(m_drawMatrix);
  if(m_firstIndex >= 0 && m_nextIndex > 0)
  {
      // draw the lines in black, the fields in green
      glDrawElements(m_drawingMode, m_nextFieldIndex - m_firstFieldIndex,
                     GL_UNSIGNED_INT, &m_indices->data()[m_firstFieldIndex]);
       renderer->setAmbientAndDiffuseColor(GLColorRgba::clBlack);
       glDrawElements(m_drawingMode, m_nextDivideLineIndex - m_firstDivideLineIndex,
                      GL_UNSIGNED_INT, &m_indices->data()[m_firstDivideLineIndex]);

  }
  else
    glDrawArrays(m_drawingMode, m_firstPoint, m_nextPoint - m_firstPoint);

  if(lightingEnabled)
      renderer->setLightingEnabled(false);
  if(!colorArrayEnabled)
      renderer->setColorArrayEnabled(true);
  renderer->setTextureEnabled(false);
  if(m_showNormals)
      glDrawElements(GL_LINES, m_nextNormalIndex -m_firstNormalIndex,
                     GL_UNSIGNED_INT, &m_indices->data()[m_firstNormalIndex]);
  if(m_showFrame)
  {
      //draw the frame
      GLfloat lineWidth[4]; //4 floats, just for safety
      glGetFloatv(GL_LINE_WIDTH, lineWidth);
      glLineWidth(3.0);
      glDrawElements(GL_LINES, m_nextFrameIndex -m_firstFrameIndex,
                     GL_UNSIGNED_INT, &m_indices->data()[m_firstFrameIndex]);
      //Draw the hit line
      if(m_firstHitPoint != 0)
      {
          glLineWidth(5.0);
          glDrawArrays(GL_LINES, m_firstHitPoint, m_nextHitPoint - m_firstHitPoint);
      }
      glLineWidth(lineWidth[0]);
  }

//  if(isSelected())
//  {
//      GLColorRgba pointColor(m_color.inverted());
//      renderer->setAmbientAndDiffuseColor(pointColor);
//#ifdef GLES
//      glDrawArrays(GL_POINTS, m_firstPoint, m_nextPoint - m_firstPoint);
//#else
//      int oldPointSize = renderer->pointSize();
//      renderer->setPointSize(5);
//      glDrawArrays(GL_POINTS, m_firstPoint, m_nextPoint - m_firstPoint);
//      renderer->setPointSize(oldPointSize);
//#endif
//  }

  //cleanup
  renderer->setLightingEnabled(lightingEnabled);
  renderer->setColorArrayEnabled(colorArrayEnabled);
  renderer->setTextureEnabled(textureEnabled);
  renderer->disableAttributeArrays();
  renderer->popMvMatrix();
}

//Simon
QPoint ChessBoard::getNearestFieldFromPosition(const QVector3D & position)
{
    QPoint nearestField;
    QVector3D centerPosition;
    //Erstmalig length belegen
    centerPosition = fieldToPosition(QPoint(0,0));
    double abstand = (centerPosition - position).length();

    // Ueber Fields iterieren und geringsten Abstand finden
    for(int row = 0; row < 8; row++)
    {
        for(int col = 0; col < 8; col++)
        {
            centerPosition = fieldToPosition(QPoint(row, col));
            if((centerPosition - position).length() < abstand)
            {
                nearestField = QPoint(row,col);
                abstand = (centerPosition - position).length();
            }
        }
    }

    return nearestField;
}
