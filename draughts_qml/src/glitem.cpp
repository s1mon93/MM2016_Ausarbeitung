#include "glitem.h"
#include "glesrenderer.h"
#include "gldefines.h"
#include "glcolorrgba.h"

#include <QDebug>
#include <QString>
#include <QQuickWindow>
#include <QtQuick/QQuickItem>
#include <QtGui/QOpenGLShaderProgram>
#include <QtGui/QOpenGLContext>
#include <QSGSimpleRectNode>

#include <math.h>

#ifdef Q_OS_ANDROID
#ifndef GLES
 #define GLES  //Android uses GLES 2.0
#endif
#endif


GLItem::GLItem(QQuickItem *parent,
               const QString &vertexShaderFilename,
               const QString &fragmentShaderFilename) :
    QQuickItem(parent)
{
    m_fragmentShaderFilename = fragmentShaderFilename;
    m_vertexShaderFilename = vertexShaderFilename;
    setFlag(ItemHasContents);
    m_geometryIsValid = false;
    m_colorArrayEnabled = false;
    m_texturesEnabled = false;
    m_lightingEnabled = true;
    m_activatePaintBeforeQml = false;
    m_activatePaintAfterQml = true;

    m_lightDirection = v_XYZ;
    m_backgroundColor = GLColorRgba::clRed;

    m_eye = 10.0 * v_XYZ;
    m_center = v_Zero;
    m_up = v_Y;
    //pespective
    m_fovy = 45.0;
    m_aspect = 1.0;
    m_near = 1.0;
    m_far = 100.0;
    m_orthoMode = true;
    m_orthoRange = 1.0;
    m_drawAxes = false;
    m_drawFrames = false;
    m_drawMouseRays = false;

    //The windowChanged signal is emitted by QQuickItem when it is added to the scenegraph.
    //This is the first time when a valid window exists.
    connect(this, SIGNAL(windowChanged(QQuickWindow*)),
            this, SLOT(handleWindowChanged(QQuickWindow*)));
    m_geometryIsValid = false; //invalidate geometry, we may need to set it up for the new window
    m_timer = new QTimer(this);
    m_timer->setInterval(20);
    connect(m_timer, SIGNAL(timeout()),
            this, SLOT(onTimerTimeout()), Qt::DirectConnection);
    m_guiThreadRotation = 0.0;
    m_renderThreadRotation = 0.0;
    m_renderer = NULL;
    m_viewportX = 0;
    m_viewportY = 0;
    setFlags(flags() | QQuickItem::ItemHasContents);
    m_firstAxesPoint = 0;
    m_lastAxesPoint = 0;
}

GLItem::~GLItem()
{
   deleteRenderer();
}

/**
 * @brief GlItem::updatePaintNode
 * @param node Returns the root of the subtree to be rendered ON TOP of scene rendered
 * in paint().
 * @return
 */

QSGNode * GLItem::updatePaintNode(QSGNode *node, UpdatePaintNodeData *)
{
 //   qDebug() << "GlItem::updatePaintNode called";
    Q_UNUSED(node);
    return NULL; //remove this line and uncomment the rest of this function to draw a blue rectangle
//    //Example code for a blue rectangle
//        QSGSimpleRectNode *rect = static_cast<QSGSimpleRectNode *>(node);
//    if (!rect) {
//        rect = new QSGSimpleRectNode();
//    }
//    double w = 100;
//    if(window())
//        w = window()->width();
//    rect->setRect(0, 0, w, 100);
//    rect->setColor(Qt::blue);
//    return rect;

}

bool GLItem::movementActivated()
{
    return (m_timer && m_timer->isActive());
}

void GLItem::paintBefore()
{
 //   qDebug() << "GlItem::paintBefore() called";
    if(!m_renderer)
      initializeRenderer();
    if(!m_geometryIsValid)
        setupGeometry();
    if(!isVisible())
        return;
    setupView(true, true);
    m_renderer->bind();
    paintUnderQmlScene();
    m_renderer->release();
    window()->resetOpenGLState();
}

void GLItem::paintAfter()
{
  //  qDebug() << "GlItem::paintBefore() called";

    if(!m_renderer)
      initializeRenderer();
    if(!m_geometryIsValid)
        setupGeometry();
    if(!isVisible())
        return;
    setupView(false, true); // enables scissor test
    m_renderer->bind();
    if(m_drawAxes)
        drawAxes();
    paintOnTopOfQmlScene();
    m_renderer->release();
    glDisable(GL_SCISSOR_TEST);
    window()->resetOpenGLState();
}

void GLItem::initializeRenderer()
{
    qDebug() <<"GlItem::initializeRenderer called.";
    if(!m_renderer)
       m_renderer = new GLESRenderer(NULL, m_vertexShaderFilename, m_fragmentShaderFilename);

}

void GLItem::deleteRenderer()
{
    qDebug() <<"GlItem::deleteRenderer() called.";
    if(m_renderer)
    {
       delete m_renderer;
       m_renderer = NULL;
    }
}

void GLItem::synchronizeThreads()
{
    m_renderThreadRotation = m_guiThreadRotation;
}

void GLItem::toggleMove()
{
    qDebug() << "GlItem::move() called";
    if(m_timer->isActive())
        m_timer->stop();
    else m_timer->start();
    emit movementActivatedChanged(m_timer->isActive());
}
void GLItem::startTimer()
{
    m_timer->start();
    emit movementActivatedChanged(m_timer->isActive());
}

void GLItem::stopTimer()
{
    m_timer->stop();
    emit movementActivatedChanged(m_timer->isActive());
}

void GLItem::mousePressed(int x, int y)
{
    qDebug() << "GlItem::mousePressed at x:" << x << " y: " << y;
}

void GLItem::mousePositionChanged(int x, int y)
{
    qDebug() << "GlItem::mouse position changed to  x:" << x << " y: " << y;
}

void GLItem::mouseReleased(int x, int y)
{
    qDebug() << "GlItem::mouse released at  x:" << x << " y: " << y;
}

void GLItem::setViewportX(int arg)
{
    if (m_viewportX == arg)
        return;

    m_viewportX = arg;
    emit viewportXChanged(arg);
}

void GLItem::setViewportY(int arg)
{
    if (m_viewportY == arg)
        return;

    m_viewportY = arg;
    emit viewportYChanged(arg);
}

void GLItem::setupView(bool clearColor, bool clearDepth)
{
    if(!m_renderer)
        return;

    qreal ratio = window()->devicePixelRatio();
    int vx = int(ratio * m_viewportX);
    int vy = int(ratio * m_viewportY); // y from bottom upwards!
    int vw = int(ratio * width());
    int vh = int(ratio * height());
    glViewport(vx, vy, vw, vh);
    //qDebug() << "viewport x: " << vx << " y: " << vy << " w: " << vw << " h: " << vh;
    m_renderer->setViewport(vx, vy, vw, vh);
    glEnable(GL_SCISSOR_TEST);
    glScissor(vx,vy,vw,vh);

    m_aspect = (double)vw / (double)vh;
    if(! m_orthoMode ){
        m_renderer->setPerspective(m_fovy,
                              m_aspect,
                              m_near,
                              m_far);
    }
    else {
        m_renderer->setOrtho(-m_orthoRange * m_aspect, m_orthoRange * m_aspect,
                             -m_orthoRange, m_orthoRange, 0.1, 100.0); // for debugging
    }
    m_renderer->setLookAt(m_eye, //eye
                          m_center, //center
                          m_up);//up
    //setup light before turning
    m_renderer->setLightDirection(m_lightDirection);
    m_renderer->setLightingEnabled(true);
    //now turn
    m_renderer->transform(m_cameraTransform);

    m_renderer->rotate(m_renderThreadRotation, QVector3D(0.0,1.0,0.0));

    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    glDepthMask(true);

#ifndef GLES
    glClearDepth(1.0);
#endif
    GLuint clearMode = 0;
    if(clearColor)
        clearMode |= GL_COLOR_BUFFER_BIT;
    if(clearDepth)
            clearMode |= GL_DEPTH_BUFFER_BIT;
    glClear(clearMode);
    glClearColor(m_backgroundColor.red(), m_backgroundColor.green(),
                 m_backgroundColor.blue(), m_backgroundColor.alpha());
    glClear(clearMode);


    glEnable(GL_BLEND);
    glBlendFunc(1.0, 0.0);
    //   glPolygonMode(GL_FRONT, GL_FILL);
    //   glPolygonMode(GL_BACK, GL_LINES);
}

/**
 * @brief GlItem::handleWindowChanged
 *
 * Connect to the window's signals. This can not be done in the constructor, because at that time
 * there is no valid window yet.
 * @param win The window in which this QQuickItem will be painted.
 */
void GLItem::handleWindowChanged(QQuickWindow *win)
{
    qDebug() << "GlItem::handleWindowChanged() called.";
    if (win) {
        // Connect the beforeRendering signal to our paint function.
        // Since this call is executed on the rendering thread it must be
        // a Qt::DirectConnection
        if(m_activatePaintBeforeQml)
           connect(win, SIGNAL(beforeRendering()),
                   this, SLOT(paintBefore()), Qt::DirectConnection);
        if(m_activatePaintAfterQml)
        connect(win, SIGNAL(afterRendering()),
                this, SLOT(paintAfter()), Qt::DirectConnection);
        connect(win, SIGNAL(beforeSynchronizing()),
                this, SLOT(synchronizeThreads()), Qt::DirectConnection);
        if(win->openglContext())
             connect(win->openglContext(), SIGNAL(aboutToBeDestroyed()), //cleanup context before destroying window
                    this, SLOT(deleteRenderer()), Qt::DirectConnection);
        // If we allow QML to do the clearing, they would clear what we paint
        // and nothing would show.
        win->setClearBeforeRendering(false);
    }
}

void GLItem::onTimerTimeout()
{
    //qDebug() << "GlItem::onTimerTimeout() called";
    m_guiThreadRotation += 2.0;
    if (window())
        window()->update();
    update();
}

void GLItem::setupGeometry()
{
    m_geometryIsValid = true;
}


void GLItem::paintUnderQmlScene()
{
    qDebug() << "GlItem::paintUnderQmlScene() was called. Overwrite this function to paint your scene!";
}

void GLItem::paintOnTopOfQmlScene()
{
    qDebug() << "GlItem::paintOnTopOfQmlScene() was called. Overwrite this function to paint your scene!";
}

void GLItem::drawAxes()
{
    if(m_lastAxesPoint - m_firstAxesPoint == 0) //We have no axes
    {
        qDebug() << "GLItem::drawAxes(): No axes data available.";
        return;
    }
    GLfloat lineWidth[4]; //4 floats, just for safety
    glGetFloatv(GL_LINE_WIDTH, lineWidth);
    glLineWidth(3.0);
    m_renderer->setColorArrayEnabled(true);

    m_renderer->setLightingEnabled(false);
    int stride = sizeof(GLPoint);
    m_renderer->activateAttributeArray(GLESRenderer::VERTEX_LOCATION,
                                       m_points[0].vertexPointer(), stride);
    m_renderer->activateAttributeArray(GLESRenderer::COLOR_LOCATION,
                                       m_points[0].colorPointer(), stride);
    glDrawArrays(GL_LINES, m_firstAxesPoint, m_lastAxesPoint - m_firstAxesPoint + 1); //Coordinate Axes
    m_renderer->disableAttributeArrays();
    //restore old settings
    m_renderer->setColorArrayEnabled(m_colorArrayEnabled);
    m_renderer->setLightingEnabled(m_lightingEnabled);
    glLineWidth(lineWidth[0]);
}


void GLItem::createAxis(double length, const QVector3D & origin, const QVector3D & axis,
                 const QVector3D & normal, const QVector3D & texCoord,
                 const GLColorRgba& color)
{
    int ticks = floor(length);
    double tickLength = 0.2;
    m_points.append(GLPoint(origin - axis * length, normal, texCoord,color));
    m_points.append(GLPoint(origin + axis * length, normal, texCoord,color));
    for(int tick = -ticks; tick <= ticks; tick++)
    {
        m_points.append(GLPoint(origin + axis * tick, normal, texCoord, color));
        if(tick%5 == 0)
            m_points.append(GLPoint(origin + axis * tick + normal * tickLength * 2, normal, texCoord, color));
        else m_points.append(GLPoint(origin + axis * tick + normal * tickLength, normal, texCoord, color));
    }
    QVector3D normal2 = QVector3D::crossProduct(axis, normal).normalized();
    for(int tick = -ticks; tick <= ticks; tick++)
    {
        m_points.append(GLPoint(origin + axis * tick, normal2, texCoord, color));
        if(tick%5 == 0)
            m_points.append(GLPoint(origin + axis * tick + normal2 * tickLength * 2, normal2, texCoord, color));
        else m_points.append(GLPoint(origin + axis * tick + normal2 * tickLength, normal2, texCoord, color));
    }

}

void GLItem::createAxes(double length)
{

    m_firstAxesPoint = m_points.size();

    //X-axis
    QVector3D origin = v_Zero;
    QVector3D axis = v_X;
    QVector3D normal = v_Y;
    QVector3D texCoord = v_Zero;
    GLColorRgba color = cl_Red;

    createAxis(length, origin, axis, normal, texCoord, color);
    //Y-Axis
    axis = v_Y;
    normal = v_Z;
    color= cl_Green;
    createAxis(length, origin, axis, normal, texCoord, color);

    //Z-Axis
    axis = v_Z;
    normal = v_X;
    color= cl_Blue;
    createAxis(length, origin, axis, normal, texCoord, color);

    m_lastAxesPoint = m_points.size() - 1;
}
