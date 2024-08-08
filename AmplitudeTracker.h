#ifndef AMPLITUDETRACKER_H
#define AMPLITUDETRACKER_H

#include <QObject>

class AmplitudeTracker : public QObject {
    Q_OBJECT
public:
    explicit AmplitudeTracker(QObject *parent = nullptr);
    Q_INVOKABLE void trackEvent(const QString &eventName);
};

#endif // AMPLITUDETRACKER_H
