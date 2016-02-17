#include "draughtsscene.h"

//#define DEBUG_DRAUGHTS_SCENE

DraughtsScene::DraughtsScene(QQuickItem *parent) :
    GLItem(parent)
{
    m_activatePaintBeforeQml = false; //No painting under QML
    m_activatePaintAfterQml = true;

    m_fovy         = 45.0f;
    m_aspect       =  0.0f;
    m_eye = 8.5 * v_YZ;
    m_orthoMode    = false;
    m_orthoRange   = 1.0;
    createAxes(10.1); //create axes, so that we can show them if requested
    m_draughts = new Draughts(parent, this);
    m_sounds = new SoundEngine(this);
    m_sounds->setEnabled(true);
    connect(m_draughts, SIGNAL(soundRequest(QString)),
            m_sounds, SLOT(playSound(QString)));
    m_maskDiameter = 100.0;
}

void DraughtsScene::paintUnderQmlScene()
{
    //Do nothing right now.
}

void DraughtsScene::paintOnTopOfQmlScene()
{
    m_draughts->draw(m_renderer);
}

void DraughtsScene::newGame()
{
   delete m_draughts;
   m_draughts = new Draughts(parentItem(), this);
   m_maskDiameter = 0.0;
}

void DraughtsScene::startGame()
{
    startTimer();
    if(renderer())
        renderer()->setMaskDiameter(0.0);
}

void DraughtsScene::stopGame()
{
    stopTimer();
}


void DraughtsScene::mousePressed(int x, int y)
{
#ifdef DEBUG_DRAUGHTS_SCENE
    qDebug() << "DraughtsScene::mousePressed at x:" << x << " y: " << y;
#endif
    m_mousePressPosition = QPoint(x, y); //save values for synchronizeThreads
    m_mousePressReceived = true;
}

void DraughtsScene::mousePositionChanged(int x, int y)
{
#ifdef DEBUG_DRAUGHTS_SCENE
    qDebug() << "DraughtsScene::mouse position changed to  x:" << x << " y: " << y;
#endif
    m_mousePositionChangedTo = QPoint(x, y);//save values for synchronizeThreads
    m_mousePositionChangedReceived = true;
}

void DraughtsScene::mouseReleased(int x, int y)
{
#ifdef DEBUG_DRAUGHTS_SCENE
    qDebug() << "DraughtsScene::mouse released at  x:" << x << " y: " << y;
#endif
    m_mouseReleasePosition = QPoint(x, y);
    m_mouseReleaseReceived = true;
}

void DraughtsScene::synchronizeThreads()
{
    if(!renderer())
        return;
    //qDebug() << "synchronizeThreads";
    if(m_mouseReleaseReceived) //highest priority
    {
        renderer()->pushMvMatrix();
        renderer()->setMvMatrix(m_draughts->getMvMatrix());
        renderer()->calculateMousePoints(&m_MouseNear, &m_mouseFar, m_mouseReleasePosition);
        renderer()->popMvMatrix();

        m_draughts->unselectDisc();
    }
    else if(m_mousePressReceived)
    {
        renderer()->pushMvMatrix();
        renderer()->setMvMatrix(m_draughts->getMvMatrix());
        renderer()->calculateMousePoints(&m_MouseNear, &m_mouseFar, m_mousePressPosition);
        renderer()->mouseIntersection(&m_lastIntersection, v_Y, 0.0, m_mousePressPosition); //get starting point on board
        renderer()->popMvMatrix();
#ifdef DEBUG_DRAUGHTS_SCENE
        qDebug() << "Mouse on board:" << m_lastIntersection;
#endif
        m_draughts->selectDisc(m_MouseNear, m_mouseFar, m_eye);
    }
    else if(m_mousePositionChangedReceived)
    {
        renderer()->pushMvMatrix();
        renderer()->setMvMatrix(m_draughts->getMvMatrix());
        QVector3D oldIntersection = m_lastIntersection;
        renderer()->mouseIntersection(&m_lastIntersection, v_Y, 0, m_mousePositionChangedTo);
        renderer()->popMvMatrix();

        m_moveVector += m_lastIntersection - oldIntersection;
        m_draughts->moveDisc(m_moveVector);
        m_moveVector = v_Zero;
    }
    m_mousePressReceived = false;
    m_mouseReleaseReceived = false;
    m_mousePositionChangedReceived = false;
    if(m_draughts && m_timer->isActive())
        m_draughts->slotAnimation();
    //open the mask
    if(m_timer->isActive() && m_maskDiameter < 2 * width())
        m_maskDiameter += 1.0;
    m_renderer->setMaskDiameter(m_maskDiameter);
    m_renderer->setMaskCenter(QVector2D(width() / 2, height() / 2));
}
