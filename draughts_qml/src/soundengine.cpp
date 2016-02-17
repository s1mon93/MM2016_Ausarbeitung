#include "soundengine.h"
#include <QFile>
#include <QDebug>

SoundEngine::SoundEngine(QObject *parent) :
    QObject(parent)
{
    enabled = false;
}

/**
  * Load and play soundfile or resource.
  */
void SoundEngine::playSound(const QString & fileName)
{
    if(enabled)
    {
        QMap<QString, QSound * >::iterator it = m_sounds.find(fileName);
        if(it == m_sounds.end())//not yet loaded
        {
            if(!QFile::exists(fileName))
            {
                qDebug()<< "SoundEngine::playSound File not found: " << fileName;
                return;
            }
            qDebug() << "SoundEngine::playSound loading sound: " << fileName;
           QSound * sound = new QSound(fileName, this);
           it = m_sounds.insert( fileName, sound);
        }
        it.value()->play();
    }
}

