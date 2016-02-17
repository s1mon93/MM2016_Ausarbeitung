/****************************************************************************
 *                     Copyright by Walter Roth 2012                        *
 *                       Licence: GPL                                       *
 ****************************************************************************/
#ifndef SOUNDENGINE_H
#define SOUNDENGINE_H

#include <QObject>
#include <QString>
#include <QSound>
#include <QMap>

/**
  * Plays sound files when playSound is called. Needs the Phonon library to be installed.
  * Use setEnabled to switch sound playing off/on.
  */
class SoundEngine : public QObject
{
    Q_OBJECT
public:
    explicit SoundEngine(QObject *parent = 0);

    void setEnabled(bool newVal){enabled = newVal;}
    bool isEnabled(){return enabled;}

signals:
    
public slots:
    /**
      * Load and play soundfile or resource.
      */
    void playSound(const QString & fileName);

private:
    QMap<QString, QSound *> m_sounds;
    bool enabled;
};

#endif // SOUNDENGINE_H
