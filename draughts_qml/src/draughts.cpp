#include "draughts.h"
#include "gldisc.h"
#include <math.h>

#include "draughtsscene.h"
#ifndef Q_OS_ANDROID
//#include <plib/js.h>
#endif
//#define DEBUG_DRAUGHTS //enable for debug info

Draughts::Draughts(QObject *parent, DraughtsScene *scene) :
    QObject(parent)
{
    m_countImpossibleMoves = 0;
    m_scene = scene;
    chessBoard = new ChessBoard();
    chessBoard->showFrame(m_drawFrames);
    discRadius = 0.45;
    discHeight = 0.25;
    m_DiscSlices = 36;
    whiteColor = GLColorRgba(GLColorRgba::clWhite * 0.9);
    blackColor = GLColorRgba(GLColorRgba::clWhite * 0.3);
    jumpIsValid = false;
//    for(int column = 0; column < 8; column ++)
//    {
//        for(int row = 0; row < 3; row ++)
//        {
//            if((row + column) % 2 != 0) //black fields only
//            {
//                QPoint field = QPoint(column, row);
//                GLDisc * disc = new GLDisc(field, discRadius, whiteColor, "", discHeight, m_DiscSlices);
//                //disc->setTextureFile(":/textures/white_disc.jpg");
//                disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
//                whiteDiscs.append (disc);
//                field = QPoint(7 - column, 7 -row);
//                disc = new GLDisc( field, discRadius, blackColor, "", discHeight, m_DiscSlices);
//                //disc->setTextureFile(":/textures/black_disc.jpg");
//                disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
//                blackDiscs.append (disc);
//            }
//        }
//    }

    //Simon

    //Create 4 start discs
    GLDisc * disc = new GLDisc( QPoint(3,4), discRadius, blackColor, "", discHeight, m_DiscSlices);
    //disc->setTextureFile(":/textures/black_disc.jpg");
    disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
    blackDiscs.append (disc);
    disc = new GLDisc( QPoint(4,3), discRadius, blackColor, "", discHeight, m_DiscSlices);
    //disc->setTextureFile(":/textures/black_disc.jpg");
    disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
    blackDiscs.append (disc);
    disc = new GLDisc(QPoint(3,3), discRadius, whiteColor, "", discHeight, m_DiscSlices);
    //disc->setTextureFile(":/textures/white_disc.jpg");
    disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
    whiteDiscs.append (disc);
    disc = new GLDisc(QPoint(4,4), discRadius, whiteColor, "", discHeight, m_DiscSlices);
    //disc->setTextureFile(":/textures/white_disc.jpg");
    disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
    whiteDiscs.append (disc);

    selectedDisc = NULL;
    discToBeRemoved = NULL;
    removeHeight = 0.0;
    rotationAngle = 0.0;

    SoundFileNames[SoundDiscSelected] = ":/sound/knock.wav";
    SoundFileNames[SoundDiscToBeRemoved] =  ":/sound/grenade.wav";
    SoundFileNames[SoundPlayerChanged] = ":/sound/sweep.wav";
    SoundFileNames[SoundKingWasBorn] = ":/sound/cymbal.wav";
//#ifndef Q_OS_ANDROID
//    m_joystick = new jsJoystick(0);
//    if(m_joystick->notWorking())
//    {
//        qDebug() << "Draughts::Draughts: Joystick does not work!";
//        delete m_joystick;
//        m_joystick = NULL;
//    }
//#endif
    player = BlackPlayer;
    changePlayer();
}

Draughts::~Draughts()
{
    delete chessBoard;
    for(int i = 0; i < whiteDiscs.size(); i++)
        delete whiteDiscs[i];
    for(int i = 0; i < blackDiscs.size(); i++)
        delete blackDiscs[i];
}

/**
  * Unselects any selected disc. Move the selected disc to the nearest field center.
  */
//void Draughts::unselectDisc()
//{
//    if(selectedDisc == NULL)
//        return;

//    //Move disc to closest field
//    GLfloat shortestDistance = 10000.0;
//    QVector3D nearestFieldPosition;
//    QPoint nearestField;
//    for(int row = 0; row < 8; row++)
//        for(int column = 0; column < 8; column ++)
//        {
//            QPoint field = QPoint(column, row);
//            if(((column + row) % 2 != 0 //black fields only
//               && fieldIsEmpty(field)) || (field == selectedDisc->getFieldCoord()))
//            {
//                QVector3D discPos = chessBoard->fieldToPosition(QPoint(column, row));
//                GLfloat distance = (discPos - selectedDisc->getCenter()).length();
//                if(distance < shortestDistance)
//                {
//                    shortestDistance = distance;
//                    nearestFieldPosition = discPos;
//                    nearestField = QPoint(column, row);
//                }
//            }
//        }
//    selectedDisc->setCenter(nearestFieldPosition);

//    if(selectedDisc->getFieldCoord() != nearestField) //we have been moved, change player
//        changePlayer();
//    selectedDisc->setFieldCoord(nearestField);
//    if(jumpIsValid && (nearestField == landingField))
//        removeOverjumpedDisc();
//    selectedDisc->setSelected(false);

//    //become king if in target row
//    if((selectedDisc->getColor() == whiteColor && nearestField.y() == 7)
//     || (selectedDisc->getColor() == blackColor && nearestField.y() == 0))
//    {
//        selectedDisc->becomeKing();
//        emit soundRequest(SoundFileNames[SoundKingWasBorn]);
//    }

//    selectedDisc = NULL;
//    jumpIsValid = false;
//}

void Draughts::changePlayer()
{
    // update score
    m_scene->setBlackScore(blackDiscs.size());
    m_scene->setWhiteScore(whiteDiscs.size());

    if(player == WhitePlayer)
    {
        player = BlackPlayer;
        emit m_scene->currentPlayerChanged("Schwarz");
    }
    else
    {
        player = WhitePlayer;
        emit m_scene->currentPlayerChanged("Weiss");
    }
    emit playerChanged(player);
    rotationAngleStart = rotationAngle;
    if(player == WhitePlayer)
        rotationAngleTarget = 180.0;
    else rotationAngleTarget = 0.0;
    rotationStep = 0;
    emit soundRequest(SoundFileNames[SoundPlayerChanged]);
    // check if next player has a possible move
    if(!isMovePossible())
    {
        m_countImpossibleMoves++;
        if(m_countImpossibleMoves >= 2)
        {
            // 2 moves in a row not possible
            qDebug() << "Game over";
            if(m_scene->getBlackScore() > m_scene->getWhiteScore())
                emit m_scene->winnerChanged("Schwarz hat gewonnen");
            else if(m_scene->getBlackScore() < m_scene->getWhiteScore())
                emit m_scene->winnerChanged("Weiss hat gewonnen");
            else
                emit m_scene->winnerChanged("Unentschieden");
        }else{
            // Change player if only one move wasn't possible
           changePlayer();
        }
    }
    else
    {
        // reset counter if a move was possible
        m_countImpossibleMoves = 0;
    }
}

void Draughts::createDiscIfValid(const QVector3D & lastIntersection)
{
    // check if click is on the Board
    if(chessBoard->isOnBoard(lastIntersection))
    {
        // the field, selected by the mouse click
        QPoint selectedField = chessBoard->getNearestFieldFromPosition(lastIntersection);
        if(checkIfPlacementValid(selectedField))
        {
            if(player == WhitePlayer)
            {
                GLDisc * disc = new GLDisc(selectedField, discRadius, whiteColor, "", discHeight, m_DiscSlices);
                disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
                whiteDiscs.append (disc);
            }else
            {
                GLDisc * disc = new GLDisc( selectedField, discRadius, blackColor, "", discHeight, m_DiscSlices);
                disc->setCenter(chessBoard->fieldToPosition(disc->getFieldCoord()));
                blackDiscs.append (disc);
            }
            changePlayer();
        }
    }
}

bool Draughts::checkIfPlacementValid(const QPoint field)
{
    QList<GLDisc *> * ourDiscs;
    QList<GLDisc *> * otherDiscs;
    if(player == BlackPlayer)
    {
       ourDiscs   = &blackDiscs;
       otherDiscs = &whiteDiscs;
    }
    else
    {
        ourDiscs   = &whiteDiscs;
        otherDiscs = &blackDiscs;
    }

    QList<QPoint> fieldList;    // field directions around the clicked Field
    fieldList << QPoint(-1,0)<< QPoint(-1,1)
              << QPoint(0,1) << QPoint(1,1)
              << QPoint(1,0) << QPoint(1,-1)
              << QPoint(0,-1)<< QPoint(-1,-1);
    bool result = false;
    // only if clicked field is empty
    if(fieldIsEmpty(field))
    {
        // check every field around selected field
        for(int i = 0; i < fieldList.length(); i++)
        {
            // only if an opponent disc is around the selected field
            if(discAt(otherDiscs, field +  fieldList.at(i)) != NULL)
            {
                // last Field is determined through recursion
                QPoint lastField = checkIfNextDiscIsOtherColor(field + fieldList.at(i), fieldList.at(i), otherDiscs);
                if(discAt(ourDiscs, lastField) != NULL)
                {
                    result = true;
                    // change color of found discs
                    for(int j = 0; j < m_toChangeFields.length(); j++)
                    {
                        changeDisc(m_toChangeFields.at(j));
                    }
                }
                // Cache is only for one iteration
                m_toChangeFields.clear();
            }
        }
    }

    return result;
}

QPoint Draughts::checkIfNextDiscIsOtherColor(QPoint startField, QPoint nextFieldDirection, QList<GLDisc *> *otherDiscs)
{
    m_toChangeFields.append(startField);
    GLDisc * currentDisc = discAt(otherDiscs, startField);
    if(currentDisc != NULL)
    {
        return checkIfNextDiscIsOtherColor(startField + nextFieldDirection, nextFieldDirection, otherDiscs);
    }
    return startField;
}

void Draughts::changeDisc(QPoint toChangeField)
{
    GLDisc * disc = NULL;
    if(player == BlackPlayer)
    {
        for(int i = 0; i < whiteDiscs.size(); i++)
            if(whiteDiscs[i]->getFieldCoord() == toChangeField)
            {
                disc = whiteDiscs[i];
                whiteDiscs.removeAt(i);
                disc->setColor(blackColor);
                blackDiscs.append(disc);
                return;
            }
    } else
    {
        for(int i = 0; i < blackDiscs.size(); i++)
        {
            if(blackDiscs[i]->getFieldCoord() == toChangeField)
            {
                disc = blackDiscs[i];
                blackDiscs.removeAt(i);
                disc->setColor(whiteColor);
                whiteDiscs.append(disc);
                return;
            }
        }
    }
}

bool Draughts::isMovePossible()
{
    QList<GLDisc *> * ourDiscs;
    QList<GLDisc *> * otherDiscs;
    if(player == BlackPlayer)
    {
       ourDiscs   = &blackDiscs;
       otherDiscs = &whiteDiscs;
    }
    else
    {
        ourDiscs   = &whiteDiscs;
        otherDiscs = &blackDiscs;
    }

    QList<QPoint> fieldList;    // field directions around the clicked Field
    fieldList << QPoint(-1,0)<< QPoint(-1,1)
              << QPoint(0,1) << QPoint(1,1)
              << QPoint(1,0) << QPoint(1,-1)
              << QPoint(0,-1)<< QPoint(-1,-1);
    bool result = false;
    for(int row = 0; row < 8; row++)
    {
        for(int col = 0; col < 8; col++)
        {
            QPoint field = QPoint(row, col);
            // only if clicked field is empty
            if(fieldIsEmpty(field))
            {
                // check every field around selected field
                for(int i = 0; i < fieldList.length(); i++)
                {
                    // only if an opponent disc is around the selected field
                    if(discAt(otherDiscs, field +  fieldList.at(i)) != NULL)
                    {
                        QPoint lastField = checkIfNextDiscIsOtherColor(field + fieldList.at(i), fieldList.at(i), otherDiscs);
                        if(discAt(ourDiscs, lastField) != NULL)
                        {
                            m_toChangeFields.clear();
                            return true;    //Move is possible, so out of function
                        }
                    }
                }
            }
        }
    }

    m_toChangeFields.clear();
    return result;
}


bool Draughts::fieldIsEmpty(const QPoint & field)
{
    for(int i = 0; i < whiteDiscs.size(); i++)
        if(whiteDiscs[i]->getFieldCoord() == field)
            return false;
    for(int i = 0; i < blackDiscs.size(); i++)
        if(blackDiscs[i]->getFieldCoord() == field)
            return false;

   return true;
}

/**
  * Removes a disc that has been jumped over.
  */
//void Draughts::removeOverjumpedDisc()
//{
//    for(int i = 0; i < whiteDiscs.size(); i++)
//        if(whiteDiscs[i]->getFieldCoord() == jumpOverField)
//        {
//            discToBeRemoved = whiteDiscs[i];
//            removeHeight = 0.0;
//            whiteDiscs.removeAt(i);
//            emit soundRequest(SoundFileNames[SoundDiscToBeRemoved]);
//            return; //no need to scan black discs
//        }

//    for(int i = 0; i < blackDiscs.size(); i++)  //Simon: whiteDiscs auf blackDiscs geaendert
//        if(blackDiscs[i]->getFieldCoord() == jumpOverField)
//        {
//            discToBeRemoved = blackDiscs[i];
//            removeHeight = 0.0;
//            blackDiscs.removeAt(i);
//            emit soundRequest(SoundFileNames[SoundDiscToBeRemoved]);
//            return;
//        }
//}

//void Draughts::checkForSelection(const QVector3D & nearPoint, const QVector3D & farPoint,
//                                 const QVector3D & camera, GLDisc * disc )
//{
//    GLfloat lastDistance = 100000.0;
//    GLfloat distance;
//    if(disc->isHit(nearPoint, farPoint))
//    {
//        if(selectedDisc == NULL) //select it
//        {
//            disc->setSelected(true);
//            selectedDisc = disc;
//        }
//        else  //check if we are nearer
//        {
//            distance = (camera - disc->getCenter()).length();
//            if(distance < lastDistance)
//            {
//                lastDistance = distance;
//                selectedDisc->setSelected(false);
//                disc->setSelected(true);
//                selectedDisc = disc;
//            }
//        }//end if selectedDisc == NULL
//    }//end if isHit
//}

/**
  * Select the disc that is hit and nearest to camera.
  * Returns true, if a disc was selected.
  */
//bool Draughts::selectDisc(const QVector3D & nearPoint, const QVector3D & farPoint,
//                const QVector3D & camera)
//{
//    if(player == WhitePlayer)
//        for (int i = 0; i < whiteDiscs.size(); i++)
//            checkForSelection(nearPoint, farPoint, camera, whiteDiscs[i]);
//    else
//        for (int i = 0; i < blackDiscs.size(); i++)
//            checkForSelection(nearPoint, farPoint, camera, blackDiscs[i]);
//    if(selectedDisc != NULL)
//        emit soundRequest(SoundFileNames[SoundDiscSelected]);
//    return selectedDisc != NULL;
//}

/**
  * Returns true, if movement is allowed by the rules of the game.
  * Implements most of the rules of the game.
  * Makes disc jump, if required.
  */
//bool Draughts::isMovementOk(GLDisc * disc, const QVector3D vMove)
//{
//    QVector3D startingPosition = chessBoard->fieldToPosition(disc->getFieldCoord());
//    QVector3D targetPosition = vMove + disc->getCenter();
//    QVector3D vTotalMove = targetPosition - startingPosition;

//    QList<GLDisc *> * ourDiscs;
//    QList<GLDisc *> * otherDiscs;
//    int forward = 1.0; //forward direction for white discs i +Z, for black discs -Z
//    if(disc->getColor() == whiteColor) //who are we
//    {
//       ourDiscs = &whiteDiscs;
//       otherDiscs = &blackDiscs;
//       forward = 1.0; //forward = Z
//    }
//    else
//    {
//        ourDiscs = &blackDiscs;
//        otherDiscs = &whiteDiscs;
//        forward = -1.0; //forward = -Z
//    }

//   //Check for moving straight ahead
//   if(xzMovement(vTotalMove)) //we want to go straight ahead or sideways
//      return false;

//    //we want to move diagonally
//    vTotalMove = makeDiagonalMovement(vTotalMove);
//    //Check for backwards movement
//    if(! disc->isKing() && (vTotalMove.z() * forward < 0.0))
//        return false;
//    //Check for board limits
//    if(!chessBoard->isOnBoard( chessBoard->fieldToPosition( disc->getFieldCoord()) + vTotalMove))
//        return false;

//    //Get coordinates of jumpOverField and landingField in moving direction
//    GLDisc * otherDisc = NULL;
//    if(!jumpIsValid) //we did not yet start a jump
//    {
//       jumpIsValid = calculateTargetFields(disc->getFieldCoord(), vTotalMove);
//        //Check for a blocking disc of ours
//        if(discAt(ourDiscs, jumpOverField) != NULL)
//           jumpIsValid = false;
//       //Check for overjumpable other discs in front of us
//         otherDisc = discAt(otherDiscs, jumpOverField);
//        jumpIsValid = otherDisc != NULL;
//        //There is an overjumpable disc in front of us, check for a free landing site behind it
//        if(discAt(otherDiscs, landingField) != NULL)
//            jumpIsValid = false;
//        else if(discAt(ourDiscs, landingField) != NULL)
//            jumpIsValid = false;
//    }
//    //There is a free landingsite available, let our disc jump
//    bool jumpOverKing = (otherDisc != NULL) && otherDisc->isKing();
//    if(jumpIsValid)
//       chessBoard->raiseDisc(disc, jumpOverField, jumpOverKing);

//    //Check for more than 1 field ahead
//    if(! disc->isKing())
//    {
//       if(vTotalMove.length() > 2.83 * chessBoard->getSquareSize()) // max 2 fields when jumping
//          return false;
//       if(!jumpIsValid && (vTotalMove .length() > 1.41 * chessBoard->getSquareSize()))// max 1 field normally
//          return false;
//    }

//    return true;
//}

GLDisc * Draughts::discAt(QList <GLDisc *> * list, const QPoint & field)
{
    for(int i = 0; i < list->size(); i++)
       if(list->at(i)->getFieldCoord() == field)
          return (*list)[i];
    return NULL;
}

bool Draughts::xzMovement(const QVector3D & vMove)
{
    GLfloat x = vMove.x();
    GLfloat z = vMove.z();
    return fabs(z) > 4.0 * fabs(x) || fabs(x) > 4.0 * fabs(z); //we want to go straight ahead or sideways
}

/** Returns a vector with |x| = |z|
  */
QVector3D Draughts::makeDiagonalMovement(QVector3D vMove)
{
    bool negativeZ = vMove.z() < 0.0;
    bool negativeX = vMove.x() < 0.0;
    GLfloat absX = fabs(vMove.x());
    GLfloat absZ = fabs(vMove.z());
    GLfloat x = vMove.x();
    GLfloat z = vMove.z();
    if(absX > absZ)
    {
        if(negativeZ)
          z = -absX;
        else
          z = absX;
    }
    else
    {
        if(negativeX)
          x = -absZ;
        else
          x = absZ;
    }
    return QVector3D(x, 0.0, z);
}

/**
  * Calculates jumpOverField and landingField
  */
//bool Draughts::calculateTargetFields(QPoint startField, QVector3D vMove)
//{
//    int dX = ceil(fabs(vMove.x() / chessBoard->getSquareSize()));
//    if(vMove.x() < 0.0)
//        dX = -dX;
//    int dY = ceil(fabs(vMove.z() / chessBoard->getSquareSize()));
//    if(vMove.z() < 0.0)
//        dY = -dY;
//    jumpOverField = QPoint(startField.x() + dX, startField.y() + dY);
//    if(dX > 0)
//        dX = 1;
//    else dX = -1;
//    if(dY > 0)
//        dY = 1;
//    else dY = -1;
//    landingField = QPoint(jumpOverField.x() + dX, jumpOverField.y() + dY);
//    if(landingField.x() < 0 || landingField.x() > 7 || landingField.y() < 0 || landingField.y() > 7) //stay on the board
//        return false;
//    else return true;
//}

/**
  * Move a disc (man) according to the draughts (checkers) game rules.
  */
//QVector3D Draughts::moveDisc(const QVector3D & vMove)
//{
//    if(selectedDisc == NULL)
//        return v_Zero;
//    QList<GLDisc *> * ourDiscs;
//    QList<GLDisc *> * otherDiscs;
//    QVector3D oldPos = selectedDisc->getCenter();
//    QVector3D newPos = selectedDisc->getCenter();

//    if(selectedDisc->getColor() == whiteColor) //who are we
//    {
//       ourDiscs = &whiteDiscs;
//       otherDiscs = &blackDiscs;
//    }
//    else
//    {
//        ourDiscs = &blackDiscs;
//        otherDiscs = &whiteDiscs;
//    }

//    //check for rules of the game
//    if(!isMovementOk(selectedDisc, vMove))
//        return v_Zero;
//    //let us move and see what happens
//    selectedDisc->move(vMove);
//    //Check for collisions with our men
//    for(int i = 0; i < ourDiscs->size(); i++)
//    {
//        if(selectedDisc->isColliding(ourDiscs->at(i)))
//            selectedDisc->move(-vMove); //we have to go back
//    }
//    //Check for collisions with other men
//    for(int i = 0; i < otherDiscs->size(); i++)
//    {
//        if(selectedDisc->isColliding(otherDiscs->at(i)))
//            selectedDisc->move(-vMove); //we have to go back
//    }
//    return newPos - oldPos;
//}

/**
  * Draws the  game on current context.
  */
void Draughts::draw(GLESRenderer *renderer)
{
    renderer->pushMvMatrix(); //save the old mv-matrix
    m_mvMatrix = renderer->getMvMatrix();
//#ifndef Q_OS_ANDROID
//    if(m_joystick)
//    {
//        float axisValues[8];
//        int buttonState;
//        m_joystick->read(&buttonState, axisValues);
//        rotationAngle = axisValues[0] * 180.0;
//        m_scene->setEye(QVector3D(1.0,1.0,1.0) * 10.0 * (axisValues[2] + 1.1));
//    }
//#endif
    m_mvMatrix.rotate(rotationAngle, v_Y);
    renderer->setMvMatrix(m_mvMatrix);
    chessBoard->draw(renderer);

    for (int i = 0; i < whiteDiscs.size(); i++)
        whiteDiscs[i]->draw(renderer);
    for (int i = 0; i < blackDiscs.size(); i++)
        blackDiscs[i]->draw(renderer);

    if(discToBeRemoved != NULL)
        discToBeRemoved->draw(renderer);

//#ifdef DEBUG_DRAUGHTS
//    //draw a green dot for the field to be jumped over and  a red or green dot for landing field
//    glPointSize(10);
//    QVector3D jumpPoint = chessBoard->fieldToPosition(jumpOverField);
//    jumpPoint.setY(0.3);
//    QVector3D landingPoint = chessBoard->fieldToPosition(landingField);
//    landingPoint.setY(0.1);
//    glDisable(GL_LIGHTING);
//    glBegin(GL_POINTS);
//            glColor3fv(cl_Green.fv());
//            glVertex3dv(jumpPoint.dv());
//            if(jumpIsValid)
//              glColor3fv(cl_Blue.fv());
//            else glColor3fv(cl_Red.fv());
//            glVertex3dv(landingPoint.dv());
//   glEnd();
//#endif

   renderer->popMvMatrix();//restore the old mv-matrix
}

/**
  * Perform animation here
  */
void Draughts::slotAnimation()
{
    if(rotationStep <= 100)
    {
     rotationAngle = rotationAngleStart + rotationStep *(rotationAngleTarget - rotationAngleStart) / 100.0;
     rotationStep++;
     //qDebug("%lf", rotationAngle);
    }

//    if(discToBeRemoved != NULL)
//    {
//        if(removeHeight > -3.0)
//        {
//            removeHeight -= 0.01;
//            discToBeRemoved->move(QVector3D(0.0, removeHeight, 0.0));
//        }
//        else
//        {
//           delete discToBeRemoved;
//           discToBeRemoved = NULL;
//        }
//    }
    if(m_scene->getNewGamePressed())
    {
        if(removeHeight > -3.0)
        {
            qDebug() << "removeHeight: " << removeHeight;
            removeHeight -= 0.01;
            for (int i = 0; i < whiteDiscs.size(); i++)
                whiteDiscs[i]->move(QVector3D(0.0, removeHeight, 0.0));
            for (int i = 0; i < blackDiscs.size(); i++)
                blackDiscs[i]->move(QVector3D(0.0, removeHeight, 0.0));
        }
    }
}
