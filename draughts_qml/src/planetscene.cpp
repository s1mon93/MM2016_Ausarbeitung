#include "planetscene.h"

#include "math.h"
PlanetScene::PlanetScene()
    :GlItem()
{
    m_scalingRenderer = NULL;
}

void PlanetScene::initializeRenderer()
{
        m_scalingRenderer = new GLESRenderer_Scaling(NULL);
        m_renderer = m_scalingRenderer;
}

void PlanetScene::setupGeometry()
{
   // m_earth.setTextureFile(":/textures/earthmap1k.jpg");
   // m_earth.makeSurface(points(), indices());
   // m_cube.makeSurface(points(), indices());
   // m_disc.setTextureFile(":/textures/white_disc_256.jpg");
   // m_disc.makeSurface(points(), indices());
   // m_chessBoard.makeSurface(points(), indices());
   m_man.makeSurface(points(), indices());
    m_eye = 10.0 * v_YZ;
    m_lightDirection = v_XYZ;
    GlItem::setupGeometry();
}

void PlanetScene::setupView(bool clearBuffers)
{
    GlItem::setupView(clearBuffers);
    if(m_renderThreadRotation > 360.0)
    {
       QMatrix4x4 m;
       m.scale(0.5 + 0.5 * cos(m_renderThreadRotation * M_PI / 180.0));
       m_scalingRenderer->setScaleMatrix(m);
    }
}

void PlanetScene::paintUnderQmlScene()
{
  //  m_disc.draw(renderer());
  //  m_earth.draw(renderer());
  //  m_cube.draw(renderer());
  //  m_chessBoard.draw(renderer());
    m_man.draw(renderer());
}

