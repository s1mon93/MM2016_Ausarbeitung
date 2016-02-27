#ifndef DRAUGHTSSCENE_H
#define DRAUGHTSSCENE_H

#include "glitem.h"
#include "draughts.h"
#include "soundengine.h"

#include <QMatrix4x4>
/**
 * @brief The DraughtsScene class is subclassed from GlItem and contains mouse-event preprocessing for the Draughts game.
 * Incomming mouse-events are evaluated in the GUI-Thread and the results are stored in m_Near, m_Far, m_Intersection and a set of flags.
 * These attributes are copied in synchronizeThreads() to the geometric data processed later by the OpenGL-Rendering thread.
 * When synchronizeThreads is called, the rendering thread is waiting. This avoids race conditions.
 * Sound is supplied by the SoundEngine object using QSound as an output device. QSound needs .wav files. These are supplied
 * via the program resources.
 */

class DraughtsScene : public GLItem
{
    Q_OBJECT
    //Simon
    Q_PROPERTY(int blackScore READ getBlackScore WRITE setBlackScore NOTIFY blackScoreChanged)
    Q_PROPERTY(int whiteScore READ getWhiteScore WRITE setWhiteScore NOTIFY whiteScoreChanged)
    Q_PROPERTY(QString currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY currentPlayerChanged)
    Q_PROPERTY(QString winner READ getWinner WRITE setWinner NOTIFY winnerChanged)

public:
    explicit DraughtsScene( QQuickItem *parent = 0);

    /**
     * @brief paintUnderQmlScene
     * Draw the game.
     */
    void paintUnderQmlScene();
    /**
     * @brief paintOnTopOfQmlScene
     * Draw nothing.
     */
    virtual void paintOnTopOfQmlScene();

    //Simon
    int getBlackScore() const
    {
        return m_blackScore;
    }

    int getWhiteScore() const
    {
        return m_whiteScore;
    }

    QString getCurrentPlayer() const
    {
        return m_currentPlayer;
    }

    QString getWinner() const
    {
        return m_winner;
    }

    bool getNewGamePressed() const
    {
        return m_newGamePressed;
    }

signals:
    //Simon
    void blackScoreChanged(int blackScore);

    void whiteScoreChanged(int whiteScore);

    void currentPlayerChanged(QString currentPlayer);

    void winnerChanged(QString winner);

    void newGameTimeOut();

public slots:
    /**
     * @brief newGame Create a new game
     */
    void newGame();
    /**
     * @brief startGame Start Timer and set mask radius to zero
     */
    void startGame();
    /**
     * @brief stopGame Stops the timer
     */
    void stopGame();

    /** Mouse event handler to be called from QML.
     *  Save data for synchronizeThreads();
     * ***DO NOT use renderer here!!*** Renderer is used by render thread.
     * Renderer may be used by GUI-Thread in synchronizeThreads(), when render thread is sleeping.
     **/
   void mousePressed(int x, int y);
   void mousePositionChanged(int x, int y);
   void mouseReleased(int x, int y);


   /**
    * @brief synchronizeThreads runs on the GUI thread and transfers dat to render thread.
    * ***Render thread is sleeping when this function is called.***
    * Mouse actions received since the last call to this function
    * are transferred to the draughts engine here.
    * Because render thread is sleeping, renderer can be used by GUI Thread in this function.
    */
   void synchronizeThreads();

   //Simon
   void setBlackScore(int blackScore);

   void setWhiteScore(int whiteScore);

   void setCurrentPlayer(QString currentPlayer);

   void setWinner(QString winner);

   void createNewGame();

private:
   /**
    * @brief m_Draughts
    * The draughts game engine. Owns all geometric objects.
    */
   Draughts * m_draughts;
   /**
    * @brief m_sounds
    * The sound engine connected to the soundRequest signal from draughts.
    */
   SoundEngine * m_sounds;
   /**
    * @brief m_MousePressPosition in window coordinates. Set by GUI thread.
    */
   QPoint m_mousePressPosition;
   /**
    * @brief m_mousePositionChangedTo in window coordinates. Set by GUI thread.
    */
   QPoint m_mousePositionChangedTo;
   /**
    * @brief m_mouseReleasePosition in window coordinates. Set By Gui thread.
    */
   QPoint m_mouseReleasePosition;
   /**
    * @brief m_MouseNear
    * The near point of a mouse click or movement.
    * Needed in synchronizeThreads().
    */
   QVector3D  m_MouseNear;
   /**
    * @brief m_MouseNear
    * The far point of a mouse click or movement.
    * Needed in synchronizeThreads().
    */
   QVector3D m_mouseFar;
   /**
    * @brief m_lastIntersection
    * The last intersection of the mouse line with the chessboard.
    */
   QVector3D m_lastIntersection;
   /**
    * @brief m_moveVector
    * The vector for disc movement on the chessboard.
    */
   QVector3D m_moveVector;
   /**
    * @brief m_maskDiameter Diameter of the circular mask in fragmentShader
    */
   float m_maskDiameter;
   /**
    * @brief mousePressReceived
    * Flags for synchronizeThreads()
    */
   bool m_mousePressReceived;
   bool m_mouseReleaseReceived;
   bool m_mousePositionChangedReceived;

   //Simon
   int m_blackScore;
   int m_whiteScore;
   QString m_currentPlayer;
   QString m_winner;
   QTimer * m_timerForNewGame;
   bool m_newGamePressed;
};

#endif // DRAUGHTSSCENE_H
