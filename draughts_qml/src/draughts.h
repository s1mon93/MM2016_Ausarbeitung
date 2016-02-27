/****************************************************************************
 *                     Copyright by Walter Roth 2012                        *
 *                       Licence: GPL                                       *
 ****************************************************************************/
#ifndef DRAUGHTS_H
#define DRAUGHTS_H

#include <QObject>
#include <QMap>

#include "glcolorrgba.h"
#include "chessboard.h"
#include "gldisc.h"
#include "glesrenderer.h"

//class jsJoystick;
class DraughtsScene;

/**
  * A Draughts (Checkers) game. This class implements the rules of the game. It contains the
  * chessboard and the 24 GlDiscs (men) for the game.
  * The draw function should be called 50 to 60 times a second in order to make smooth movements.
  * This function needs an activated OpenGL context. Call it e.g. within QGLWidget::paintGL().
  * Use selectGlDisc to select a GlDisc, moveGlDisc to move a GlDisc.
  * The game starts with the white player activated. A playerChanged signal is emitted
  * when the active player has been changed.
  * A soundRequest signal containing the filename of the sound to be played is emitted when:
  * - a GlDisc has been selected (SoundGlDiscSeleted)
  * - a GlDisc has been jumped over and will be removed (SoundGlDiscToBeRemoved)
  * - a king " was born" (SoundKingWasBorn)
  * - the player has been changed and the board is about to be turned (SoundPlayerChanged)
  * Use the setSoundFile function to set custom sound files.
  */
class Draughts : public QObject
{
    Q_OBJECT
public:

    typedef enum{
        WhitePlayer,
        BlackPlayer
    }Player;

    typedef enum{           //Default sound in resources
        SoundDiscSelected,     //knock.mp3
        SoundDiscToBeRemoved,  //grenade.mp3
        SoundPlayerChanged,    //sweep.mp3
        SoundKingWasBorn       //cymbal.mp3
    }SoundEvent;
    explicit Draughts(QObject * parent,DraughtsScene * scene);
    virtual ~Draughts();

    /**
      * Select the GlDisc that is hit and nearest to camera.
      * Returns true, if a GlDisc was selected.
      */
    bool selectDisc(const QVector3D & nearPoint, const QVector3D & farPoint,
                    const QVector3D & camera);
    /**
      * Unselects any selected GlDisc.
      */
    void unselectDisc();
    /**
      * Move a GlDisc (man) according to the draughts (checkers) game rules.
      * Returns the vector by which the GlDisc was moved.
      */
    QVector3D moveDisc(const QVector3D & moveCommand);

    /**
      * Draws the  game on current context.
      */
    virtual void draw(GLESRenderer * renderer);
    /**
      * Change active player.
      */
    void changePlayer();

    /**
      * Set custom sound files.
      */
    void setSoundFile(SoundEvent se, const QString & fileName);

    /**
     * @brief transformMatrix
     * @return The matrix for the additional transformation the game uses for drawing.
     * Required for unproject actions of mouse events to deliver the right points in 3D-model space.
     */
    const QMatrix4x4 & getMvMatrix(){return m_mvMatrix;}

    // Simon
    void createDiscIfValid(const QVector3D &lastIntersection);
    bool checkIfPlacementValid(const QPoint field);
    QPoint checkIfNextDiscIsOtherColor(QPoint startField, QPoint nextField, QList<GLDisc *> *otherDiscs);
    void changeDisc(QPoint toChangeField);
    bool isMovePossible();

signals:
    void updateRequest();
    void playerChanged(Draughts::Player newPlayer);
    /**
      * Emitted, when a sound should be played.
      */
    void soundRequest(const QString & soundFileName);

public slots:
    /**
      * Perform animation here
      */
    void slotAnimation();

    //For debugging only
    void showMouseRays(bool show){m_drawMouseRays = show;}
    void showFrames(bool show){m_drawFrames = show;}

private:
    DraughtsScene * m_scene;

    /**
      * Returns true, if movement is allowed by the rules of the game.
      */
    bool isMovementOk(GLDisc * GLDisc, const QVector3D vMove);
    /**
      * Removes a GlDisc that has been jumped over.
      */
    void removeOverjumpedDisc();
    /** Returns disk from list that has field position field.
      * Returns NULL, if not found.
      */
    GLDisc * discAt(QList <GLDisc *> * list, const QPoint & field);
    /**
      * return true, if field is empty.
      */
    bool fieldIsEmpty(const QPoint & field);

    /** Returns true, if movement is parallel to z or x
      */
    bool xzMovement(const QVector3D & vMove);
    /** Returns a vector with |x| = |z|
      */
    QVector3D makeDiagonalMovement(QVector3D vMove);
    /**
      * Calculates jumpOverField and landingField
      */
    bool calculateTargetFields(QPoint startField, QVector3D vMove);
    /**
      * Select the GlDisc nearest to the camera, that is hit by the line defined by nearPoint and farPoint.
      */
    void checkForSelection(const QVector3D & nearPoint, const QVector3D & farPoint,
                           const QVector3D & camera, GLDisc * body );

    ChessBoard * chessBoard;
    GLfloat discRadius;
    GLfloat discHeight;
    GLfloat rotationAngleStart;
    GLfloat rotationAngle;
    GLfloat rotationAngleTarget;
    int rotationStep;
    int m_DiscSlices;
    QList<GLDisc *> whiteDiscs;
    GLColorRgba whiteColor; //the color for the "white" men
    QList<GLDisc *> blackDiscs;
    GLDisc * discToBeRemoved;
    GLfloat removeHeight;
    GLColorRgba blackColor; //the color for the black men
    GLDisc * selectedDisc;
    //fields for jumping
    bool jumpIsValid;
    QPoint jumpOverField;
    QPoint landingField;
    Player player;
    QMap<SoundEvent, QString>SoundFileNames;
    /**
     * @brief m_transformMatrix
     * The mvMatrix used to draw the Chessboard
     */
    QMatrix4x4 m_mvMatrix;

    //Joystick support
    //jsJoystick * m_joystick;

    //for debugging
    bool m_drawFrames;
    bool m_drawMouseRays;
    QList<QPoint> m_toChangeFields;

    //Simon
    int m_countImpossibleMoves;
    QList<GLDisc *> scoreDiscs;
};

#endif // DRAUGHTS_H
