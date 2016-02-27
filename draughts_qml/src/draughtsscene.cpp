#include "draughtsscene.h"

//#define DEBUG_DRAUGHTS_SCENE

DraughtsScene::DraughtsScene(QQuickItem *parent) :
    GLItem(parent)
{
    //Simon
    m_newGamePressed = false;
    m_timerForNewGame = new QTimer(this);
    m_timerForNewGame->setInterval(5000);
    m_timerForNewGame->setSingleShot(true);
    connect(m_timerForNewGame, SIGNAL(timeout()), this, SLOT(createNewGame()));
    m_blackScore = 0;
    m_whiteScore = 0;
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

//void DraughtsScene::newGame()
//{
//   delete m_draughts;
//   m_draughts = new Draughts(parentItem(), this);
//   // Connect new m_draughts to m_sounds again
//   connect(m_draughts, SIGNAL(soundRequest(QString)),
//           m_sounds, SLOT(playSound(QString)));
//   m_maskDiameter = 0.0;
//}

void DraughtsScene::newGame()
{
    m_newGamePressed = true;
    m_timerForNewGame->start();
    qDebug() << "m_timerForNewGame active?: " << m_timerForNewGame->isActive();
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
    if(m_mouseReleaseReceived)
    {
//        renderer()->pushMvMatrix();
//        renderer()->setMvMatrix(m_draughts->getMvMatrix());
//        renderer()->calculateMousePoints(&m_MouseNear, &m_mouseFar, m_mouseReleasePosition);
//        renderer()->popMvMatrix();

//        m_draughts->unselectDisc();
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
        //Simon
        //m_draughts->selectDisc(m_MouseNear, m_mouseFar, m_eye);
//        if(!m_draughts->selectDisc(m_MouseNear, m_mouseFar, m_eye))
//        {
            m_draughts->createDiscIfValid(m_lastIntersection);
//        }
    }
    else if(m_mousePositionChangedReceived)
    {
//        renderer()->pushMvMatrix();
//        renderer()->setMvMatrix(m_draughts->getMvMatrix());
//        QVector3D oldIntersection = m_lastIntersection;
//        renderer()->mouseIntersection(&m_lastIntersection, v_Y, 0, m_mousePositionChangedTo);
//        renderer()->popMvMatrix();

//        m_moveVector += m_lastIntersection - oldIntersection;
//        m_draughts->moveDisc(m_moveVector);
//        m_moveVector = v_Zero;
    }

    m_mousePressReceived = false;
    m_mouseReleaseReceived = false;
    m_mousePositionChangedReceived = false;
    if(m_draughts && m_timer->isActive())
        m_draughts->slotAnimation();
    else if(m_draughts && m_timerForNewGame->isActive())
        m_draughts->slotAnimation();
    //open the mask
    if(m_timer->isActive() && m_maskDiameter < 2 * width())
        m_maskDiameter += 1.0;

    m_renderer->setMaskDiameter(m_maskDiameter);
    m_renderer->setMaskCenter(QVector2D(width() / 2, height() / 2));
}

void DraughtsScene::setBlackScore(int blackScore)
{
    if (m_blackScore == blackScore)
        return;

    m_blackScore = blackScore;
    emit blackScoreChanged(blackScore);
}

void DraughtsScene::setWhiteScore(int whiteScore)
{
    if (m_whiteScore == whiteScore)
        return;

    m_whiteScore = whiteScore;
    emit whiteScoreChanged(whiteScore);
}

void DraughtsScene::setCurrentPlayer(QString currentPlayer)
{
    if (m_currentPlayer == currentPlayer)
        return;

    m_currentPlayer = currentPlayer;
    emit currentPlayerChanged(currentPlayer);
}

void DraughtsScene::setWinner(QString winner)
{
    if (m_winner == winner)
        return;

    m_winner = winner;
    emit winnerChanged(winner);
}

void DraughtsScene::createNewGame()
{
    qDebug() << "createNewGame()";
    delete m_draughts;
    m_draughts = new Draughts(parentItem(), this);
    // Connect new m_draughts to m_sounds again
    connect(m_draughts, SIGNAL(soundRequest(QString)),
            m_sounds, SLOT(playSound(QString)));
    m_maskDiameter = 0.0;
    m_newGamePressed = false;
}
