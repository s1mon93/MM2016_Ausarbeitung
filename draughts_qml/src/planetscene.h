#ifndef PLANETSCENE_H
#define PLANETSCENE_H

#include "glitem.h"
#include "glcube.h"
#include "glsphere.h"
#include "gldisc.h"
#include "chessboard.h"
#include "glman.h"
#include "glesrenderer_scaling.h"

class PlanetScene : public GlItem
{
public:
    PlanetScene();
    /**
     * @brief createShaderProgram
     * creates and links the shader program using vshader.
     */
    virtual void initializeRenderer();

    void setupGeometry();
    /**
     * @brief setupView Setup matrices, lighting and basic GL rendering settings
     * GlItem::setupView sets up a basic view with (0,0,0) in the center of the screen.
     * You may override this function to fit your requirements.
     */
    void setupView(bool clearBuffers);

    void paintUnderQmlScene();
private:
  GlCube m_cube;
  GlSphere m_earth;
  GlDisc m_disc;
  GlMan m_man;
  ChessBoard m_chessBoard;
  GLESRenderer_Scaling * m_scalingRenderer;
};

#endif // PLANETSCENE_H
