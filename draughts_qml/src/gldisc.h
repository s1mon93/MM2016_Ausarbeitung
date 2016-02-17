#ifndef GLDISC_H
#define GLDISC_H

#include "glbody.h"
/**
 * @brief The GLDisc class A disc to be used for a draughts (checkers)game.
 * When becomeKing was called, disc height is multiplied by two.
 */
class GLDisc : public GLBody
{
public:
    GLDisc(const QPoint & fieldCoord, float m_radius = 1.0, const GLColorRgba & m_color = GLColorRgba::clBlue,
           const QString m_textureFile = "", double height = 0.5, int slices = 36);
    /**
    *
    * @param pointContainer The container for the geometry data. If NULL, a new one is created.
    * @param indexContainer The container for the index data. If NULL, a new one is created.
    * Created containers will be deleted by destructor.
    */
    void makeSurface(QVector<GLPoint> * pointContainer = NULL, QVector<GLuint> * indexContainer = NULL);

    /**
     * @brief becomeKing Set the m_king Flag. This causes surface height to be multiplied by two.
     */
    void becomeKing();

    /**
     * @brief setFieldCoord
     * @param FieldCoord The coordinate of the field. Unit is fields.
     */
    void setFieldCoord(const QPoint &FieldCoord);

    //simple getters
    double getHeight()const{ return m_height;}
    double getDiscRadius()const{return m_discRadius;}
    QPoint getFieldCoord() const;
    bool isKing()const {return m_isKing;}
    /**
      * Returns true, if discs are colliding
      */
    bool isColliding(const GLDisc * other)const;

private:
    double m_height;
    int m_slices;
    QPoint m_FieldCoord;
    bool m_isKing;
    double m_discRadius;
};

#endif // GLDISC_H
